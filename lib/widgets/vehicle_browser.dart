import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../features/car_record_sheet/controller/car_state.dart';
import '../models/components.dart';
import '../models/vehicle.dart';
import '../utils/screen_utils.dart';
import '../utils/utils.dart';
import 'component_display.dart';
import 'panel_list.dart';

class VehicleBrowser extends StatelessWidget {
  final List<CarState> carStates;
  final ValueChanged<VehicleSelectionResult> onSelected;
  final List<VehicleSelectionType> selectionTypes;

  const VehicleBrowser({
    Key? key,
    required this.carStates,
    required this.onSelected,
    this.selectionTypes = const [VehicleSelectionType.drive],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      items: carStates.map<ExpandableItem>(
        (carState) {
          return ExpandableItem(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  carState.car.name,
                  style: const TextStyle(fontSize: 18, fontFamily: 'Audiowide'),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (selectionTypes.contains(VehicleSelectionType.drive)) TextButton(
                      onPressed: () => onSelected(VehicleSelectionResult(type: VehicleSelectionType.drive, vehicle: carState.car)),
                      child: Text(
                        VehicleSelectionType.drive.toString(),
                        style: const TextStyle(fontFamily: 'Facon'),
                      ),
                    ),
                    if (selectionTypes.contains(VehicleSelectionType.build)) TextButton(
                      onPressed: () => onSelected(VehicleSelectionResult(type: VehicleSelectionType.build, vehicle: carState.car)),
                      child: Text(
                        VehicleSelectionType.build.toString(),
                        style: const TextStyle(fontFamily: 'Facon'),
                      ),
                    ),
                    if (selectionTypes.contains(VehicleSelectionType.delete)) IconButton(
                      onPressed: () => onSelected(VehicleSelectionResult(type: VehicleSelectionType.delete, vehicle: carState.car)),
                      icon: const Icon(Icons.delete),
                      tooltip: "Dump Vehicle",
                    ),
                  ].joinWidgetList(boxM).toList(),
                ),
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

class VehicleSelectionResult {
  final VehicleSelectionType type;
  final Vehicle vehicle;

  const VehicleSelectionResult({
    required this.type,
    required this.vehicle,
  });
}

enum VehicleSelectionType {
  drive,
  build,
  delete;

  @override
  String toString() => ReCase(name).titleCase;
}