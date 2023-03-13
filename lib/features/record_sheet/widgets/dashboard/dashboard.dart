import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../../models/enums.dart';
import '../../../../services/app/app_service.dart';
import '../../../../utils/screen_utils.dart';
import '../../../../widgets/mod_display.dart';
import '../../../../widgets/token_pile.dart';
import '../../../chop_shop/pages/shop_page.dart';
import '../../controller/vehicle_ctrl.dart';
import '../../controller/vehicle_state.dart';
import '../maneuvers_display.dart';
import 'armor_gauge.dart';
import 'control_readout.dart';
import 'power_plant_gauge.dart';
import 'speed_gauge.dart';
import 'tires_gauge.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialState = ref.watch(appServiceProvider).initialCarState!;

    final state = ref.watch(vehicleCtrlProvider(initialState));
    final ctrl = ref.read(vehicleCtrlProvider(initialState).notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TokenPile(
                  value: state.control,
                  tokenBuilder: (_) => const ControlToken(),
                  emptyBuilder: (_) => const Text(
                    "Out of Control!",
                    style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressedInc: ctrl.incrementControl,
                  onPressedDec: ctrl.decrementControl,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Tooltip(
                  message: "Collect CONTROL and ACE for the Take Control step",
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () => ctrl.takeControlStep(),
                    child: const Text("Take Control"),
                  ),
                ),
                boxL,
                Tooltip(
                  message: "Show maneuver dice",
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () => _showManeuversDisplay(state, ref),
                    child: const Text("Maneuvers"),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TokenPile(
                  value: state.ace,
                  tokenBuilder: (_) => const AceToken(),
                  emptyBuilder: (_) => const Text(
                    "Out of Ace",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onPressedInc: ctrl.incrementAce,
                  onPressedDec: ctrl.decrementAce,
                ),
              ],
            ),
          ],
        ),
        boxL,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ArmorGauge(
              loc: Location.front,
              value: state[Location.front].armor.value,
              max: state[Location.front].armor.max,
              fire: state[Location.front].fire,
              paint: state[Location.front].paint,
              onPressedInc: () => ctrl.incrementArmor(Location.front),
              onPressedDec: () => ctrl.decrementArmor(Location.front),
              onFirePressed: () => ctrl.toggleFire(Location.front),
              onPaintPressed: () => ctrl.togglePaint(Location.front),
            ),
            boxS,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ArmorGauge(
                  loc: Location.left,
                  value: state[Location.left].armor.value,
                  max: state[Location.left].armor.max,
                  fire: state[Location.left].fire,
                  paint: state[Location.left].paint,
                  onPressedInc: () => ctrl.incrementArmor(Location.left),
                  onPressedDec: () => ctrl.decrementArmor(Location.left),
                  onFirePressed: () => ctrl.toggleFire(Location.left),
                  onPaintPressed: () => ctrl.togglePaint(Location.left),
                ),
                boxS,
                Container(
                  width: 525,
                  height: 275,
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(
                      side: BorderSide(
                        width: 2,
                        color: Colors.white12,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(1.2, 0),
                        child: PowerPlantGauge(
                          value: state.powerPlant,
                          onPressedInc: ctrl.incrementPowerPlant,
                          onPressedDec: ctrl.decrementPowerPlant,
                        ),
                      ),
                      Align(
                        alignment: const Alignment(-1.2, 0),
                        child: TiresGauge(
                          value: state.tires,
                          onPressedInc: ctrl.incrementTires,
                          onPressedDec: ctrl.decrementTires,
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0, -0.5),
                        child: SpeedGauge(
                          value: state.speed,
                          maxSpeed: state.maxSpeed,
                          onPressedInc: ctrl.incrementSpeed,
                          onPressedDec: ctrl.decrementSpeed,
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0, 0.73),
                        child: ControlReadout(value: state.handling),
                      ),
                    ],
                  ),
                ),
                boxS,
                ArmorGauge(
                  loc: Location.right,
                  value: state[Location.right].armor.value,
                  max: state[Location.right].armor.max,
                  fire: state[Location.right].fire,
                  paint: state[Location.right].paint,
                  onPressedInc: () => ctrl.incrementArmor(Location.right),
                  onPressedDec: () => ctrl.decrementArmor(Location.right),
                  onFirePressed: () => ctrl.toggleFire(Location.right),
                  onPaintPressed: () => ctrl.togglePaint(Location.right),
                ),
              ],
            ),
            boxS,
            ArmorGauge(
              loc: Location.back,
              value: state[Location.back].armor.value,
              max: state[Location.back].armor.max,
              fire: state[Location.back].fire,
              paint: state[Location.back].paint,
              onPressedInc: () => ctrl.incrementArmor(Location.back),
              onPressedDec: () => ctrl.decrementArmor(Location.back),
              onFirePressed: () => ctrl.toggleFire(Location.back),
              onPaintPressed: () => ctrl.togglePaint(Location.back),
            ),
          ],
        ),
      ],
    );
  }

  void _showManeuversDisplay(VehicleState state, WidgetRef ref) {
    final data = state.calculateManeuverDice();

    SmartDialog.show(builder: (_) {
      return SimpleDialog(
        backgroundColor: Colors.grey,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: med, vertical: med),
            decoration: const BoxDecoration(color: Colors.black),
            child: const Text("Maneuvers"),
          ),
        ),
        titleTextStyle: ShopPage.labelStyle.copyWith(fontSize: 18),
        titlePadding: noPadding,
        children: [
          Padding(
            padding: paddingAllM,
            child: ManeuversDisplay(data: data),
          ),
          boxM,
          Container(
            alignment: Alignment.center,
            color: Colors.black,
            padding: paddingAllM,
            child: Tooltip(
              message: "Receive 1 Ace token",
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  final initialState = ref.read(appServiceProvider).initialCarState!;
                  ref.read(vehicleCtrlProvider(initialState).notifier).incrementAce();
                },
                child: const Padding(
                  padding: EdgeInsets.all(med),
                  child: Text.rich(
                    TextSpan(
                      text: "Maneuver: +",
                      children: [
                        WidgetSpan(child: AceToken()),
                      ]
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
