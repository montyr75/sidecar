import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/enums.dart';
import '../../models/vehicle.dart';
import '../../utils/screen_utils.dart';
import '../../widgets/vehicle_browser.dart';
import '../record_sheet/controller/vehicle_state.dart';

class ChassisPage extends ConsumerWidget {
  final VehicleSelectionType selectionType;
  final Chassis chassis;
  final List<VehicleState> vehicles;
  final ValueChanged<Vehicle> onSelected;
  final VoidCallback onBack;

  const ChassisPage({
    Key? key,
    this.selectionType = VehicleSelectionType.drive,
    required this.chassis,
    required this.vehicles,
    required this.onBack,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
        title: Text(
          chassis.toString(),
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
                  Padding(
                    padding: paddingAllXL,
                    child: Text(chassis.description),
                  ),
                  VehicleBrowser(
                    carStates: vehicles,
                    selectionTypes: [selectionType],
                    onSelected: (result) => onSelected(result.vehicle),
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
