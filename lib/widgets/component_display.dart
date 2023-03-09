import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../models/components.dart';
import '../models/damage_dice.dart';
import '../models/enums.dart';
import '../services/theme/theme_service.dart';
import '../utils/screen_utils.dart';
import '../utils/utils.dart';
import 'component_dialog.dart';
import 'mod_display.dart';

class ComponentDisplay extends ConsumerWidget {
  static const defaultWidth = 400.0;
  static const abbrWidth = 225.0;

  final InstalledComponent value;
  final bool abbreviate;

  const ComponentDisplay({Key? key, required this.value, this.abbreviate = false}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!abbreviate) {
      return _buildComponent(abbreviate: abbreviate);
    }

    return InkWell(
      onTap: () => showComponentDialog(
        context: context,
        ref: ref,
        component: value,
      ),
      child: _buildComponent(abbreviate: abbreviate),
    );
  }

  Widget _buildComponent({bool abbreviate = false}) {
    return SizedBox(
      width: !abbreviate ? defaultWidth : abbrWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ComponentHeader(component: value),
          ComponentBody(component: value, abbreviate: abbreviate),
        ],
      ),
    );
  }
}

void showComponentDialog({
  required BuildContext context,
  required WidgetRef ref,
  required InstalledComponent component,
}) {
  SmartDialog.show(
    builder: (_) => ComponentDialog(component: component),
  );
}

class ComponentHeader extends StatelessWidget {
  final InstalledComponent component;
  final bool showLocationAndSource;
  final VoidCallback? onSelected;
  final String selectionText;

  const ComponentHeader({
    Key? key,
    required this.component,
    this.showLocationAndSource = false,
    this.onSelected,
    this.selectionText = "Select",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color typeColor = component.type.getColor(component.type == ComponentType.crew ? component.subtype : null);
    final Color costColor = component.type.getCostColor();

    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(med),
                  topLeft: Radius.circular(med),
                ),
                gradient: cardGradient,
              ),
              child: Padding(
                padding: paddingAllS,
                child: Row(
                  children: [
                    Text(
                      component.name.toUpperCase(),
                      style: TextStyle(
                        color: component.nameColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (onSelected != null) ...[
                      const Spacer(),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: onSelected,
                        child: Text(
                          selectionText,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ],
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: typeColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: paddingAllS,
                    child: Text(
                      "${component.type}${component.hasSubtype ? ' - ${component.subtype}' : ''}",
                      style: TextStyle(
                        color: component.type != ComponentType.sidearm ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  if (showLocationAndSource)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: med, vertical: med),
                      child: Text(
                        "${component.loc.toVehicleGuideString().isNotEmpty ? '${component.loc.toVehicleGuideString()} $endash ' : ''}${component.source.toAbbrString()}",
                        style: TextStyle(
                          fontSize: 10,
                          color: component.type != ComponentType.sidearm ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: xs, vertical: 0),
            child: SizedBox(
              width: 33,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: costColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: paddingAllM,
                  child: Text(
                    "${component.cost}${component.component.asterisk ? '*' : ''}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: costColor == bpCostColor ? Colors.black : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ComponentBody extends StatelessWidget {
  final InstalledComponent component;
  final bool abbreviate; // show abbreviated mods?
  final bool expandable; // true when it's part of an expandable card

  const ComponentBody({
    Key? key,
    required this.component,
    this.abbreviate = false,
    this.expandable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Weapon? weapon = component.isWeapon ? component.component as Weapon : null;

    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black),
      child: Padding(
        padding: EdgeInsets.only(right: expandable ? 64 : 0),
        child: Container(
          height: expandable ? null : 255,
          padding: expandable ? paddingAllM : paddingAllXL,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(med),
              bottomLeft: Radius.circular(med),
            ),
            gradient: cardGradient,
          ),
          child: Center(
            child: Column(
              mainAxisSize: expandable ? MainAxisSize.min : MainAxisSize.max,
              children: [
                ..._buildMods(weapon),
                if (component.isWeapon && weapon!.hasWrenchResult && weapon.wrenchResult != DamageType.paint)
                  _WrenchResultDisplay(type: weapon.wrenchResult!, small: abbreviate),
                if (!expandable) const Spacer(),
                SizedBox(
                  height: 40,
                  child: Stack(
                    children: [
                      if (component.isWeapon && component.hasDamageDice)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: DamageDiceDisplay(data: weapon!.damageDice!),
                        ),
                      if (component.hasRestrictions)
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (final restriction in component.component.restrictions)
                                Text(
                                  restriction.toString(),
                                  style: TextStyle(color: Colors.red[900], fontSize: 12),
                                ),
                            ],
                          ),
                        ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (component.component.durability != null)
                              DurabilityDisplay(value: component.component.durability!),
                            boxS,
                            DecoratedBox(
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: sm, vertical: 0),
                                child: Text(
                                  component.source.toAbbrString().toUpperCase(),
                                  style: const TextStyle(fontSize: 8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ].joinWidgetList(boxL).toList(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMods(Weapon? weapon) {
    return [
      if (component.isWeapon && weapon!.hasWrenchResult && weapon.wrenchResult == DamageType.paint)
        _WrenchResultDisplay(type: weapon.wrenchResult!, small: abbreviate),
      for (final mod in component.mods)
        ModDisplay(
          key: ObjectKey(mod),
          mod: mod,
          abbreviate: abbreviate,
        ),
    ];
  }
}

class DamageDiceDisplay extends StatelessWidget {
  final DamageDice data;

  const DamageDiceDisplay({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (data.hasBasicDamage) DamageDisplay(damage: Damage(DamageType.basic, data.basicDamage)),
        if (data.hasTiresDamage) DamageDisplay(damage: Damage(DamageType.tires, data.tiresDamage)),
        if (data.hasDice)
          for (final dice in data.dice) DiceDisplay(dice: dice),
      ].joinWidgetList(boxM).toList(),
    );
  }
}

class _WrenchResultDisplay extends StatelessWidget {
  final DamageType type;
  final bool small;

  const _WrenchResultDisplay({Key? key, required this.type, this.small = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WrenchDisplay(small: small),
        boxM,
        Text("=", style: !small ? const TextStyle(fontSize: 18) : null),
        boxM,
        DamageDisplay(damage: Damage(type), small: small),
      ],
    );
  }
}

extension ComponentTypeX on ComponentType {
  Color getColor([ComponentSubtype? subType]) {
    switch (this) {
      case ComponentType.accessory:
        return accessoryColor;
      case ComponentType.crew:
        return subType != null
            ? subType == ComponentSubtype.driver
                ? driverColor
                : gunnerColor
            : driverColor;
      case ComponentType.gear:
        return gearColor;
      case ComponentType.sidearm:
        return sidearmColor;
      case ComponentType.structure:
        return structureColor;
      case ComponentType.upgrade:
        return upgradeColor;
      case ComponentType.weapon:
        return weaponColor;
    }
  }

  Color getCostColor() {
    switch (this) {
      case ComponentType.weapon:
      case ComponentType.accessory:
      case ComponentType.upgrade:
      case ComponentType.structure:
        return bpCostColor;
      case ComponentType.crew:
      case ComponentType.gear:
      case ComponentType.sidearm:
        return cpCostColor;
    }
  }
}
