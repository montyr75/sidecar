import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/vehicle_guide.dart';
import '../../models/enums.dart';
import '../../models/vehicle.dart';
import '../../utils/screen_utils.dart';
import '../../widgets/vehicle_browser.dart';
import '../car_record_sheet/controller/car_state.dart';
import 'chassis_page.dart';

class VehicleGuideSelectorPage extends ConsumerStatefulWidget {
  final ValueChanged<Vehicle> onSelected;
  final VehicleSelectionType selectionType;

  const VehicleGuideSelectorPage({
    Key? key,
    required this.onSelected,
    this.selectionType = VehicleSelectionType.drive,
  }) : super(key: key);

  @override
  ConsumerState<VehicleGuideSelectorPage> createState() => _VehicleGuideSelectorPageState();
}

class _VehicleGuideSelectorPageState extends ConsumerState<VehicleGuideSelectorPage> {
  int _page = 0;
  Chassis _selectedChassis = Chassis.apollo;
  List<CarState> _carStates = const [];

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _page,
      children: [
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Vehicle Guide",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Blazed',
                color: Colors.blueGrey,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: Chassis.officialValues.map<_ChassisTile>((chassis) {
                      return _ChassisTile(
                        chassis: chassis,
                        onSelected: () {
                          setState(() {
                            _selectedChassis = chassis;
                            _carStates = vg.getByChassis(chassis).map((value) => CarState.fromVehicle(value)).toList();
                            _page = 1;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        ChassisPage(
          selectionType: widget.selectionType,
          chassis: _selectedChassis,
          vehicles: _carStates,
          onBack: () {
            setState(() {
              _page = 0;
            });
          },
          onSelected: widget.onSelected,
        ),
      ],
    );
  }
}

class _ChassisTile extends StatelessWidget {
  final Chassis chassis;
  final VoidCallback onSelected;

  const _ChassisTile({Key? key, required this.chassis, required this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        chassis.toString(),
        style: const TextStyle(fontSize: 18, fontFamily: 'Audiowide'),
      ),
      trailing: Chip(
        label: Text(
          chassis.source.toString(),
          style: const TextStyle(fontSize: 10),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: med, vertical: 0),
      ),
      onTap: onSelected,
    );
  }
}
