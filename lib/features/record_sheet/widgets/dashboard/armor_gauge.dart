import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../models/enums.dart';
import 'condition_monitor.dart';

class ArmorGauge extends StatelessWidget {
  final Location loc;
  final int value;
  final int max;
  final bool fire;
  final bool paint;
  final VoidCallback onPressedInc;
  final VoidCallback onPressedDec;
  final VoidCallback onFirePressed;
  final VoidCallback onPaintPressed;

  bool get horizontal => loc == Location.front || loc == Location.back;
  bool get conditionsFirst => loc == Location.front || loc == Location.left;

  const ArmorGauge({
    Key? key,
    required this.loc,
    required this.value,
    this.fire = false,
    this.paint = false,
    this.max = 10,
    required this.onPressedInc,
    required this.onPressedDec,
    required this.onFirePressed,
    required this.onPaintPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      _buildDecButton(),
      _buildGauge(),
      _buildIncButton(),
    ];

    final conditionMonitor = ConditionMonitor(
      direction: horizontal ? Axis.horizontal : Axis.vertical,
      fire: fire,
      paint: paint,
      onFirePressed: onFirePressed,
      onPaintPressed: onPaintPressed,
    );

    return Flex(
      direction: horizontal ? Axis.vertical : Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (conditionsFirst) conditionMonitor,
        Flex(
          direction: horizontal ? Axis.horizontal : Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          children: horizontal ? children : children.reversed.toList(),
        ),
        if (!conditionsFirst) conditionMonitor,
      ],
    );
  }

  Widget _buildGauge() {
    final mainAxisSize = (25 * max).toDouble();
    const crossAxisSize = 55.0;

    double width;
    double height;
    LinearGaugeOrientation orientation;
    bool isMirrored;

    if (horizontal) {
      width = mainAxisSize;
      height = crossAxisSize;
    } else {
      width = crossAxisSize;
      height = mainAxisSize;
    }

    switch (loc) {
      case Location.front:
        orientation = LinearGaugeOrientation.horizontal;
        isMirrored = true;
        break;
      case Location.back:
        orientation = LinearGaugeOrientation.horizontal;
        isMirrored = false;
        break;
      case Location.left:
        orientation = LinearGaugeOrientation.vertical;
        isMirrored = true;
        break;
      case Location.right:
      default:
        orientation = LinearGaugeOrientation.vertical;
        isMirrored = false;
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: SfLinearGauge(
        orientation: orientation,
        isMirrored: isMirrored,
        minimum: 0,
        maximum: max.toDouble(),
        interval: 1,
        minorTicksPerInterval: 0,
        axisLabelStyle: const TextStyle(
          color: Colors.grey,
        ),
        markerPointers: [
          LinearWidgetPointer(
            value: value.toDouble(),
            enableAnimation: true,
            animationDuration: 500,
            child: SizedBox(
              width: 24,
              height: 24,
              child: Tooltip(
                message: "$loc Armor",
                child: Stack(
                  children: [
                    const Icon(
                      Icons.shield_sharp,
                      color: Colors.grey,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        loc.toString()[0],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncButton() {
    return IconButton(
      icon: RotatedBox(
        quarterTurns: horizontal ? 0 : 3,
        child: const Icon(Icons.chevron_right_rounded),
      ),
      onPressed: value < max ? onPressedInc : null,
    );
  }

  Widget _buildDecButton() {
    return IconButton(
      icon: RotatedBox(
        quarterTurns: horizontal ? 0 : 3,
        child: const Icon(Icons.chevron_left_rounded),
      ),
      onPressed: value > 0 ? onPressedDec : null,
    );
  }
}
