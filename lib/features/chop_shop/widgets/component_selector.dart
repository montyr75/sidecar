import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/components.dart';
import '../../../models/enums.dart';
import '../../../services/app/app_service.dart';
import '../../../utils/screen_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/component_display.dart';
import '../../../widgets/panel_list.dart';
import '../controllers/car_builder/car_builder_ctrl.dart';

class ComponentSelector extends ConsumerStatefulWidget {
  final Location loc;
  final List<InstalledComponent> components;
  final ValueChanged<InstalledComponent> onSelected;

  const ComponentSelector({
    Key? key,
    required this.loc,
    required this.components,
    required this.onSelected,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ComponentSelectorState();
}

class _ComponentSelectorState extends ConsumerState<ComponentSelector> {
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
                  items: _generateComponentItems(widget.components),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ExpandableItem<InstalledComponent>> _generateComponentItems(List<InstalledComponent> value) {
    final initialState = ref.read(appServiceProvider).initialCarBuilderState;
    final state = ref.read(carBuilderCtrlProvider(initialState));

    return value.map<ExpandableItem<InstalledComponent>>((component) {
      return ExpandableItem<InstalledComponent>(
        headerBuilder: (context, isExpanded) => Padding(
          padding: const EdgeInsets.only(top: sm),
          child: ComponentHeader(
            component: component,
          ),
        ),
        bodyBuilder: (context, isExpanded) {
          final disqualifiers = [
            component.type != ComponentType.weapon && state.hasMatchingComponentByLoc(widget.loc, component),
            component.hasRestriction(Restriction.exclusive) && state.hasRestriction(Restriction.exclusive),
            component.hasRestriction(Restriction.frontOnly) && widget.loc != Location.front,
            component.hasRestriction(Restriction.backOnly) && widget.loc != Location.back,
            component.hasRestriction(Restriction.frontBack) && (widget.loc != Location.front && widget.loc != Location.back),
            component.hasAttribute(Attribute.requiresDiv6) && state.division < 6,
            component.type == ComponentType.upgrade && component.hasSubtype && state.hasComponentBySubtype(component.subtype!),
            component.type == ComponentType.gear && component.hasSubtype && state.hasComponentBySubtype(component.subtype!),
          ];
          
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ComponentBody(component: component, expandable: true),
              if (!disqualifiers.anyTrue) Container(
                height: 40,
                margin: const EdgeInsets.only(right: 64),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      widget.onSelected(component);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Select'),
                  ),
                ),
              ),
            ],
          );
        },
        data: component,
      );
    }).toList();
  }
}
