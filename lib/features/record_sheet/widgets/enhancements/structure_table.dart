import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/components.dart';
import '../../utils/component_table_utils.dart';

class StructureTable extends ConsumerWidget {
  final List<ComponentState> structure;

  const StructureTable({Key? key, required this.structure}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ComponentTable(
      columnWidths: const {
        0: FixedColumnWidth(200),
        1: IntrinsicColumnWidth(),
        2: IntrinsicColumnWidth(),
        3: IntrinsicColumnWidth(),
        4: FlexColumnWidth(),
      },
      rows: [
        TableRow(
          children: [
            buildCell(content: const Text('Structure'), component: structure.first),
            buildCell(content: const Text('Loc'), component: structure.first),
            buildCell(content: const Text('Type'), component: structure.first),
            buildCell(content: const Text('Dur'), component: structure.first),
            buildCell(content: const Text('Notes'), component: structure.first),
          ],
        ),
        for (final comp in structure) _buildRow(context: context, ref: ref, component: comp),
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
      buildCell(content: Text(component.loc.toString())),
      buildCell(content: Text(component.subtype?.toString() ?? '')),
      buildCell(content: Text(component.currentDurability.toString()), number: true),
      buildModsCell(data: component.abbrMods),
    ]);
  }
}
