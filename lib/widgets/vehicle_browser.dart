import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../features/record_sheet/controller/vehicle_state.dart';
import '../models/components.dart';
import '../utils/screen_utils.dart';
import '../utils/utils.dart';
import 'component_display.dart';
import 'panel_list.dart';

class VehicleBrowser extends StatelessWidget {
  final List<VehicleState> vehicleStates;
  final ValueChanged<VehicleSelectionResult> onSelected;
  final List<VehicleSelectionType> selectionTypes;

  const VehicleBrowser({
    Key? key,
    required this.vehicleStates,
    required this.onSelected,
    this.selectionTypes = const [VehicleSelectionType.drive],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      key: ObjectKey(vehicleStates),
      items: vehicleStates.map<ExpandableItem>(
        (vehicleState) {
          return ExpandableItem(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  vehicleState.vehicle.name,
                  style: const TextStyle(fontSize: 18, fontFamily: 'Audiowide'),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: sm),
                  child: Text.rich(
                    TextSpan(
                      text: "",
                      children: [
                        const TextSpan(
                          text: "Chassis: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: vehicleState.vehicle.chassis.toString()),
                        const TextSpan(
                          text: "   Division: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: vehicleState.vehicle.division.toString()),
                      ],
                    ),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (selectionTypes.contains(VehicleSelectionType.drive)) TextButton(
                      onPressed: () => onSelected(VehicleSelectionResult(type: VehicleSelectionType.drive, state: vehicleState)),
                      child: Text(
                        VehicleSelectionType.drive.toString(),
                        style: const TextStyle(fontFamily: 'Facon'),
                      ),
                    ),
                    if (selectionTypes.contains(VehicleSelectionType.build)) TextButton(
                      onPressed: () => onSelected(VehicleSelectionResult(type: VehicleSelectionType.build, state: vehicleState)),
                      child: Text(
                        VehicleSelectionType.build.toString(),
                        style: const TextStyle(fontFamily: 'Facon'),
                      ),
                    ),
                    if (selectionTypes.contains(VehicleSelectionType.delete)) IconButton(
                      onPressed: () => onSelected(VehicleSelectionResult(type: VehicleSelectionType.delete, state: vehicleState)),
                      icon: Icon(Icons.delete, color: Theme.of(context).primaryColor,),
                      tooltip: "Dump it",
                    ),
                  ].joinWidgetList(boxM).toList(),
                ),
              );
            },
            bodyBuilder: (context, isExpanded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: xl),
                child: ComponentPanelList(
                  carState: vehicleState,
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
  final VehicleState carState;

  const ComponentPanelList({Key? key, required this.carState}) : super(key: key);

  @override
  State<ComponentPanelList> createState() => _ComponentPanelListState();
}

class _ComponentPanelListState extends State<ComponentPanelList> {
  List<ExpandableItem<ComponentState>> _crewList = const [];
  List<ExpandableItem<ComponentState>> _componentList = const [];

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

  List<ExpandableItem<ComponentState>> _generateComponentItems(List<ComponentState> value) {
    return value.map<ExpandableItem<ComponentState>>((component) {
      return ExpandableItem<ComponentState>(
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
  final VehicleState state;

  const VehicleSelectionResult({
    required this.type,
    required this.state,
  });
}

enum VehicleSelectionType {
  drive,
  build,
  delete;

  @override
  String toString() => ReCase(name).titleCase;
}