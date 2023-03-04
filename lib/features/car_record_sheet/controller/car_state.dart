import 'package:collection/collection.dart';

import '../../../data/components.dart' as db;
import '../../../models/car.dart';
import '../../../models/components.dart';
import '../../../models/damage_dice.dart';
import '../../../models/enums.dart';
import '../../../utils/utils.dart';

class CarState {
  static const defaultSpeed = 2;
  static const defaultPowerPlant = 10;
  static const defaultTires = 10;

  final Car car;
  final List<InstalledComponent> components;
  final Map<Location, LocationState> locs;
  final List<Attribute> attributes;
  final int speed;
  final int powerPlant;
  final int tires;
  final int control;
  final int ace;

  const CarState({
    required this.car,
    required this.components,
    required this.locs,
    required this.attributes,
    this.speed = defaultSpeed,
    this.powerPlant = defaultPowerPlant,
    this.tires = defaultTires,
    this.control = 0,
    this.ace = 0,
  });

  factory CarState.fromCar(Car car) {
    final List<InstalledComponent> comps = [];
    for (final loc in Location.values) {
      final locComps = car.locs[loc]?.map((key) => db.components[key]!) ?? const [];
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

    return CarState(
      car: car,
      components: List<InstalledComponent>.unmodifiable(comps),
      locs: Map<Location, LocationState>.unmodifiable({
        for (final loc in Location.carLocs)
          loc: LocationState.fromCar(
            loc: loc,
            car: car,
            bonusAP: attributes.hasAttribute(Attribute.awardsAP) ? 1 : 0,
          ),
      }),
      attributes: attributes,
    );
  }

  CarState copyWith({
    Car? car,
    List<InstalledComponent>? components,
    Map<Location, LocationState>? locs,
    List<Attribute>? attributes,
    int? speed,
    int? powerPlant,
    int? tires,
    int? control,
    int? ace,
  }) {
    return CarState(
      car: car ?? this.car,
      components: components ?? this.components,
      locs: locs ?? this.locs,
      attributes: attributes ?? this.attributes,
      speed: speed ?? this.speed,
      powerPlant: powerPlant ?? this.powerPlant,
      tires: tires ?? this.tires,
      control: control ?? this.control,
      ace: ace ?? this.ace,
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

  InstalledComponent? get driver => components.driver;
  InstalledComponent? get gunner => components.gunner;

  List<InstalledComponent> get crew => components.crew;
  List<InstalledComponent> get allCrewComponents => components.allCrewComponents;
  List<InstalledComponent> get allCarComponents => components.allCarComponents;
  List<InstalledComponent> get sidearms => components.sidearms;
  List<InstalledComponent> get gear => components.gear;
  List<InstalledComponent> get weapons => components.weapons;
  List<InstalledComponent> get accessories => components.accessories;
  List<InstalledComponent> get upgrades => components.upgrades;
  List<InstalledComponent> get structure => components.structure;

  bool get hasGear => gear.isNotEmpty;
  bool get hasAccessories => accessories.isNotEmpty;
  bool get hasUpgrades => upgrades.isNotEmpty;
  bool get hasStructure => structure.isNotEmpty;

  bool hasAttribute(Attribute value) => attributes.hasAttribute(value);

  InstalledComponent? findComponentById(String id) => components.firstWhereOrNull((value) => value.id == id);

  String get name => car.chassis.toString();

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
}

class LocationState {
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

  factory LocationState.fromCar({required Location loc, required Car car, int bonusAP = 0}) {
    return LocationState(
      loc: loc,
      armor: ArmorState.fromDivision(car.division, bonusAP: bonusAP),
    );
  }

  LocationState copyWith({
    Location? loc,
    ArmorState? armor,
    bool? fire,
    bool? paint,
  }) {
    return LocationState(
      loc: loc ?? this.loc,
      armor: armor ?? this.armor,
      fire: fire ?? this.fire,
      paint: paint ?? this.paint,
    );
  }
}

class ArmorState {
  final int value;
  final int max;

  const ArmorState({
    required this.value,
    required this.max,
  });

  factory ArmorState.fromDivision(int division, {int bonusAP = 0}) =>
      ArmorState(value: division + bonusAP, max: division + bonusAP);

  ArmorState copyWith({
    int? value,
    int? max,
  }) {
    return ArmorState(
      value: value ?? this.value,
      max: max ?? this.max,
    );
  }
}

Iterable<InstalledComponent> createInstalledComponents(Iterable<Component> comps, Location loc) {
  return comps.map((value) {
    if (value.hasAttribute(Attribute.canStoreControl)) {
      return InstalledComponentWithControl(
        id: uuid.v4(),
        loc: loc,
        component: value,
        currentDurability: value.durability,
      );
    } else {
      return InstalledComponent(
        id: uuid.v4(),
        loc: loc,
        component: value,
        currentDurability: value.durability,
      );
    }
  });
}

extension ListInstCompX on List<InstalledComponent> {
  InstalledComponent? get driver => firstWhereOrNull((value) => value.subtype == ComponentSubtype.driver);
  InstalledComponent? get gunner => firstWhereOrNull((value) => value.subtype == ComponentSubtype.gunner);
  bool get hasDriver => driver != null;
  bool get hasGunner => gunner != null;

  List<InstalledComponent> get crew =>
      List<InstalledComponent>.unmodifiable(where((value) => value.type == ComponentType.crew));

  List<InstalledComponent> get allCrewComponents => List<InstalledComponent>.unmodifiable([
    if (hasDriver) driver,
    if (hasGunner) gunner,
    ...(sidearms.toList()..sort()),
    ...(gear.toList()..sort()),
  ]);

  List<InstalledComponent> get allCarComponents =>
      List<InstalledComponent>.unmodifiable(where((value) => !value.type.isCrewType));

  List<InstalledComponent> get sidearms =>
      List<InstalledComponent>.unmodifiable(where((value) => value.type == ComponentType.sidearm));

  List<InstalledComponent> get gear =>
      List<InstalledComponent>.unmodifiable(where((value) => value.type == ComponentType.gear));

  List<InstalledComponent> get weapons =>
      List<InstalledComponent>.unmodifiable(where((value) => value.type == ComponentType.weapon));

  List<InstalledComponent> get accessories =>
      List<InstalledComponent>.unmodifiable(where((value) => value.type == ComponentType.accessory));

  List<InstalledComponent> get upgrades =>
      List<InstalledComponent>.unmodifiable(where((value) => value.type == ComponentType.upgrade));

  List<InstalledComponent> get structure =>
      List<InstalledComponent>.unmodifiable(where((value) => value.type == ComponentType.structure));

  List<InstalledComponent> getCompsByLoc(Location loc) =>
      List<InstalledComponent>.unmodifiable(where((value) => value.loc == loc).toList()..sort());

  List<InstalledComponent> getCompsByLocAndType(Location loc, ComponentType type) =>
      List<InstalledComponent>.unmodifiable(where((value) => value.loc == loc && value.type == type));

  List<InstalledComponent> getCarCompsByLoc(Location loc) => List<InstalledComponent>.unmodifiable([
    ...(getCompsByLocAndType(loc, ComponentType.weapon).toList()..sort()),
    ...(getCompsByLocAndType(loc, ComponentType.accessory).toList()..sort()),
    ...(getCompsByLocAndType(loc, ComponentType.structure).toList()..sort()),
  ]);

  List<InstalledComponent> getCompsByAttr(Attribute attr) =>
      List<InstalledComponent>.unmodifiable(where((value) => value.attributes.contains(attr)));

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
}

extension ListSpecialAttributeX on List<Attribute> {
  bool hasAttribute(Attribute value) => contains(value);
}