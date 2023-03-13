import 'package:flutter/material.dart';

import '../../../../utils/screen_utils.dart';
import '../../../../utils/utils.dart';

class ControlReadout extends StatelessWidget {
  final int value;

  const ControlReadout({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++) ControlIndicator(active: i < value),
          ].joinWidgetList(boxM).toList(),
        ),
        boxM,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 3; i < 6; i++) ControlIndicator(active: i < value),
          ].joinWidgetList(boxM).toList(),
        ),
      ],
    );
  }
}

class ControlIndicator extends StatelessWidget {
  final bool active;

  const ControlIndicator({Key? key, this.active = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 13,
      decoration: BoxDecoration(
        color: active ? Colors.green : Colors.black,
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          "Control",
          style: TextStyle(
            color: active ? Colors.black : Colors.grey,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
            fontSize: 8,
          ),
        ),
      ),
    );
  }
}
