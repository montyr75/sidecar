import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../utils/screen_utils.dart';
import '../../../../widgets/png_icon.dart';

class PowerPlantGauge extends StatelessWidget {
  static const size = 250.0;

  final int value;
  final VoidCallback onPressedInc;
  final VoidCallback onPressedDec;

  const PowerPlantGauge({
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
                    color: Colors.red,
                    fontSize: 15,
                  ),
                  showLabels: true,
                  showLastLabel: true,
                  showTicks: true,
                  showAxisLine: false,
                  startAngle: 300,
                  endAngle: 60,
                  isInversed: true,
                  pointers: [
                    RangePointer(
                      value: value.toDouble(),
                      color: Colors.redAccent,
                      enableAnimation: true,
                      animationDuration: 500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(-0.28, 0),
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
                  message: "Power Plant",
                  child: PngIcon(
                    name: 'power_plant',
                    color: Colors.red,
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
