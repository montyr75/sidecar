import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/vehicle_guide.dart';
import '../../models/enums.dart';
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
                children: Chassis.officialValues.map<ChassisTile>((value) => ChassisTile(chassis: value)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChassisTile extends StatelessWidget {
  final Chassis chassis;

  const ChassisTile({Key? key, required this.chassis}) : super(key: key);

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
      onTap: () => showChassisPage(context: context, chassis: chassis),
    );
  }
}

void showChassisPage({
  required BuildContext context,
  required Chassis chassis,
  CarSelectorMode mode = CarSelectorMode.drive,
}) {
  final carStates = vg.getByChassis(chassis).map((value) => CarState.fromCar(value)).toList();

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => ChassisPage(mode: mode, chassis: chassis, vehicles: carStates),
    ),
  );
}