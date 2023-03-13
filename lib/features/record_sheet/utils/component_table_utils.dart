import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/components.dart';
import '../../../models/enums.dart';
import '../../../services/theme/theme_service.dart';
import '../../../utils/screen_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/component_display.dart';
import '../../../widgets/mod_display.dart';

class ComponentTable extends StatelessWidget {
  final Map<int, TableColumnWidth> columnWidths;
  final List<TableRow> rows;
  final double maxWidth;

  const ComponentTable({
    Key? key,
    required this.columnWidths,
    required this.rows,
    this.maxWidth = 640,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black),
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration: BoxDecoration(
          gradient: cardGradient,
        ),
        child: Table(
          // defaultColumnWidth: const IntrinsicColumnWidth(),
          columnWidths: columnWidths,
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.symmetric(
            inside: const BorderSide(color: Colors.black12),
            outside: BorderSide.none,
          ),
          children: rows,
        ),
      ),
    );
  }
}

TableCell buildNameCell({
  required BuildContext context,
  required WidgetRef ref,
  required ComponentState component,
  bool number = false,
}) {
  return TableCell(
    child: TextButton(
      onPressed: () => showComponentDialog(
        context: context,
        ref: ref,
        component: component,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: med),
        alignment: number ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          component.name.toUpperCase(),
          style: TextStyle(color: component.nameColor),
        ),
      ),
    ),
  );
}

TableCell buildCell({Widget? content, bool number = false, ComponentState? component}) {
  Color? color = component != null
      ? component.type != ComponentType.crew
          ? component.type.getColor()
          : component.type.getColor(component.subtype)
      : null;

  final header = color != null;

  return TableCell(
    child: DefaultTextStyle(
      style: TextStyle(
        fontWeight: !header ? FontWeight.normal : FontWeight.w500,
        color: header ? foregroundColorForBackground(color) : Colors.black,
      ),
      child: Container(
        padding: paddingAllM,
        decoration: header ? BoxDecoration(color: color) : null,
        alignment: number ? Alignment.centerRight : Alignment.centerLeft,
        child: content,
      ),
    ),
  );
}

TableCell buildModsCell({List<Mod>? data}) {
  return TableCell(
    child: Padding(
      padding: paddingAllM,
      child: data != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data
                  .map((value) => ModDisplay(
                        key: ObjectKey(value),
                        mod: value,
                        abbreviate: true,
                      ))
                  .joinWidgetList(boxS)
                  .toList(),
            )
          : null,
    ),
  );
}
