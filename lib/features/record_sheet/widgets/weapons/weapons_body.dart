import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/enums.dart';
import '../../../../utils/screen_utils.dart';
import '../../controller/vehicle_ctrl.dart';
import '../../controller/vehicle_state.dart';
import 'weapon_table.dart';

class WeaponsBody extends ConsumerWidget {
  final VehicleState initialState;

  const WeaponsBody({Key? key, required this.initialState}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vehicleCtrlProvider(initialState));

    return Column(
      children: [
        WeaponTable(state: state, type: ComponentType.sidearm),
        if (state.hasWeapons) ...[
          boxXL,
          WeaponTable(state: state),
        ],
      ],
    );
  }
}
