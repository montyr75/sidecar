import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';

import '../../models/car_chassis.dart';
import '../../models/components.dart';
import '../../routes.dart';
import '../../services/app/app_service.dart';
import '../../utils/screen_utils.dart';
import '../../widgets/component_display.dart';
import '../../widgets/panel_list.dart';
import '../car_builder/controller/car_builder_state.dart';
import '../car_record_sheet/controller/car_state.dart';

enum CarSelectorMode {
  drive,
  build;

  @override
  String toString() => ReCase(name).titleCase;
}

class ChassisPage extends ConsumerWidget {
  final CarSelectorMode mode;
  final CarChassis chassis;
  final Map<int, CarState> carDivisions;

  const ChassisPage({
    Key? key,
    this.mode = CarSelectorMode.drive,
    required this.chassis,
    required this.carDivisions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          chassis.type.toString(),
          style: const TextStyle(fontSize: 22, fontFamily: 'Blazed', color: Colors.blueGrey),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: paddingAllXL,
                    child: Text(chassis.description),
                  ),
                  PanelList(
                    items: carDivisions.keys.map<ExpandableItem>(
                      (division) {
                        return ExpandableItem(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                "Division $division",
                                style: const TextStyle(fontSize: 18, fontFamily: 'Audiowide'),
                              ),
                              trailing: TextButton(
                                onPressed: mode == CarSelectorMode.drive
                                    ? () {
                                        ref.read(appServiceProvider.notifier).driveCar(carDivisions[division]!);
                                        context.goNamed(AppRoute.carRecordSheet.name);
                                      }
                                    : () {
                                        ref.read(appServiceProvider.notifier)
                                            .buildCar(CarBuilderState.fromCar(carDivisions[division]!.car));
                                        Navigator.of(context).pop();
                                      },
                                child: Text(
                                  mode.toString(),
                                  style: const TextStyle(fontFamily: 'Facon'),
                                ),
                              ),
                            );
                          },
                          bodyBuilder: (context, isExpanded) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: xl),
                              child: ComponentPanelList(
                                carState: carDivisions[division]!,
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
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
