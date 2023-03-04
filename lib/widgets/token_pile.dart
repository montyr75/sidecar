import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';
import '../utils/utils.dart';

class TokenPile extends StatelessWidget {
  final int value;
  final int max;
  final WidgetBuilder tokenBuilder;
  final WidgetBuilder emptyBuilder;
  final VoidCallback onPressedInc;
  final VoidCallback onPressedDec;
  final double width;
  final double minHeight;

  const TokenPile({
    Key? key,
    required this.value,
    this.max = 12,
    required this.tokenBuilder,
    required this.emptyBuilder,
    required this.onPressedInc,
    required this.onPressedDec,
    this.width = 242.0,
    this.minHeight = 82.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: value > 0 ? onPressedDec : null,
        ),
        Container(
          width: width,
          constraints: BoxConstraints(
            minHeight: minHeight,
          ),
          padding: paddingAllM,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: radiusXL,
          ),
          child: Center(
            child: value > 0 ? Wrap(
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                value,
                (index) => tokenBuilder(context),
              ).padAll(paddingAllS).toList(),
            ) : Center(child: emptyBuilder(context)),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right_rounded),
          onPressed: value < max ? onPressedInc : null,
        ),
      ],
    );
  }
}
