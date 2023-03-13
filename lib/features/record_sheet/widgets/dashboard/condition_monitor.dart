import 'package:flutter/material.dart';

import '../../../../utils/screen_utils.dart';
import '../../../../widgets/png_icon.dart';

class ConditionMonitor extends StatelessWidget {
  final Axis direction;
  final bool fire;
  final bool paint;
  final VoidCallback onFirePressed;
  final VoidCallback onPaintPressed;

  const ConditionMonitor({
    Key? key,
    this.direction = Axis.horizontal,
    this.fire = false,
    this.paint = false,
    required this.onFirePressed,
    required this.onPaintPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      children: [
        _IconToggleButton(
          icon: const PngIcon(name: "fire", color: Colors.grey),
          selectedIcon: const PngIcon(name: "fire", color: Colors.orangeAccent),
          selectedBgColor: Colors.red,
          tooltip: "Fire",
          selected: fire,
          onPressed: onFirePressed,
        ),
        boxM,
        _IconToggleButton(
          icon: const PngIcon(name: "paintbrush", color: Colors.grey),
          selectedIcon: const PngIcon(name: "paintbrush", color: Colors.purpleAccent),
          selectedBgColor: Colors.deepPurple,
          tooltip: "Paint",
          selected: paint,
          onPressed: onPaintPressed,
        ),
      ],
    );
  }
}

class _IconToggleButton extends StatelessWidget {
  final Widget icon;
  final Widget? selectedIcon;
  final Color? selectedBgColor;
  final String tooltip;
  final bool selected;
  final VoidCallback? onPressed;

  const _IconToggleButton({
    Key? key,
    required this.icon,
    this.selectedIcon,
    required this.selectedBgColor,
    required this.tooltip,
    this.selected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: !selected ? null : selectedBgColor,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        tooltip: tooltip,
        icon: !selected ? icon : selectedIcon ?? icon,
        onPressed: onPressed,
      ),
    );
  }
}
