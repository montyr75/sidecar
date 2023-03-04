
import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

import '../models/components.dart';
import '../models/damage_dice.dart';
import '../models/enums.dart';
import '../utils/screen_utils.dart';
import 'png_icon.dart';

const defaultIconSize = 24.0;

const triangle = TriangleShapeBorder(
  point1: DynamicOffset(Length(50, unit: LengthUnit.percent), Length(0, unit: LengthUnit.percent)),
  point2: DynamicOffset(Length(0, unit: LengthUnit.percent), Length(100, unit: LengthUnit.percent)),
  point3: DynamicOffset(Length(100, unit: LengthUnit.percent), Length(100, unit: LengthUnit.percent)),
  border: DynamicBorderSide(color: Colors.black),
);

const star = StarShapeBorder(corners: 5);

class ModDisplay extends StatefulWidget {
  final Mod mod;
  final bool abbreviate;

  const ModDisplay({Key? key, required this.mod, this.abbreviate = false}) : super(key: key);

  @override
  State<ModDisplay> createState() => _ModDisplayState();
}

class _ModDisplayState extends State<ModDisplay> {
  static final modRegExp = RegExp(r"\[\[[^\]]*\]\]");

  final List<String> _splitText = [];

  Mod get mod => widget.mod;

  @override
  void initState() {
    super.initState();

    final text = widget.abbreviate && mod.hasAbbrText
        ? mod.abbrText!
        : mod.text.replaceAll("<br>", "\n");

    final matches = modRegExp.allMatches(text).toList();

    if (matches.isEmpty) {
      _splitText.add(text);
    } else {
      _splitText.add(text.substring(0, matches[0].start));
      _splitText.add(matches[0].group(0)!);

      int i = 1;
      for (; i < matches.length; i++) {
        _splitText.add(text.substring(matches[i - 1].end, matches[i].start));
        _splitText.add(matches[i].group(0)!);
      }

      _splitText.add(text.substring(matches[i - 1].end, text.length));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<InlineSpan> children = [];

    for (int i = 1; i < _splitText.length; i++) {
      if (!_splitText[i].startsWith('[[')) {
        children.add(TextSpan(text: _splitText[i]));
      } else {
        final value = _splitText[i].substring(2, _splitText[i].length - 2);

        if (value.startsWith("Die.")) {
          children.add(
            WidgetSpan(
              child: DiceDisplay(
                dice: Dice.fromString(value),
              ),
            ),
          );
        } else if (value.startsWith("DamageType.")) {
          children.add(
            WidgetSpan(
              child: DamageDisplay(
                damage: Damage.fromString(value),
              ),
            ),
          );
        } else if (value.startsWith("Token.")) {
          final Widget widget;

          switch (value.split('.').last) {
            case "ace": widget = const AceToken(); break;
            case "wrench": widget = const WrenchDisplay(); break;
            case "shield": widget = const ShieldDisplay(); break;
            case "control": widget = const ControlToken(); break;
            case "damage": widget = const DamageToken(); break;
            default: widget = noWidget;
          }

          children.add(
            WidgetSpan(
              child: widget,
            ),
          );
        } else if (value.startsWith("Terrain:")) {
          children.add(
            WidgetSpan(
              child: TerrainDisplay(level: int.parse(value.split(":").last)),
            ),
          );
        } else if (value.startsWith('__')) {
          children.add(TextSpan(
            text: value.substring(2),
            style: const TextStyle(fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
          ));
        } else if (value.startsWith('_')) {
          children.add(TextSpan(
            text: value.substring(1),
            style: const TextStyle(fontWeight: FontWeight.w500),
          ));
        }
        else {
          children.add(TextSpan(
            text: value,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ));
        }
      }
    }

    return Text.rich(
      TextSpan(
        text: _splitText.first,
        children: children,
      ),
      style: TextStyle(
        color: mod.type == ModType.text ? Colors.black : Colors.red[900],
        fontSize: mod.type == ModType.text ? 16 : 12,
      ),
    );
  }
}

class DiceDisplay extends StatelessWidget {
  final Dice dice;

  const DiceDisplay({Key? key, required this.dice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = dice.die.alternateTextColor ? Colors.black : Colors.white;

    return Container(
      width: defaultIconSize,
      height: defaultIconSize,
      decoration: BoxDecoration(
        color: dice.die.color,
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(sm)),
      ),
      child: dice.qty != 0
          ? Center(
              child: Text(
                dice.qty.toString(),
                style: TextStyle(color: color, fontWeight: FontWeight.w500),
              ),
            )
          : null,
    );
  }
}

class DamageToken extends StatelessWidget {
  const DamageToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultIconSize,
      height: defaultIconSize,
      decoration: const ShapeDecoration(
        shape: triangle,
        color: Colors.yellow,
      ),
      child: const Center(
        child: Text(
          "!",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class AceToken extends StatelessWidget {
  const AceToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultIconSize,
      height: defaultIconSize,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(sm)),
      ),
      child: const Center(
        child: PngIcon(
          name: "ace",
          color: Colors.black,
          size: 22,
        ),
      ),
    );
  }
}

class DamageDisplay extends StatelessWidget {
  final Damage damage;
  final bool small;

