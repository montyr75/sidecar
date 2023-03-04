import 'package:flutter/material.dart';

class PngIcon extends StatelessWidget {
  static const imagePath = "assets/images/icons/";
  static const ext = ".png";
  static const defaultColor = Colors.white;
  static const defaultSize = 24.0;

  final String name;
  final Color color;
  final double size;

  const PngIcon({
    Key? key,
    required this.name,
    this.color = defaultColor,
    this.size = defaultSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      color: color,
      width: size,
      height: size,
      "$imagePath$name$ext",
    );
  }
}
