import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/components.dart';
import '../../utils/component_table_utils.dart';

class GearTable extends ConsumerWidget {
  final List<InstalledComponent> gear;

  const GearTable({Key? key, required this.gear}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ComponentTable(
      columnWidths: const {
        0: IntrinsicColumnWidth(),
        1: IntrinsicColumnWidth(),
        3: FlexColumnWidth(),
      },
      rows: [
        TableRow(
          children: [
            buildCell(content: const Text('Gear'), component: gear.first),
            buildCell(content: const Text('Type'), component: gear.first),
            buildCell(content: const Text('Notes'), component: gear.first),
          ],
        ),
        for (final comp in gear) _buildRow(context: context, ref: ref, component: comp),
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
      buildCell(content: Text(component.subtype?.toString() ?? '')),
      buildModsCell(data: component.abbrMods),
    ]);
  }
}