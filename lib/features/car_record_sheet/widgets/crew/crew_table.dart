import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/components.dart';
import '../../utils/component_table_utils.dart';

const _columnWidths = {
  0: FixedColumnWidth(200),
  1: IntrinsicColumnWidth(),
  2: FlexColumnWidth(),
};

class CrewTable extends ConsumerWidget {
  final InstalledComponent component;

  const CrewTable({Key? key, required this.component}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ComponentTable(
      columnWidths:_columnWidths,
      rows: [
        TableRow(
          children: [
            buildCell(content: Text(component.subtype.toString()), component: component),
            buildCell(content: const Text('Dur'), component: component),
            buildCell(content: const Text('Notes'), component: component),
          ],
        ),
        _buildRow(context: context, ref: ref, component: component),
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
      buildCell(content: Text(component.currentDurability.toString()), number: true),
      buildModsCell(data: component.abbrMods),
    ]);
  }
}
