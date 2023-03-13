import 'package:flutter/material.dart';

import '../../../models/components.dart';
import '../../../models/damage_dice.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/component_display.dart';

class CrewDamageDiceDisplay extends StatelessWidget {
  final ComponentState driver;
  final ComponentState gunner;
  final CrewDamageDice data;

  const CrewDamageDiceDisplay({
    Key? key,
    required this.driver,
    required this.gunner,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (data.driverDamage != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                ComponentHeader(component: driver),
                boxS,
                DamageDiceDisplay(data: data.driverDamage!),
              ],
            ),
          if (data.gunnerDamage != null) ...[
            boxXXL,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                ComponentHeader(component: gunner),
                boxS,
                DamageDiceDisplay(data: data.gunnerDamage!),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
