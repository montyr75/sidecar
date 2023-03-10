import '../../../../app_config.dart';
import '../../../../data/components.dart' as db;
import '../../../../models/components.dart';
import '../../../../models/enums.dart';
import '../../../../models/form_models.dart';
import '../../../../models/vehicle.dart';
import '../../../../utils/utils.dart';
import '../../../record_sheet/controller/vehicle_state.dart';

class ShopState {
  static const defaultDivision = 4;

  final int ap;
  final int bp;
  final int cp;

  final RequiredStringFormField name;

  final Chassis chassis;
  final int division;
  final List<ComponentState> components;

  final List<Restriction> restrictions;
  final List<Attribute> attributes;

  const ShopState({
    this.ap = defaultDivision,
    this.bp = defaultDivision * 4,
    this.cp = defaultDivision,
    this.name = const RequiredStringFormField.pure(),
    this.chassis = Chassis.custom,
    this.division = defaultDivision,
    this.components = const [],
    this.restrictions = const [],
    this.attributes = const [],
  });

  factory ShopState.fromVehicle(Vehicle vehicle) {
    final List<ComponentState> comps = [];
    for (final loc in Location.values) {
      final locComps = vehicle.locs[loc]?.map((key) => db.components[key]!) ?? const [];
      comps.addAll(createInstalledComponents(locComps, loc));
    }

    return ShopState(
      ap: vehicle.division,
      bp: vehicle.division * 4,
      cp: vehicle.division,
      name: RequiredStringFormField.pure(vehicle.name),
      chassis: vehicle.chassis,
      division: vehicle.division,
      components: List<ComponentState>.unmodifiable(comps),
      restrictions: comps.allRestrictions,
      attributes: comps.allAttributes,
    );
  }

  ShopState copyWith({
    int? ap,
    int? bp,
    int? cp,
    RequiredStringFormField? name,
    Chassis? chassis,
    int? division,
    List<ComponentState>? components,
    List<Restriction>? restrictions,
    List<Attribute>? attributes,
  }) {
    return ShopState(
      ap: ap ?? this.ap,
      bp: bp ?? this.bp,
      cp: cp ?? this.cp,
      name: name ?? this.name,
      chassis: chassis ?? this.chassis,
      division: division ?? this.division,
      components: components ?? this.components,
      restrictions: restrictions ?? this.restrictions,
      attributes: attributes ?? this.attributes,
    );
  }

  int get bpSpent {
    final comps = components.allCarComponents;
    final pairedItems = comps.where((value) => value.hasAttribute(Attribute.paired)).toList();

    return (comps.totalCost - (pairedItems.totalCost ~/ 2)).toInt();
  }

  int get cpSpent => components.allCrewComponents.map((value) => value.cost).sum();

  bool get hasDriver => components.hasDriver;

  bool get hasGunner => components.hasGunner;

  bool hasRestriction(Restriction value) => restrictions.contains(value);

  int attributeCount(Attribute value) => attributes.count(value);

  int componentTypeCount(ComponentType type) => components.where((value) => value.type == type).length;

  bool hasMatchingComponentByLoc(Location loc, ComponentState component) => components.any((value) =>
      value.name == component.name &&
      value.loc == loc &&
      value.type == component.type &&
      value.subtype == component.subtype);

  bool hasComponentTypeByLoc(Location loc, ComponentType type) =>
      components.any((value) => value.type == type && value.loc == loc);

  bool hasComponentByName(String name) => components.any((value) => value.name == name);
  bool hasComponentBySubtype(ComponentSubtype subtype) => components.any((value) => value.subtype == subtype);

  bool get isValid {
    return [
      name.valid,
      hasDriver,
      hasGunner,
      bpSpent <= bp,
      cpSpent <= cp,
    ].allTrue;
  }

  bool get canSave => name.valid;

  Vehicle toVehicle() {
    final crew = components.allCrewComponents.map((value) => value.component.toKey()).toList();
    final front = components.getCarCompsByLoc(Location.front).map((value) => value.component.toKey()).toList();
    final left = components.getCarCompsByLoc(Location.left).map((value) => value.component.toKey()).toList();
    final right = components.getCarCompsByLoc(Location.right).map((value) => value.component.toKey()).toList();
    final back = components.getCarCompsByLoc(Location.back).map((value) => value.component.toKey()).toList();
    final turret = components.getCompsByAttr(Attribute.turret).map((value) => value.component.toKey()).toList();
    final upgrade = components.upgrades.map((value) => value.component.toKey()).toList();

    return Vehicle(
      version: version,
      id: uuid.v4(),
      name: name.value.trim(),
      chassis: chassis,
      division: division,
      locs: {
        Location.crew: crew,
        if (front.isNotEmpty) Location.front: front,
        if (left.isNotEmpty) Location.left: left,
        if (right.isNotEmpty) Location.right: right,
        if (back.isNotEmpty) Location.back: back,
        if (turret.isNotEmpty) Location.turret: turret,
        if (upgrade.isNotEmpty) Location.upgrade: upgrade,
      },
    );
  }

  VehicleState toState(String uid) => VehicleState.fromVehicle(toVehicle());
}
