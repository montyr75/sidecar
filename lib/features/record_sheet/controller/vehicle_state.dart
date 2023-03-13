import 'package:collection/collection.dart' hide IterableIntegerExtension;
import 'package:dart_mappable/dart_mappable.dart';

import '../../../data/components.dart' as db;
import '../../../models/components.dart';
import '../../../models/damage_dice.dart';
import '../../../models/enums.dart';
import '../../../models/vehicle.dart';
import '../../../utils/utils.dart';

part 'vehicle_state.mapper.dart';

const defaultSpeed = 2;
const defaultPowerPlant = 10;
const defaultTires = 10;

@MappableClass()
class VehicleState with VehicleStateMappable {
  final String id;
  final Vehicle vehicle;
  final List<ComponentState> components;
  final Map<Location, LocationState> locs;
  final List<Attribute> attributes;
  final int speed;
  final int powerPlant;
  final int tires;
  final int control;
  final int ace;

  final String? saveName;

  const VehicleState({
    required this.id,
    required this.vehicle,
    required this.components,
    required this.locs,
    required this.attributes,
    this.speed = defaultSpeed,
    this.powerPlant = defaultPowerPlant,
    this.tires = defaultTires,
    this.control = 0,
    this.ace = 0,
    this.saveName,
  });

  factory VehicleState.fromVehicle(Vehicle vehicle) {
    final List<ComponentState> comps = [];
    for (final loc in Location.values) {
      final locComps = vehicle.locs[loc]?.map((key) => db.components[key]!) ?? const [];
      comps.addAll(createInstalledComponents(locComps, loc));
    }

    final attributes = comps.allAttributes;

    if (attributes.hasAttribute(Attribute.enhancesCrewDurability)) {
      final driver = comps.driver!;
      final gunner = comps.gunner!;

      comps.replaceWith(
        driver,
        driver.copyWith(
          currentDurability: driver.currentDurability! + 1,
          component: driver.component.copyWith(durability: driver.component.durability! + 1),
        ),
      );

      comps.replaceWith(
        gunner,
        gunner.copyWith(
          currentDurability: gunner.currentDurability! + 1,
          component: gunner.component.copyWith(durability: gunner.component.durability! + 1),
        ),
      );
    }

    return VehicleState(
      id: uuid.v4(),
      vehicle: vehicle,
      components: List<ComponentState>.unmodifiable(comps),
      locs: Map<Location, LocationState>.unmodifiable({
        for (final loc in Location.carLocs)
          loc: LocationState.fromCar(
            loc: loc,
            car: vehicle,
            bonusAP: attributes.hasAttribute(Attribute.awardsAP) ? 1 : 0,
          ),
      }),
      attributes: attributes,
    );
  }

  CrewDamageDice calculateDamageDice(Weapon weapon) {
    DamageDice? driverDamage;
    DamageDice? gunnerDamage;

    int crewBonusBlue = 0;
    int crewBonusYellow = 0;
    int crewBonusTires = 0;

    if (hasAttribute(Attribute.attackCrewBlue1)) {
      crewBonusBlue++;
    }

    if (hasAttribute(Attribute.attackCrewBlue2)) {
      crewBonusBlue += 2;
    }

    if (hasAttribute(Attribute.attackCrewYellow1)) {
      crewBonusYellow++;
    }

    if (weapon.hasAttribute(Attribute.attackIncendiaryTires1)) {
      crewBonusTires++;
    }

    if (weapon.hasAttribute(Attribute.attackIncendiaryTires2)) {
      crewBonusTires += 2;
    }

    if (weapon.hasDamageDice) {
      if (!driver!.isDestroyed && weapon.hasDamageDice) {
        driverDamage = weapon.damageDice!;

        int driverBonusYellow = 0;

        if (hasAttribute(Attribute.attackDriverYellow11)) {
          driverBonusYellow++;
        }

        driverDamage = driverDamage
            .addDice(Die.blue, crewBonusBlue)
            .addDice(Die.yellow, crewBonusYellow + driverBonusYellow)
            .copyWith(tiresDamage: driverDamage.tiresDamage + crewBonusTires);
      }

      if (!gunner!.isDestroyed) {
        gunnerDamage = weapon.damageDice!;

        int gunnerBonusBasic = 0;
        int gunnerBonusBlack = 0;
        int gunnerBonusYellow = 0;
        int gunnerBonusBlue = 0;

        if (hasAttribute(Attribute.attackGunnerBasic1)) {
          gunnerBonusBasic++;
        }

        if (hasAttribute(Attribute.attackGunnerBasic2)) {
          gunnerBonusBasic += 2;
        }

        if (hasAttribute(Attribute.attackGunnerYellow1Blue1)) {
          gunnerBonusYellow++;
          gunnerBonusBlue++;
        }

        if (hasAttribute(Attribute.attackGunnerFireBlack1) && weapon.subtype == ComponentSubtype.fire) {
          gunnerBonusBlack++;
        }

        if (hasAttribute(Attribute.attackGunnerShredBlack1) && weapon.subtype == ComponentSubtype.shred) {
          gunnerBonusBlack++;
        }

        // log.info(attributes);
        // log.info("""
        // crewBonusBlue: $crewBonusBlue
        // crewBonusYellow: $crewBonusYellow
        // crewBonusTires: $crewBonusTires
        // gunnerDamage.tiresDamage: ${gunnerDamage.tiresDamage}
        // gunnerBonusBasic: $gunnerBonusBasic
        // gunnerBonusBlack: $gunnerBonusBlack
        // gunnerBonusYellow: $gunnerBonusYellow
        // gunnerBonusBlue: $gunnerBonusBlue
        // """);

        gunnerDamage = gunnerDamage
            .addDice(Die.blue, crewBonusBlue + gunnerBonusBlue)
            .addDice(Die.yellow, crewBonusYellow + gunnerBonusYellow)
            .addDice(Die.black, gunnerBonusBlack)
            .copyWith(tiresDamage: gunnerDamage.tiresDamage + crewBonusTires)
            .copyWith(basicDamage: gunnerDamage.basicDamage + gunnerBonusBasic);
      }
    }

    return CrewDamageDice(
      driverDamage: driverDamage,
      gunnerDamage: gunnerDamage,
    );
  }

