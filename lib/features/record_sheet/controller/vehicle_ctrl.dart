import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/components.dart';
import '../../../models/enums.dart';
import '../../../utils/utils.dart';
import 'vehicle_state.dart';

part 'vehicle_ctrl.g.dart';

@riverpod
class VehicleCtrl extends _$VehicleCtrl {
  VehicleState? _initialState;

  @override
  VehicleState build(VehicleState value) => _initialState = value;

  void updateSpeed(int value) => state = state.copyWith(speed: value);
  void incrementSpeed() => updateSpeed(state.speed + 1);
  void decrementSpeed() => updateSpeed(state.speed - 1);

  void updateTires(int value) => state = state.copyWith(tires: value);
  void incrementTires() => updateTires(state.tires + 1);
  void decrementTires() => updateTires(state.tires - 1);

  void updatePowerPlant(int value) => state = state.copyWith(powerPlant: value);
  void incrementPowerPlant() => updatePowerPlant(state.powerPlant + 1);
  void decrementPowerPlant() => updatePowerPlant(state.powerPlant - 1);

  void updateControl(int value) => state = state.copyWith(control: value);
  void incrementControl() => updateControl(state.control + 1);
  void decrementControl() => updateControl(state.control - 1);

  void updateAce(int value) => state = state.copyWith(ace: value);
  void incrementAce() => updateAce(state.ace + 1);
  void decrementAce() => updateAce(state.ace - 1);

  void updateArmor(Location loc, int value) {
    final locs = state.cloneLocs();
    final location = locs[loc]!;

    locs[loc] = location.copyWith(
      armor: location.armor.copyWith(value: value),
    );

    state = state.copyWith(locs: locs);
  }
  void incrementArmor(Location loc) => updateArmor(loc, state[loc].armor.value + 1);
  void decrementArmor(Location loc) => updateArmor(loc, state[loc].armor.value - 1);

  void toggleFire(Location loc) {
    final locs = state.cloneLocs();
    final location = locs[loc]!;

    locs[loc] = location.copyWith(
      fire: !location.fire,
    );

    state = state.copyWith(locs: locs);
  }

  void togglePaint(Location loc) {
    final locs = state.cloneLocs();
    final location = locs[loc]!;

    locs[loc] = location.copyWith(
      paint: !location.paint,
    );

    state = state.copyWith(locs: locs);
  }

  void updateComponentDurability(InstalledComponent component, int value) {
    final comps = List<InstalledComponent>.unmodifiable(
      state.components.toList()
        ..replaceWith(
          component,
          component.copyWith(currentDurability: value),
        ),
    );

    state = state.copyWith(
      components: comps,
      attributes: comps.allAttributes,
    );
  }
  void incrementComponentDurability(InstalledComponent component) {
    updateComponentDurability(component, component.currentDurability! + 1);
  }
  void decrementComponentDurability(InstalledComponent component) {
    updateComponentDurability(component, component.currentDurability! - 1);
  }

  void updateComponentControl(InstalledComponentWithControl component, int value) {
    final comps = List<InstalledComponent>.unmodifiable(
      state.components.toList()
        ..replaceWith(
          component,
          component.copyWith(control: value),
        ),
    );

    state = state.copyWith(components: comps);
  }
  void incrementComponentControl(InstalledComponentWithControl component) {
    updateComponentControl(component, component.control + 1);
  }
  void decrementComponentControl(InstalledComponentWithControl component) {
    updateComponentControl(component, component.control - 1);
  }

  void markComponentExpended(InstalledComponent component, bool value) {
    final comps = List<InstalledComponent>.unmodifiable(
      state.components.toList()
        ..replaceWith(
          component,
          component.copyWith(isExpended: value),
        ),
    );

    state = state.copyWith(
      components: comps,
      attributes: comps.allAttributes,
    );
  }

  void takeControlStep() {
    int control = 0;
    int ace = 0;

    for (final attr in state.attributes) {
      switch (attr) {
        case Attribute.takeControl: control++; break;
        case Attribute.takeControl2: control += 2; break;
        case Attribute.takeControlSpeed4: state.speed == 4 ? control++ : null; break;
        case Attribute.takeControl2Speed5: state.speed == 5 ? control += 2 : null; break;
        case Attribute.takeAce: ace++; break;
        case Attribute.takeAce2: ace += 2; break;
        case Attribute.takeAce3: ace += 3; break;
        default: null;
      }
    }

    control += state.handling;

    updateControl(control);
    updateAce(ace);
  }

  void reset() => state = build(_initialState!);
}
