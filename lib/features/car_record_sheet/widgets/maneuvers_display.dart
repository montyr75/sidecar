import 'package:flutter/material.dart';

import '../../../models/damage_dice.dart';
import '../../../models/enums.dart';
import '../../../utils/utils.dart';
import '../../../widgets/component_display.dart';

class ManeuversDisplay extends StatelessWidget {
  final Map<Maneuver, DamageDice> data;

  const ManeuversDisplay({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final maneuver in data.keys)
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  maneuver.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Facon',
                  ),
                ),
                const Spacer(),
                DamageDiceDisplay(data: data[maneuver]!),
              ],
            ),
        ].joinWidgetList(const Divider(color: Colors.black45)).toList(),
      ),
    );
  }
}
