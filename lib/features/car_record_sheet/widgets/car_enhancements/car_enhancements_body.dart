import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/screen_utils.dart';
import '../../controller/car_ctrl.dart';
import '../../controller/car_state.dart';
import 'accessories_table.dart';
import 'structure_table.dart';
import 'upgrades_table.dart';

class CarEnhancementsBody extends ConsumerWidget {
  final CarState initialState;

  const CarEnhancementsBody({Key? key, required this.initialState}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(carCtrlProvider(initialState));

    return Column(
      children: [
        if (state.hasAccessories) AccessoriesTable(accessories: state.accessories),
        if (state.hasUpgrades) ...[
          boxXL,
          UpgradesTable(upgrades: state.upgrades),
        ],
        if (state.hasStructure) ...[
          boxXL,
          StructureTable(structure: state.structure),
        ],
        const SizedBox(height: 160),
      ],
    );
  }
}
