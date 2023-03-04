import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/car_record_sheet/controller/car_ctrl.dart';
import '../models/components.dart';
import '../models/enums.dart';
import '../services/app/app_service.dart';
import '../utils/screen_utils.dart';
import 'component_display.dart';
import 'mod_display.dart';
import 'token_pile.dart';

class ComponentDialog extends ConsumerWidget {
  final InstalledComponent component;

  const ComponentDialog({
    Key? key,
    required this.component,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialState = ref.read(appServiceProvider).initialCarState!;

    final carState = ref.watch(carCtrlProvider(initialState));

    final instComp = carState.findComponentById(component.id)!;

    final controls = <Widget>[
      if (instComp.isExpendable)
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Expended", style: TextStyle(fontSize: 10)),
            Checkbox(
              value: instComp.isExpended,
              onChanged: (value) =>
                  ref.read(carCtrlProvider(initialState).notifier).markComponentExpended(instComp, value!),
            ),
          ],
        ),
      if (instComp.hasAttribute(Attribute.canStoreControl) && !instComp.isDestroyed)
        TokenPile(
          width: 100,
          minHeight: 50,
          value: (instComp as InstalledComponentWithControl).control,
          max: 1,
          tokenBuilder: (_) => const ControlToken(),
          emptyBuilder: (_) => const Text(
            "No control.",
            style: TextStyle(
              color: Colors.green,
              fontStyle: FontStyle.italic,
              fontSize: 10,
            ),
          ),
          onPressedInc: () => ref.read(carCtrlProvider(initialState).notifier).incrementComponentControl(instComp),
          onPressedDec: () => ref.read(carCtrlProvider(initialState).notifier).decrementComponentControl(instComp),
        ),
      if (instComp.canBeDamaged) ...[
        const Spacer(),
        TokenPile(
          width: max(42.0 * instComp.maxDurability, 74),
          minHeight: 50,
          value: instComp.maxDurability - instComp.currentDurability!,
          max: instComp.maxDurability,
          tokenBuilder: (_) => const DamageToken(),
          emptyBuilder: (_) => const Text(
            "No damage.",
            style: TextStyle(
              color: Colors.green,
              fontStyle: FontStyle.italic,
              fontSize: 10,
            ),
          ),
          onPressedInc: () => ref.read(carCtrlProvider(initialState).notifier).decrementComponentDurability(instComp),
          onPressedDec: () => ref.read(carCtrlProvider(initialState).notifier).incrementComponentDurability(instComp),
        ),
      ],
    ];

    return Container(
      width: ComponentDisplay.defaultWidth,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.grey),
        borderRadius: radiusM,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ComponentDisplay(
            value: instComp,
            abbreviate: false,
          ),
          if (controls.isNotEmpty)
            Container(
              padding: paddingAllM,
              width: ComponentDisplay.defaultWidth,
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controls,
              ),
            ),
        ],
      ),
    );
  }
}
