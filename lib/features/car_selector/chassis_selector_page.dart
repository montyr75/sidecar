import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/cars.dart';
import '../../models/car_chassis.dart';
import '../../utils/screen_utils.dart';
import '../car_record_sheet/controller/car_state.dart';
import 'chassis_page.dart';

class ChassisSelectorPage extends ConsumerWidget {
  const ChassisSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Select a Chassis"),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: cars.keys.map<ChassisTile>(
                  (chassisType) {
                    return ChassisTile(chassis: cars[chassisType]!);
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChassisTile extends StatelessWidget {
  final CarChassis chassis;

  const ChassisTile({Key? key, required this.chassis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        chassis.type.toString(),
        style: const TextStyle(fontSize: 18, fontFamily: 'Audiowide'),
      ),
      trailing: Chip(
        label: Text(
          chassis.type.source.toString(),
          style: const TextStyle(fontSize: 10),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: med, vertical: 0),
      ),
      onTap: () => showChassisPage(context, chassis: chassis),
    );
  }
}

void showChassisPage(BuildContext context, {CarSelectorMode mode = CarSelectorMode.drive, required CarChassis chassis}) {
  final carDivs = cars[chassis.type]!;

  final Map<int, CarState> divisionStates = {
    for (final int division in carDivs.divisions.keys)
      division: CarState.fromCar(carDivs.divisions[division]!),
  };

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => ChassisPage(mode: mode, chassis: chassis, carDivisions: divisionStates),
    ),
  );
}