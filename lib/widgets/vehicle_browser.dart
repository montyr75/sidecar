import 'package:flutter/material.dart';

import '../features/car_record_sheet/controller/car_state.dart';
import '../models/components.dart';
import '../utils/screen_utils.dart';
import 'component_display.dart';
import 'panel_list.dart';

class VehicleBrowser extends StatelessWidget {
  final List<CarState> vehicles;
  final ValueChanged<CarState>? onSelected;
  final String selectionText;

  const VehicleBrowser({
    Key? key,
    required this.vehicles,
    this.onSelected,
    this.selectionText = "Drive",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      items: vehicles.map<ExpandableItem>(
        (carState) {
          return ExpandableItem(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  carState.car.name,
                  style: const TextStyle(fontSize: 18, fontFamily: 'Audiowide'),
                ),
                trailing: onSelected != null ? TextButton(
                  onPressed: () => onSelected!(carState),
                  child: Text(
                    selectionText,
                    style: const TextStyle(fontFamily: 'Facon'),
                  ),
                ) : null,
              );
            },
            bodyBuilder: (context, isExpanded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: xl),
                child: ComponentPanelList(
                  carState: carState,
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}

class ComponentPanelList extends StatefulWidget {
  final CarState carState;

  const ComponentPanelList({Key? key, required this.carState}) : super(key: key);

  @override
  State<ComponentPanelList> createState() => _ComponentPanelListState();
}

class _ComponentPanelListState extends State<ComponentPanelList> {
  List<ExpandableItem<InstalledComponent>> _crewList = const [];
  List<ExpandableItem<InstalledComponent>> _componentList = const [];

  @override
  void initState() {
    super.initState();

    _crewList = _generateComponentItems(widget.carState.allCrewComponents);

    _componentList = [
      ..._generateComponentItems(widget.carState.weapons.toList()..sort()),
      ..._generateComponentItems(widget.carState.accessories.toList()..sort()),
      ..._generateComponentItems(widget.carState.upgrades.toList()..sort()),
      ..._generateComponentItems(widget.carState.structure.toList()..sort()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PanelList(items: _crewList),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: med),
          child: Divider(
            thickness: 5,
            indent: 100,
            endIndent: 200,
          ),
        ),
        PanelList(items: _componentList),
      ],
    );
  }

  List<ExpandableItem<InstalledComponent>> _generateComponentItems(List<InstalledComponent> value) {
    return value.map<ExpandableItem<InstalledComponent>>((component) {
      return ExpandableItem<InstalledComponent>(
        headerBuilder: (context, isExpanded) => Padding(
          padding: const EdgeInsets.only(top: sm),
          child: ComponentHeader(
            component: component,
            showLocationAndSource: true,
          ),
        ),
        bodyBuilder: (context, isExpanded) => ComponentBody(component: component, expandable: true),
        data: component,
      );
    }).toList();
  }
}