  Map<Maneuver, DamageDice> calculateManeuverDice() {
    Map<Maneuver, DamageDice> maneuverDice = {
      for (final manuever in Maneuver.values)
        manuever: manuever.dice.addDice(Die.yellow, speed),
    };

    if (hasAttribute(Attribute.maneuverBlue1)) {
      maneuverDice = maneuverDice.map((key, value) => MapEntry(key, value.addDice(Die.blue, 1)));
    }

    if (hasAttribute(Attribute.maneuverRemoveYellow1)) {
      maneuverDice = maneuverDice.map((key, value) => MapEntry(key, value.removeDice(Die.yellow, 1)));
    }

    return Map<Maneuver, DamageDice>.unmodifiable(maneuverDice);
  }

  LocationState operator [](Location loc) => locs[loc]!;

  Map<Location, LocationState> cloneLocs() => Map<Location, LocationState>.from(locs);

  ComponentState? get driver => components.driver;
  ComponentState? get gunner => components.gunner;

  List<ComponentState> get crew => components.crew;
  List<ComponentState> get allCrewComponents => components.allCrewComponents;
  List<ComponentState> get allCarComponents => components.allCarComponents;
  List<ComponentState> get sidearms => components.sidearms;
  List<ComponentState> get gear => components.gear;
  List<ComponentState> get weapons => components.weapons;
  List<ComponentState> get accessories => components.accessories;
  List<ComponentState> get upgrades => components.upgrades;
  List<ComponentState> get structure => components.structure;

  bool get hasGear => gear.isNotEmpty;
  bool get hasWeapons => weapons.isNotEmpty;
  bool get hasAccessories => accessories.isNotEmpty;
  bool get hasUpgrades => upgrades.isNotEmpty;
  bool get hasStructure => structure.isNotEmpty;

  bool hasAttribute(Attribute value) => attributes.hasAttribute(value);

  ComponentState? findComponentById(String id) => components.firstWhereOrNull((value) => value.id == id);

  String get name => vehicle.chassis.toString();

  // get the max amount of control the tires allow (based on damage)
  int get tireHandling {
    switch (tires) {
      case 10:
      case 9:
      case 8:
      case 7:
        return 4;
      case 6:
      case 5:
        return 3;
      case 4:
      case 3:
        return 2;
      case 2:
      case 1:
        return 1;
      default:
        return 0;
    }
  }

  // get the max amount of control the speed allows
  int get speedHandling {
    switch (speed) {
      case 0:
      case 1:
      case 2:
        return 2;
      case 3:
        return 1;
      case 4:
      case 5:
      default:
        return 0;
    }
  }

  // get the max amount of control the vehicle allows
  int get handling => tireHandling + speedHandling;

  int get maxSpeed {
    if (hasAttribute(Attribute.preventsTireMaxSpeedAdjustments)) {
      return 5;
    }

    switch (tires) {
      case 10:
      case 9:
      case 8:
      case 7:
        return 5;
      case 6:
      case 5:
        return 4;
      case 4:
      case 3:
        return 3;
      case 2:
      case 1:
        return 2;
      default:
        return 1;
    }
  }

  static const fromMap = VehicleStateMapper.fromMap;
  static const fromJson = VehicleStateMapper.fromJson;
}