  late final double size;

  DamageDisplay({
    Key? key,
    required this.damage,
    this.small = true,
  }) : super(key: key) {
    size = small ? defaultIconSize : 32.0;
  }

  @override
  Widget build(BuildContext context) {
    switch (damage.damageType) {
      case DamageType.basic:
        return _buildBasicDamage();
      case DamageType.tires:
        return _buildTiresDamage();
      case DamageType.fire:
        return _buildFireDamage();
      case DamageType.explosion:
        return _buildExplosionDamage();
      case DamageType.paint:
        return _buildPaintDamage();
    }
  }

  Widget _buildBasicDamage() {
    return SizedBox(
      width: size + 2,
      height: size + 2,
      child: Stack(
        children: [
          PngIcon(name: 'star', color: Colors.black, size: size + 2),
          Center(
            child: Text(
              damage.qty > 0 ? damage.qty.toString() : '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                // fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTiresDamage() {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Container(
            decoration: const ShapeDecoration(
              shape: star,
              color: Colors.yellow,
            ),
            child: damage.qty != 0
                ? Center(
              child: Transform.translate(
                offset: const Offset(0, -1),
                child: Text(
                  damage.qty.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
            )
                : null,
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "TIRES",
              style: TextStyle(
                fontSize: 8,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFireDamage() {
    return PngIcon(name: "fire", color: Colors.deepOrange, size: size);
  }

  Widget _buildExplosionDamage() {
    return PngIcon(name: 'explosion', color: Colors.deepOrange, size: size);
  }

  Widget _buildPaintDamage() {
    return PngIcon(name: 'paintbrush', color: Colors.black, size: size);
  }
}

class WrenchDisplay extends StatelessWidget {
  final bool small;
  final Color iconColor;

  const WrenchDisplay({Key? key, this.small = true, this.iconColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = small ? defaultIconSize : 32.0;
    final iconSize = small ? 16.0 : defaultIconSize;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: iconColor),
      ),
      child: Center(
        child: PngIcon(
          name: "wrenches",
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}

class ShieldDisplay extends StatelessWidget {
  final double size;

  const ShieldDisplay({Key? key, this.size = defaultIconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.shield_sharp,
      color: Colors.black,
      size: size,
    );
  }
}

class TerrainDisplay extends StatelessWidget {
  final int level;

  const TerrainDisplay({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultIconSize,
      height: defaultIconSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
      child: level > 0 ? Center(
        child: Text(
          level.toString(),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ): null,
    );
  }
}

class Damage {
  final DamageType damageType;
  final int qty;

  const Damage(this.damageType, [this.qty = 0]);

  /// expecting format "DamageType.basic:1"
  factory Damage.fromString(String value) {
    final splitValue = value.split(':');

    return Damage(
      DamageType.fromString(splitValue.first),
      int.tryParse(splitValue.last) ?? 0,
    );
  }
}

class DurabilityDisplay extends StatelessWidget {
  final int value;

  const DurabilityDisplay({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: defaultIconSize,
      height: defaultIconSize,
      decoration: const ShapeDecoration(
        shape: triangle,
        color: Colors.red,
      ),
      child: Center(
        child: Transform.translate(
          offset: const Offset(0, 3),
          child: Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class ControlToken extends StatelessWidget {
  const ControlToken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: defaultIconSize,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [
            Colors.white70,
            Colors.green,
          ],
        ),
        border: Border.all(color: Colors.black),
        borderRadius: radiusS,
      ),
      child: const Center(
        child: Text(
          "CONTROL",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
        ),
      ),
    );
  }
}
