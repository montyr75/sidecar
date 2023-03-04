import 'package:flutter/material.dart';

import '../../../data/cw_dice.dart';
import '../../../models/cw_die.dart';
import '../../../models/damage_dice.dart';
import '../../../models/enums.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/mod_display.dart';
import '../../../widgets/png_icon.dart';

class DiceMatrix extends StatelessWidget {
  const DiceMatrix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.symmetric(
        inside: const BorderSide(color: Colors.black12),
        outside: BorderSide.none,
      ),
      children: [
        for (final die in cwDice.values)
          _buildRow(die),
      ],
    );
  }

  TableRow _buildRow(CwDie die) {
    return TableRow(
      children: [
        _buildCell(DiceDisplay(dice: Dice(die.type, 0))),
        for (final result in die.results)
          _buildCell(result.toWidget()),
      ],
    );
  }

  TableCell _buildCell(Widget content) {
    return TableCell(
      child: Container(
        padding: paddingAllM,
        alignment: Alignment.center,
        child: content,
      ),
    );
  }
}

class DoubleIcon extends StatelessWidget {
  final Widget icon;

  const DoubleIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: icon,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: icon,
          ),
        ],
      ),
    );
  }
}

class _Wrench extends StatelessWidget {
  const _Wrench({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
      ),
      child: const Center(
        child: PngIcon(
          name: "wrenches",
          size: 10,
          color: Colors.black,
        ),
      ),
    );
  }
}

extension CwDieResultX on CwDieResult {
  Widget toWidget() {
    switch (this) {
      case CwDieResult.shield: return const ShieldDisplay();
      case CwDieResult.doubleShield: return const DoubleIcon(icon: ShieldDisplay(size: 14));
      case CwDieResult.star: return DamageDisplay(damage: const Damage(DamageType.basic));
      case CwDieResult.doubleStar: return const DoubleIcon(icon: PngIcon(name: 'star', size: 14, color: Colors.black));
      case CwDieResult.wrench: return const WrenchDisplay();
      case CwDieResult.doubleWrench: return const DoubleIcon(icon: _Wrench());
    }
  }
}