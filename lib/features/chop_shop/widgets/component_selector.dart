import 'package:flutter/material.dart';

import '../../../models/components.dart';
import '../../../models/enums.dart';
import '../../../utils/screen_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/component_display.dart';
import '../../../widgets/panel_list.dart';

typedef CompSelectorCallback = Future<bool> Function(ComponentState value);

class ComponentSelector extends StatelessWidget {
  final Location loc;
  final int division;
  final List<ComponentState> components;
  final CompSelectorCallback onSelected;    // returns true if the selector should pop after selection

  const ComponentSelector({
    Key? key,
    required this.loc,
    required this.division,
    required this.components,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Select",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: paddingAllM,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: PanelList(
                  items: _generateComponentItems(components),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ExpandableItem<ComponentState>> _generateComponentItems(List<ComponentState> value) {
    return value.map<ExpandableItem<ComponentState>>((component) {
      final disqualifiers = [
        component.hasRestriction(Restriction.frontOnly) && loc != Location.front,
        component.hasRestriction(Restriction.backOnly) && loc != Location.back,
        component.hasRestriction(Restriction.frontBack) && (loc != Location.front && loc != Location.back),
        component.hasAttribute(Attribute.requiresDiv6) && division < 6,
      ];

      return ExpandableItem<ComponentState>(
        headerBuilder: (context, isExpanded) => Padding(
          padding: const EdgeInsets.only(top: sm),
          child: ComponentHeader(
            component: component,
            onSelected: !disqualifiers.anyTrue ? () async {
              final nav = Navigator.of(context);

              final shouldPop = await onSelected(component);

              if (shouldPop) {
                nav.pop();
              }
            } : null,
          ),
        ),
        bodyBuilder: (context, isExpanded) {
          return ComponentBody(component: component, expandable: true);
        },
        data: component,
      );
    }).toList();
  }
}
