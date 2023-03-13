import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/screen_utils.dart';
import '../../controller/vehicle_ctrl.dart';
import '../../controller/vehicle_state.dart';
import 'crew_table.dart';
import 'gear_table.dart';

class CrewBody extends ConsumerWidget {
  final VehicleState initialState;

  const CrewBody({Key? key, required this.initialState}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vehicleCtrlProvider(initialState));

    return Column(
      children: [
        CrewTable(component: state.driver!),
        boxXL,
        CrewTable(component: state.gunner!),
        if (state.hasGear) ...[
          boxXL,
          GearTable(gear: state.gear),
        ],
      ],
    );
  }
}
