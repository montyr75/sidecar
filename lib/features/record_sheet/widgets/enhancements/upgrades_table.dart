import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/components.dart';
import '../../utils/component_table_utils.dart';

class UpgradesTable extends ConsumerWidget {
  final List<ComponentState> upgrades;

  const UpgradesTable({Key? key, required this.upgrades}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ComponentTable(
      columnWidths: const {
        0: FixedColumnWidth(200),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
        3: FlexColumnWidth(),
      },
      rows: [
        TableRow(
          children: [
            buildCell(content: const Text('Upgrade'), component: upgrades.first),
            buildCell(content: const Text('Type'), component: upgrades.first),
            buildCell(content: const Text('Dur'), component: upgrades.first),
            buildCell(content: const Text('Notes'), component: upgrades.first),
          ],
        ),
        for (final comp in upgrades) _buildRow(context: context, ref: ref, component: comp),
      ],
    );
  }

  TableRow _buildRow({
    required BuildContext context,
    required WidgetRef ref,
    required ComponentState component,
  }) {
    return TableRow(children: [
      buildNameCell(context: context, ref: ref, component: component),
      buildCell(content: Text(component.subtype?.toString() ?? '')),
      buildCell(content: Text(component.currentDurability?.toString() ?? ''), number: true),
      buildModsCell(data: component.abbrMods),
    ]);
  }
}
