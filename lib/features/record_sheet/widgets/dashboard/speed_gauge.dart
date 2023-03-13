import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../utils/screen_utils.dart';
import '../../../../widgets/png_icon.dart';

class SpeedGauge extends StatelessWidget {
  static const size = 175.0;

  final int value;
  final int maxSpeed;
  final VoidCallback onPressedInc;
  final VoidCallback onPressedDec;

  const SpeedGauge({
    Key? key,
    required this.value,
    required this.maxSpeed,
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
                  maximum: 120,
                  interval: 20,
                  canScaleToFit: false,
                  labelsPosition: ElementsPosition.inside,
                  ticksPosition: ElementsPosition.inside,
                  axisLabelStyle: const GaugeTextStyle(
                    color: Colors.white24,
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                  ),
                  showLabels: true,
                  showLastLabel: true,
                  showTicks: true,
                  showAxisLine: true,
                  startAngle: 180,
                  endAngle: 0,
                  axisLineStyle: const AxisLineStyle(thickness: 15),
                  ranges: [
                    _buildSpeedGaugeRange(
                      startValue: 0,
                      endValue: 20,
                      speed: 0,
                    ),
                    _buildSpeedGaugeRange(
                      startValue: 20,
                      endValue: 40,
                      speed: 1,
                    ),
                    _buildSpeedGaugeRange(
                      startValue: 40,
                      endValue: 60,
                      speed: 2,
                    ),
                    _buildSpeedGaugeRange(
                      startValue: 60,
                      endValue: 80,
                      speed: 3,
                    ),
                    _buildSpeedGaugeRange(
                      startValue: 80,
                      endValue: 100,
                      speed: 4,
                    ),
                    _buildSpeedGaugeRange(
                      startValue: 100,
                      endValue: 120,
                      speed: 5,
                    ),
                  ],
                  pointers: [
                    NeedlePointer(
                      value: value != 0 ? (value * 20 + 10) : value.toDouble(),
                      needleColor: Colors.yellowAccent,
                      needleEndWidth: 3,
                      knobStyle: const KnobStyle(
                        color: Colors.black,
                        borderColor: Colors.yellow,
                        borderWidth: .01,
                      ),
                      enableAnimation: true,
                      animationDuration: 500,
                    ),
                  ],
                  annotations: value == 0
                      ? const [
                          GaugeAnnotation(
                            verticalAlignment: GaugeAlignment.far,
                            widget: Text(
                              "Stopped/R1",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                              ),
                            ),
                            angle: 90,
                            positionFactor: 0.5,
                          ),
                        ]
                      : null,
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: value > 0 ? onPressedDec : null,
                ),
                boxL,
                const Tooltip(
                  message: "Speed",
                  child: PngIcon(
                    name: "speed",
                    color: Colors.yellow,
                  ),
                ),
                boxL,
                IconButton(
                  icon: const Icon(Icons.chevron_right_rounded),
                  onPressed: value < maxSpeed ? onPressedInc : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GaugeRange _buildSpeedGaugeRange({
    required double startValue,
    required double endValue,
    required int speed,
  }) {
    return GaugeRange(
      startValue: startValue,
      endValue: endValue,
      color: Colors.black,
      startWidth: 16,
      endWidth: 16,
      label: speed.toString(),
      labelStyle: GaugeTextStyle(
        fontSize: 15,
        color: speed <= maxSpeed ? Colors.yellow : Colors.grey,
      ),
    );
  }
}
