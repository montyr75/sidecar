import 'dart:async';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/components.dart';
import '../../../../models/components.dart';
import '../../../../models/enums.dart';
import '../../../../models/form_models.dart';
import '../../../car_record_sheet/controller/car_state.dart';
import '../car_builder/car_builder_state.dart';

part 'car_builder_ctrl.g.dart';

@riverpod
class CarBuilderCtrl extends _$CarBuilderCtrl {
  @override
  CarBuilderState build([CarBuilderState? initialValue]) {
    if (initialValue == null) {
      scheduleMicrotask(() {
        addComponent(
          Location.crew,
          InstalledComponent(
            id: '',
            component: components['Hand Cannon']!,
            loc: Location.crew,
          ),
        );
      });

      return const CarBuilderState();
    }

    scheduleMicrotask(() => onDivisionChanged(initialValue.division));
    return initialValue;
  }

  void nameChanged(String value) {
    state = state.copyWith(name: RequiredStringFormField.dirty(value));
  }

  void onChassisChanged(Chassis value) {
    state = state.copyWith(chassis: value);
  }

  void onDivisionChanged(int div) {
    if (div < 6 && state.components.any((value) => value.hasAttribute(Attribute.requiresDiv6))) {
      _removeComponentsByAttribute(Attribute.requiresDiv6);
    }

    final apBonus = state.attributeCount(Attribute.awardsAP);
    final cpBonus = state.attributeCount(Attribute.awardsCP);

    state = state.copyWith(
      division: div,
      ap: div + apBonus,
      bp: div * 4,
      cp: div + cpBonus,
    );
  }

  void addComponent(Location loc, InstalledComponent component) {
    final comps = state.components.toList()
      ..addAll([
        component,
        if (component.hasAttribute(Attribute.paired)) component,
      ]);

    final newState = state.copyWith(
      components: List<InstalledComponent>.unmodifiable(comps),
      attributes: List<Attribute>.unmodifiable(comps.allAttributes),
      restrictions: List<Restriction>.unmodifiable(comps.allRestrictions),
    );

    state = newState;

    onDivisionChanged(state.division);
  }

  void removeComponent(InstalledComponent component) {
    List<InstalledComponent> comps = state.components.toList()..remove(component);

    if (component.hasAttribute(Attribute.paired)) {
      final otherPairedComp = comps.firstWhereOrNull((value) => value.name == component.name);
      comps.remove(otherPairedComp);
    }

    state = state.copyWith(
      components: List<InstalledComponent>.unmodifiable(comps),
      attributes: List<Attribute>.unmodifiable(comps.allAttributes),
      restrictions: List<Restriction>.unmodifiable(comps.allRestrictions),
    );

    onDivisionChanged(state.division);
  }

  void _removeComponentsByAttribute(Attribute attr) {
    final comps = state.components.toList()..removeWhere((value) => value.hasAttribute(attr));

    state = state.copyWith(
      components: List<InstalledComponent>.unmodifiable(comps),
      attributes: List<Attribute>.unmodifiable(comps.allAttributes),
      restrictions: List<Restriction>.unmodifiable(comps.allRestrictions),
    );

    onDivisionChanged(state.division);
  }

  void saveBuild() {
    if (state.isValid) {
      // TODO: Save the build to the db.
    }
  }
}
