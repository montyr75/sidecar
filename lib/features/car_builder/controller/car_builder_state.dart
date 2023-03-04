import '../../../data/components.dart' as db;
import '../../../models/car.dart';
import '../../../models/components.dart';
import '../../../models/enums.dart';
import '../../../utils/utils.dart';
import '../../car_record_sheet/controller/car_state.dart';

class CarBuilderState {
  static const defaultDivision = 4;

  final int ap;
  final int bp;
  final int cp;

  final CarChassisType chassis;
  final int division;
  final List<InstalledComponent> components;

  final List<Restriction> restrictions;
  final List<Attribute> attributes;

  const CarBuilderState({
    this.ap = defaultDivision,
    this.bp = defaultDivision * 4,
    this.cp = defaultDivision,
    this.chassis = CarChassisType.custom,
    this.division = defaultDivision,
    this.components = const [],
    this.restrictions = const [],
    this.attributes = const [],
  });

  factory CarBuilderState.fromCar(Car car) {
    final List<InstalledComponent> comps = [];
    for (final loc in Location.values) {
      final locComps = car.locs[loc]?.map((key) => db.components[key]!) ?? const [];
      comps.addAll(createInstalledComponents(locComps, loc));
    }

    return CarBuilderState(
      ap: car.division,
      bp: car.division * 4,
      cp: car.division,
      chassis: car.chassis,
      division: car.division,
      components: List<InstalledComponent>.unmodifiable(comps),
      restrictions: comps.allRestrictions,
      attributes: comps.allAttributes,
    );
  }

  CarBuilderState copyWith({
    int? ap,
    int? bp,
    int? cp,
    CarChassisType? chassis,
    int? division,
    List<InstalledComponent>? components,
    List<Restriction>? restrictions,
    List<Attribute>? attributes,
  }) {
    return CarBuilderState(
      ap: ap ?? this.ap,
      bp: bp ?? this.bp,
      cp: cp ?? this.cp,
      chassis: chassis ?? this.chassis,
      division: division ?? this.division,
      components: components ?? this.components,
      restrictions: restrictions ?? this.restrictions,
      attributes: attributes ?? this.attributes,
    );
  }

  int get bpSpent =>
      components.allCarComponents.map((value) => value.cost).sum() -
      (components.where((value) => value.hasAttribute(Attribute.paired)).length ~/ 2);

  int get cpSpent => components.allCrewComponents.map((value) => value.cost).sum();

  bool get hasDriver => components.hasDriver;

  bool get hasGunner => components.hasGunner;

  bool hasRestriction(Restriction value) => restrictions.contains(value);

  int attributeCount(Attribute value) => attributes.count(value);

  int componentTypeCount(ComponentType type) => components.where((value) => value.type == type).length;

  bool hasMatchingComponentByLoc(Location loc, InstalledComponent component) => components.any((value) =>
      value.name == component.name &&
      value.loc == loc &&
      value.type == component.type &&
      value.subtype == component.subtype);

  bool hasComponentTypeByLoc(Location loc, ComponentType type) =>
      components.any((value) => value.type == type && value.loc == loc);

  bool hasComponentBySubtype(ComponentSubtype subtype) => components.any((value) => value.subtype == subtype);

  bool get canDrive {
    return [
      hasDriver,
      hasGunner,
      bpSpent <= bp,
      cpSpent <= cp,
    ].allTrue;
  }

  Car toCar() {
    final crew = components.allCrewComponents.map((value) => value.component.toKey()).toList();
    final front = components.getCarCompsByLoc(Location.front).map((value) => value.component.toKey()).toList();
    final left = components.getCarCompsByLoc(Location.left).map((value) => value.component.toKey()).toList();
    final right = components.getCarCompsByLoc(Location.right).map((value) => value.component.toKey()).toList();
    final back = components.getCarCompsByLoc(Location.back).map((value) => value.component.toKey()).toList();
    final turret = components.getCompsByAttr(Attribute.turret).map((value) => value.component.toKey()).toList();
    final upgrade = components.upgrades.map((value) => value.component.toKey()).toList();

    return Car(
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
}
