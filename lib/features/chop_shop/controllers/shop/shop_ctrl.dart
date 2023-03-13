import 'dart:async';

import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/components.dart';
import '../../../../models/components.dart';
import '../../../../models/enums.dart';
import '../../../../models/form_models.dart';
import '../../../record_sheet/controller/vehicle_state.dart';
import '../shop/shop_state.dart';

part 'shop_ctrl.g.dart';

@riverpod
class ShopCtrl extends _$ShopCtrl {
  @override
  ShopState build([ShopState? initialValue]) {
    if (initialValue == null) {
      scheduleMicrotask(() {
        addComponent(
          loc: Location.crew,
          component: InstalledComponent(
            id: '',
            component: components['Hand Cannon']!,
            loc: Location.crew,
          ),
        );
      });

      return const ShopState();
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

  PrecheckResult addComponentPrecheck(Location loc, InstalledComponent component) {
    InstalledComponent? Function() compFinder = () => null;
    late final ConflictReason reason;

    if (component.hasRestriction(Restriction.exclusive)) {
      compFinder = () => state.components.firstWhereOrNull((value) => value.hasRestriction(Restriction.exclusive));
      reason = ConflictReason.exclusive;
    }
    else if (component.isDriver || component.isGunner) {
      compFinder = () => state.components
          .firstWhereOrNull((value) => value.type == component.type && value.subtype == component.subtype);
      reason = ConflictReason.crew;
    }
    else if (component.isAccessory || component.isSidearm) {
      compFinder = () =>
          state.components.firstWhereOrNull((value) => value.type == component.type && value.name == component.name);
      reason = ConflictReason.accessoryOrSidearm;
    }
    else if (component.isUpgrade || component.isGear) {
      compFinder = () => state.components.firstWhereOrNull((value) =>
          value.type == component.type &&
          (value.name == component.name || (value.hasSubtype && value.subtype == component.subtype)));
      reason = ConflictReason.upgradeOrGear;
    }
    else if (component.isStructure && component.loc == loc) {
      compFinder = () =>
          state.components.firstWhereOrNull((value) => value.type == component.type && value.loc == component.loc);
      reason = ConflictReason.structure;
    }

    final existingComp = compFinder();

    return PrecheckResult(
      loc: loc,
      compToAdd: component,
      existingComp: existingComp,
      reason: existingComp == null ? ConflictReason.noConflict : reason,
    );
  }

  void addComponent({required Location loc, required InstalledComponent component, InstalledComponent? existingComp}) {
    final comps = state.components.toList();

    if (existingComp != null) {
      comps.remove(existingComp);
    }

    comps.addAll([
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
}

enum ConflictReason {
  noConflict,
  exclusive,
  crew,
  accessoryOrSidearm,
  upgradeOrGear,
  structure,
}

class PrecheckResult {
  final Location loc;
  final InstalledComponent compToAdd;
  final InstalledComponent? existingComp;
  final ConflictReason reason;

  const PrecheckResult({
    required this.loc,
    required this.compToAdd,
    this.existingComp,
    required this.reason,
  });

  String toReasonString() {
    switch (reason) {
      case ConflictReason.exclusive:
        return "Your vehicle can have only one exclusive component. Do you want to replace the ${existingComp!.name} with the ${compToAdd.name}?";
      case ConflictReason.crew: return "Your vehicle can have only one ${compToAdd.subtype.toString().toLowerCase()}. Do you want to replace ${existingComp!.name} with ${compToAdd.name}?";
      case ConflictReason.accessoryOrSidearm: return "Your ${compToAdd.type == ComponentType.accessory ? 'vehicle' : 'crew'} can have only one ${compToAdd.type.toString().toLowerCase()} of the same name. Do you want to replace the ${existingComp!.name} with the ${compToAdd.name}?";
      case ConflictReason.upgradeOrGear: return compToAdd.type == ComponentType.upgrade
          ? "Your vehicle can have only one upgrade of the same name or type. Do you want to replace the ${existingComp!.name} with the ${compToAdd.name}?"
          : "Your crew can have only one piece of gear of the same name or type. Do you want to replace the ${existingComp!.name} with the ${compToAdd.name}?";
      case ConflictReason.structure: return "Your vehicle can have only one structure enhancement per side. Do you want to replace the ${existingComp!.name} with the ${compToAdd.name}?";
      default: return '';
    }
  }

  bool get hasConflict => reason != ConflictReason.noConflict;
}
