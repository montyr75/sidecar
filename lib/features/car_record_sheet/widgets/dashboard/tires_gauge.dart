import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../utils/screen_utils.dart';
import '../../../../widgets/png_icon.dart';

class TiresGauge extends StatelessWidget {
  static const size = 250.0;

  final int value;
  final VoidCallback onPressedInc;
  final VoidCallback onPressedDec;

  const TiresGauge({
    Key? key,
    required this.value,
    required this.onPressedInc,
    required this.onPressedDec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          SizedBox(
            width: size,
            height: size,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  minimum: 0,
                  maximum: 10,
                  interval: 1,
                  canScaleToFit: true,
                  labelsPosition: ElementsPosition.outside,
                  ticksPosition: ElementsPosition.outside,
                  minorTicksPerInterval: 0,
                  axisLabelStyle: const GaugeTextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                  showLabels: true,
                  showLastLabel: true,
                  showTicks: true,
                  showAxisLine: false,
                  startAngle: 120,
                  endAngle: 240,
                  pointers: [
                    RangePointer(
                      value: value.toDouble(),
                      color: Colors.blueAccent,
                      enableAnimation: true,
                      animationDuration: 500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0.28, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.chevron_left_rounded),
                  ),
                  onPressed: value < 10 ? onPressedInc : null,
                ),
                boxL,
                const Tooltip(
                  message: "Tires",
                  child: PngIcon(
                    name: "tire",
                    color: Colors.blue,
                  ),
                ),
                boxL,
                IconButton(
                  icon: const RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.chevron_right_rounded),
                  ),
                  onPressed: value > 0 ? onPressedDec : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
