import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/components.dart';
import '../../utils/component_table_utils.dart';

class AccessoriesTable extends ConsumerWidget {
  final List<ComponentState> accessories;

  const AccessoriesTable({Key? key, required this.accessories}) : super(key: key);

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
            buildCell(content: const Text('Accessory'), component: accessories.first),
            buildCell(content: const Text('Loc'), component: accessories.first),
            buildCell(content: const Text('Type'), component: accessories.first),
            buildCell(content: const Text('Dur'), component: accessories.first),
            buildCell(content: const Text('Notes'), component: accessories.first),
          ],
        ),
        for (final comp in accessories) _buildRow(context: context, ref: ref, component: comp),
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
