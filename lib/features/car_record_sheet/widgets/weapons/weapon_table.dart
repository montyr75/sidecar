import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../models/components.dart';
import '../../../../models/enums.dart';
import '../../../../utils/screen_utils.dart';
import '../../../../widgets/component_display.dart';
import '../../../../widgets/mod_display.dart';
import '../../controller/car_state.dart';
import '../../utils/component_table_utils.dart';
import '../crew_damage_dice_display.dart';

class WeaponTable extends ConsumerWidget {
  final CarState state;
  final ComponentType type;

  final bool showType;

  List<InstalledComponent> get weapons => type != ComponentType.sidearm ? state.weapons : state.sidearms;

  const WeaponTable({Key? key, required this.state, this.type = ComponentType.weapon})
      : showType = type != ComponentType.sidearm,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconColor = type == ComponentType.weapon ? Colors.white : Colors.black;

    final columnHeaders = [
      buildCell(content: SizedBox(height: 24, child: Text(type.toString())), component: weapons.first),
      buildCell(content: const SizedBox(height: 24, child: Text('Arc')), component: weapons.first),
      if (showType) buildCell(content: const SizedBox(height: 24, child: Text('Type')), component: weapons.first),
      buildCell(content: const SizedBox(height: 24, child: Text('Rng')), component: weapons.first),
      buildCell(content: const SizedBox(height: 24, child: Text('Damage')), component: weapons.first),
      buildCell(content: WrenchDisplay(iconColor: iconColor), component: weapons.first),
      if (showType) buildCell(content: const SizedBox(height: 24, child: Text('Dur')), component: weapons.first),
      buildCell(content: const SizedBox(height: 24, child: Text('Notes')), component: weapons.first),
    ];

    final columnWidths = {
      0: const FixedColumnWidth(200),
      for (int i = 1; i < columnHeaders.length - 1; i++) i: const IntrinsicColumnWidth(),
      columnHeaders.length - 1: const FlexColumnWidth(),
    };

    return ComponentTable(
      columnWidths: columnWidths,
      maxWidth: 760,
      rows: [
        TableRow(
          children: columnHeaders,
        ),
        for (final weapon in weapons) _buildRow(context: context, ref: ref, component: weapon),
      ],
    );
  }

  TableRow _buildRow({
    required BuildContext context,
    required WidgetRef ref,
    required InstalledComponent component,
  }) {
    return TableRow(children: [
      buildNameCell(context: context, ref: ref, component: component),
      buildCell(content: Text(component.weaponArc)),
      if (showType) buildCell(content: Text(component.subtype?.toString() ?? '')),
      buildCell(content: Text(component.weaponRange), number: true),
      buildCell(
        content: component.hasDamageDice
            ? InkWell(
                onTap: () => _showCrewDamageDice(state, component.weapon),
                child: DamageDiceDisplay(data: component.damageDice!))
            : noWidget,
        number: true,
      ),
      buildCell(content: component.hasWrenchResult ? DamageDisplay(damage: Damage(component.wrenchResult!)) : noWidget),
      if (showType) buildCell(content: Text(component.currentDurability.toString()), number: true),
      buildModsCell(data: component.abbrMods),
    ]);
  }

  void _showCrewDamageDice(CarState state, Weapon weapon) {
    SmartDialog.show(builder: (_) {
      return SimpleDialog(
        backgroundColor: Colors.grey,
        titlePadding: const EdgeInsets.fromLTRB(med, xl, med, med),
        title: Text(
          weapon.name.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Facon',
          ),
        ),
        children: [
          Padding(
            padding: paddingAllM,
            child: CrewDamageDiceDisplay(
              driver: state.driver!,
              gunner: state.gunner!,
              data: state.calculateDamageDice(weapon),
            ),
          ),
        ],
      );
    });
  }
}
