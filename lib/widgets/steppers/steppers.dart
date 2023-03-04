import 'package:flutter/material.dart';

import 'drag_stepper.dart';

class BgWidgetStepper extends StatelessWidget {
  final int initialValue;
  final int maxValue;
  final Color color;
  final Widget backgroundWidget;
  final ValueChanged<int> onChanged;

  const BgWidgetStepper({
    Key? key,
    required this.initialValue,
    required this.maxValue,
    this.color = Colors.black,
    required this.backgroundWidget,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragStepper(
      initialValue: initialValue,
      minValue: 0,
      maxValue: maxValue,
      withFastCount: true,
      dragButtonColor: Colors.transparent,
      counterStyle: TextStyle(
        color: color,
        fontFamily: "Digital7",
        fontSize: 28,
      ),
      chevronColor: Colors.white,
      onChanged: onChanged,
      backgroundWidget: backgroundWidget,
    );
  }
}

class CarStepper extends StatelessWidget {
  final String label;
  final int initialValue;
  final int maxValue;
  final Color color;
  final ValueChanged<int> onChanged;

  const CarStepper({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.maxValue,
    required this.color,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(color: color),
        ),
        DragStepper(
          initialValue: initialValue,
          minValue: 0,
          maxValue: maxValue,
          withFastCount: true,
          dragButtonColor: Colors.black,
          counterStyle: TextStyle(
            color: color,
            fontFamily: "Digital7",
            fontSize: 28,
          ),
          chevronColor: Colors.white,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