@MappableClass()
class LocationState with LocationStateMappable {
  final Location loc;
  final ArmorState armor;
  final bool fire;
  final bool paint;

  const LocationState({
    required this.loc,
    required this.armor,
    this.fire = false,
    this.paint = false,
  });

  factory LocationState.fromCar({required Location loc, required Vehicle car, int bonusAP = 0}) {
    return LocationState(
      loc: loc,
      armor: ArmorState.fromDivision(car.division, bonusAP: bonusAP),
    );
  }

  static const fromMap = LocationStateMapper.fromMap;
  static const fromJson = LocationStateMapper.fromJson;
}

@MappableClass()
class ArmorState with ArmorStateMappable {
  final int value;
  final int max;

  const ArmorState({
    required this.value,
    required this.max,
  });

  factory ArmorState.fromDivision(int division, {int bonusAP = 0}) =>
      ArmorState(value: division + bonusAP, max: division + bonusAP);

  static const fromMap = ArmorStateMapper.fromMap;
  static const fromJson = ArmorStateMapper.fromJson;
}

Iterable<ComponentState> createInstalledComponents(Iterable<Component> comps, Location loc) {
  return comps.map((value) {
    if (value.hasAttribute(Attribute.canStoreControl)) {
      return ComponentStateWithControl(
        id: uuid.v4(),
        loc: loc,
        component: value,
        currentDurability: value.durability,
      );
    } else {
      return ComponentState(
        id: uuid.v4(),
        loc: loc,
        component: value,
        currentDurability: value.durability,
      );
    }
  });
}

extension ListInstCompX on List<ComponentState> {
  ComponentState? get driver => firstWhereOrNull((value) => value.subtype == ComponentSubtype.driver);
  ComponentState? get gunner => firstWhereOrNull((value) => value.subtype == ComponentSubtype.gunner);
  bool get hasDriver => driver != null;
  bool get hasGunner => gunner != null;

  List<ComponentState> get crew =>
      List<ComponentState>.unmodifiable(where((value) => value.type == ComponentType.crew));

  List<ComponentState> get allCrewComponents => List<ComponentState>.unmodifiable([
    if (hasDriver) driver,
    if (hasGunner) gunner,
    ...(sidearms.toList()..sort()),
    ...(gear.toList()..sort()),
  ]);

  List<ComponentState> get allCarComponents =>
      List<ComponentState>.unmodifiable(where((value) => !value.type.isCrewType));

  List<ComponentState> get sidearms =>
      List<ComponentState>.unmodifiable(where((value) => value.type == ComponentType.sidearm));

  List<ComponentState> get gear =>
      List<ComponentState>.unmodifiable(where((value) => value.type == ComponentType.gear));

  List<ComponentState> get weapons =>
      List<ComponentState>.unmodifiable(where((value) => value.type == ComponentType.weapon));

  List<ComponentState> get accessories =>
      List<ComponentState>.unmodifiable(where((value) => value.type == ComponentType.accessory));

  List<ComponentState> get upgrades =>
      List<ComponentState>.unmodifiable(where((value) => value.type == ComponentType.upgrade));

  List<ComponentState> get structure =>
      List<ComponentState>.unmodifiable(where((value) => value.type == ComponentType.structure));

  List<ComponentState> getCompsByLoc(Location loc) =>
      List<ComponentState>.unmodifiable(where((value) => value.loc == loc).toList()..sort());

  List<ComponentState> getCompsByLocAndType(Location loc, ComponentType type) =>
      List<ComponentState>.unmodifiable(where((value) => value.loc == loc && value.type == type));

  List<ComponentState> getCarCompsByLoc(Location loc) => List<ComponentState>.unmodifiable([
    ...(getCompsByLocAndType(loc, ComponentType.weapon).toList()..sort()),
    ...(getCompsByLocAndType(loc, ComponentType.accessory).toList()..sort()),
    ...(getCompsByLocAndType(loc, ComponentType.structure).toList()..sort()),
  ]);

  List<ComponentState> getCompsByAttr(Attribute attr) =>
      List<ComponentState>.unmodifiable(where((value) => value.attributes.contains(attr)));

  List<Attribute> get allAttributes {
    final List<Attribute> list = [];

    for (final comp in this) {
      if (!comp.isDestroyed && !comp.isExpended) {
        list.addAll(comp.attributes);
      }
    }

    return List<Attribute>.unmodifiable(list);
  }

  List<Restriction> get allRestrictions {
    final List<Restriction> list = [];

    for (final comp in this) {
      if (!comp.isDestroyed && !comp.isExpended) {
        list.addAll(comp.restrictions);
      }
    }

    return List<Restriction>.unmodifiable(list);
  }

  int get totalCost => map((value) => value.cost).sum();
}

extension ListSpecialAttributeX on List<Attribute> {
  bool hasAttribute(Attribute value) => contains(value);
}