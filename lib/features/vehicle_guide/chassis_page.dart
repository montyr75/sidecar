import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';

import '../../models/enums.dart';
import '../../routes.dart';
import '../../services/app/app_service.dart';
import '../../utils/screen_utils.dart';
import '../../widgets/vehicle_browser.dart';
import '../car_record_sheet/controller/car_state.dart';
import '../chop_shop/controllers/car_builder_state.dart';

enum CarSelectorMode {
  drive,
  build;

  @override
  String toString() => ReCase(name).titleCase;
}

class ChassisPage extends ConsumerWidget {
  final CarSelectorMode mode;
  final Chassis chassis;
  final List<CarState> vehicles;

  const ChassisPage({
    Key? key,
    this.mode = CarSelectorMode.drive,
    required this.chassis,
    required this.vehicles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                    vehicles: vehicles,
                    selectionText: mode.toString(),
                    onSelected: mode == CarSelectorMode.drive
                        ? (carState) {
                            ref.read(appServiceProvider.notifier).driveCar(carState);
                            context.goNamed(AppRoute.carRecordSheet.name);
                          }
                        : (carState) {
                            ref.read(appServiceProvider.notifier).buildCar(CarBuilderState.fromVehicle(carState.car));
                            Navigator.of(context).pop();
                          },
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
