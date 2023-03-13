// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'enums.dart';

class SourceMapper extends EnumMapper<Source> {
  SourceMapper._();
  static SourceMapper? _instance;
  static SourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SourceMapper._());
    }
    return _instance!;
  }

  static Source fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Source decode(dynamic value) {
    switch (value) {
      case 'custom':
        return Source.custom;
      case 'armory':
        return Source.armory;
      case 'core':
        return Source.core;
      case 'crew':
        return Source.crew;
      case 'drop':
        return Source.drop;
      case 'linked':
        return Source.linked;
      case 'playmat':
        return Source.playmat;
      case 'road':
        return Source.road;
      case 'set1':
        return Source.set1;
      case 'set2':
        return Source.set2;
      case 'set3':
        return Source.set3;
      case 'set4':
        return Source.set4;
      case 'uncleAl':
        return Source.uncleAl;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Source self) {
    switch (self) {
      case Source.custom:
        return 'custom';
      case Source.armory:
        return 'armory';
      case Source.core:
        return 'core';
      case Source.crew:
        return 'crew';
      case Source.drop:
        return 'drop';
      case Source.linked:
        return 'linked';
      case Source.playmat:
        return 'playmat';
      case Source.road:
        return 'road';
      case Source.set1:
        return 'set1';
      case Source.set2:
        return 'set2';
      case Source.set3:
        return 'set3';
      case Source.set4:
        return 'set4';
      case Source.uncleAl:
        return 'uncleAl';
    }
  }
}

extension SourceMapperExtension on Source {
  String toValue() {
    SourceMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class LocationMapper extends EnumMapper<Location> {
  LocationMapper._();
  static LocationMapper? _instance;
  static LocationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocationMapper._());
    }
    return _instance!;
  }

  static Location fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Location decode(dynamic value) {
    switch (value) {
      case 'crew':
        return Location.crew;
      case 'front':
        return Location.front;
      case 'left':
        return Location.left;
      case 'right':
        return Location.right;
      case 'back':
        return Location.back;
      case 'turret':
        return Location.turret;
      case 'upgrade':
        return Location.upgrade;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Location self) {
    switch (self) {
      case Location.crew:
        return 'crew';
      case Location.front:
        return 'front';
      case Location.left:
        return 'left';
      case Location.right:
        return 'right';
      case Location.back:
        return 'back';
      case Location.turret:
        return 'turret';
      case Location.upgrade:
        return 'upgrade';
    }
  }
}

extension LocationMapperExtension on Location {
  String toValue() {
    LocationMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class ChassisMapper extends EnumMapper<Chassis> {
  ChassisMapper._();
  static ChassisMapper? _instance;
  static ChassisMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChassisMapper._());
    }
    return _instance!;
  }

  static Chassis fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Chassis decode(dynamic value) {
    switch (value) {
      case 'custom':
        return Chassis.custom;
      case 'apollo':
        return Chassis.apollo;
      case 'aristocrat':
        return Chassis.aristocrat;
      case 'avalanche':
        return Chassis.avalanche;
      case 'boomerang':
        return Chassis.boomerang;
      case 'brimstone':
        return Chassis.brimstone;
      case 'butcher':
        return Chassis.butcher;
      case 'conestoga':
        return Chassis.conestoga;
      case 'dragon':
        return Chassis.dragon;
      case 'fuzion':
        return Chassis.fuzion;
      case 'goblin':
        return Chassis.goblin;
      case 'hades':
        return Chassis.hades;
      case 'hammer':
        return Chassis.hammer;
      case 'hotshot':
        return Chassis.hotshot;
      case 'hydra':
        return Chassis.hydra;
      case 'jackal':
        return Chassis.jackal;
      case 'jackrabbit':
        return Chassis.jackrabbit;
      case 'josephSpecial':
        return Chassis.josephSpecial;
      case 'kodiak':
        return Chassis.kodiak;
      case 'pillbug':
        return Chassis.pillbug;
      case 'pureEnergy':
        return Chassis.pureEnergy;
      case 'redline':
        return Chassis.redline;
      case 'sawtooth':
        return Chassis.sawtooth;
      case 'scarab':
        return Chassis.scarab;
      case 'scimitar':
        return Chassis.scimitar;
      case 'shuriken':
        return Chassis.shuriken;
      case 'sledge':
        return Chassis.sledge;
      case 'slipstream':
        return Chassis.slipstream;
      case 'spark':
        return Chassis.spark;
      case 'stiletto':
        return Chassis.stiletto;
      case 'superflash':
        return Chassis.superflash;
      case 'typhoon':
        return Chassis.typhoon;
      case 'warhawk':
        return Chassis.warhawk;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Chassis self) {
    switch (self) {
      case Chassis.custom:
        return 'custom';
      case Chassis.apollo:
        return 'apollo';
      case Chassis.aristocrat:
        return 'aristocrat';
      case Chassis.avalanche:
        return 'avalanche';
      case Chassis.boomerang:
        return 'boomerang';
      case Chassis.brimstone:
        return 'brimstone';
      case Chassis.butcher:
        return 'butcher';
      case Chassis.conestoga:
        return 'conestoga';
      case Chassis.dragon:
        return 'dragon';
      case Chassis.fuzion:
        return 'fuzion';
      case Chassis.goblin:
        return 'goblin';
      case Chassis.hades:
        return 'hades';
      case Chassis.hammer:
        return 'hammer';
      case Chassis.hotshot:
        return 'hotshot';
      case Chassis.hydra:
        return 'hydra';
      case Chassis.jackal:
        return 'jackal';
      case Chassis.jackrabbit:
        return 'jackrabbit';
      case Chassis.josephSpecial:
        return 'josephSpecial';
      case Chassis.kodiak:
        return 'kodiak';
      case Chassis.pillbug:
        return 'pillbug';
      case Chassis.pureEnergy:
        return 'pureEnergy';
      case Chassis.redline:
        return 'redline';
      case Chassis.sawtooth:
        return 'sawtooth';
      case Chassis.scarab:
        return 'scarab';
      case Chassis.scimitar:
        return 'scimitar';
      case Chassis.shuriken:
        return 'shuriken';
      case Chassis.sledge:
        return 'sledge';
      case Chassis.slipstream:
        return 'slipstream';
      case Chassis.spark:
        return 'spark';
      case Chassis.stiletto:
        return 'stiletto';
      case Chassis.superflash:
        return 'superflash';
      case Chassis.typhoon:
        return 'typhoon';
      case Chassis.warhawk:
        return 'warhawk';
    }
  }
}

extension ChassisMapperExtension on Chassis {
  String toValue() {
    ChassisMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class ComponentTypeMapper extends EnumMapper<ComponentType> {
  ComponentTypeMapper._();
  static ComponentTypeMapper? _instance;
  static ComponentTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ComponentTypeMapper._());
    }
    return _instance!;
  }

  static ComponentType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ComponentType decode(dynamic value) {
    switch (value) {
      case 'accessory':
        return ComponentType.accessory;
      case 'crew':
        return ComponentType.crew;
      case 'gear':
        return ComponentType.gear;
      case 'sidearm':
        return ComponentType.sidearm;
      case 'structure':
        return ComponentType.structure;
      case 'upgrade':
        return ComponentType.upgrade;
      case 'weapon':
        return ComponentType.weapon;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ComponentType self) {
    switch (self) {
      case ComponentType.accessory:
        return 'accessory';
      case ComponentType.crew:
        return 'crew';
      case ComponentType.gear:
        return 'gear';
      case ComponentType.sidearm:
        return 'sidearm';
      case ComponentType.structure:
        return 'structure';
      case ComponentType.upgrade:
        return 'upgrade';
      case ComponentType.weapon:
        return 'weapon';
    }
  }
}

extension ComponentTypeMapperExtension on ComponentType {
  String toValue() {
    ComponentTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class ComponentSubtypeMapper extends EnumMapper<ComponentSubtype> {
  ComponentSubtypeMapper._();
  static ComponentSubtypeMapper? _instance;
  static ComponentSubtypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ComponentSubtypeMapper._());
    }
    return _instance!;
  }

  static ComponentSubtype fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ComponentSubtype decode(dynamic value) {
    switch (value) {
      case 'blast':
        return ComponentSubtype.blast;
      case 'coating':
        return ComponentSubtype.coating;
      case 'driver':
        return ComponentSubtype.driver;
      case 'drop':
        return ComponentSubtype.drop;
      case 'fire':
        return ComponentSubtype.fire;
      case 'frame':
        return ComponentSubtype.frame;
      case 'gloves':
        return ComponentSubtype.gloves;
      case 'gunner':
        return ComponentSubtype.gunner;
      case 'laser':
        return ComponentSubtype.laser;
      case 'melee':
        return ComponentSubtype.melee;
      case 'mount':
        return ComponentSubtype.mount;
      case 'optic':
        return ComponentSubtype.optic;
      case 'shock':
        return ComponentSubtype.shock;
      case 'shred':
        return ComponentSubtype.shred;
      case 'slug':
        return ComponentSubtype.slug;
      case 'vest':
        return ComponentSubtype.vest;
      case 'wheels':
        return ComponentSubtype.wheels;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ComponentSubtype self) {
    switch (self) {
      case ComponentSubtype.blast:
        return 'blast';
      case ComponentSubtype.coating:
        return 'coating';
      case ComponentSubtype.driver:
        return 'driver';
      case ComponentSubtype.drop:
        return 'drop';
      case ComponentSubtype.fire:
        return 'fire';
      case ComponentSubtype.frame:
        return 'frame';
      case ComponentSubtype.gloves:
        return 'gloves';
      case ComponentSubtype.gunner:
        return 'gunner';
      case ComponentSubtype.laser:
        return 'laser';
      case ComponentSubtype.melee:
        return 'melee';
      case ComponentSubtype.mount:
        return 'mount';
      case ComponentSubtype.optic:
        return 'optic';
      case ComponentSubtype.shock:
        return 'shock';
      case ComponentSubtype.shred:
        return 'shred';
      case ComponentSubtype.slug:
        return 'slug';
      case ComponentSubtype.vest:
        return 'vest';
      case ComponentSubtype.wheels:
        return 'wheels';
    }
  }
}

extension ComponentSubtypeMapperExtension on ComponentSubtype {
  String toValue() {
    ComponentSubtypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class RestrictionMapper extends EnumMapper<Restriction> {
  RestrictionMapper._();
  static RestrictionMapper? _instance;
  static RestrictionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RestrictionMapper._());
    }
    return _instance!;
  }

  static Restriction fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Restriction decode(dynamic value) {
    switch (value) {
      case 'backOnly':
        return Restriction.backOnly;
      case 'drop':
        return Restriction.drop;
      case 'exclusive':
        return Restriction.exclusive;
      case 'frontBack':
        return Restriction.frontBack;
      case 'frontOnly':
        return Restriction.frontOnly;
      case 'oneShot':
        return Restriction.oneShot;
      case 'range1':
        return Restriction.range1;
      case 'range2':
        return Restriction.range2;
      case 'sideArcFire':
        return Restriction.sideArcFire;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Restriction self) {
    switch (self) {
      case Restriction.backOnly:
        return 'backOnly';
      case Restriction.drop:
        return 'drop';
      case Restriction.exclusive:
        return 'exclusive';
      case Restriction.frontBack:
        return 'frontBack';
      case Restriction.frontOnly:
        return 'frontOnly';
      case Restriction.oneShot:
        return 'oneShot';
      case Restriction.range1:
        return 'range1';
      case Restriction.range2:
        return 'range2';
      case Restriction.sideArcFire:
        return 'sideArcFire';
    }
  }
}

extension RestrictionMapperExtension on Restriction {
  String toValue() {
    RestrictionMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class DieMapper extends EnumMapper<Die> {
  DieMapper._();
  static DieMapper? _instance;
  static DieMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DieMapper._());
    }
    return _instance!;
  }

  static Die fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Die decode(dynamic value) {
    switch (value) {
      case 'red':
        return Die.red;
      case 'yellow':
        return Die.yellow;
      case 'green':
        return Die.green;
      case 'blue':
        return Die.blue;
      case 'black':
        return Die.black;
      case 'white':
        return Die.white;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Die self) {
    switch (self) {
      case Die.red:
        return 'red';
      case Die.yellow:
        return 'yellow';
      case Die.green:
        return 'green';
      case Die.blue:
        return 'blue';
      case Die.black:
        return 'black';
      case Die.white:
        return 'white';
    }
  }
}

extension DieMapperExtension on Die {
  String toValue() {
    DieMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class DamageTypeMapper extends EnumMapper<DamageType> {
  DamageTypeMapper._();
  static DamageTypeMapper? _instance;
  static DamageTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DamageTypeMapper._());
    }
    return _instance!;
  }

  static DamageType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DamageType decode(dynamic value) {
    switch (value) {
      case 'basic':
        return DamageType.basic;
      case 'explosion':
        return DamageType.explosion;
      case 'fire':
        return DamageType.fire;
      case 'paint':
        return DamageType.paint;
      case 'tires':
        return DamageType.tires;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DamageType self) {
    switch (self) {
      case DamageType.basic:
        return 'basic';
      case DamageType.explosion:
        return 'explosion';
      case DamageType.fire:
        return 'fire';
      case DamageType.paint:
        return 'paint';
      case DamageType.tires:
        return 'tires';
    }
  }
}

extension DamageTypeMapperExtension on DamageType {
  String toValue() {
    DamageTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class ModTypeMapper extends EnumMapper<ModType> {
  ModTypeMapper._();
  static ModTypeMapper? _instance;
  static ModTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModTypeMapper._());
    }
    return _instance!;
  }

  static ModType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ModType decode(dynamic value) {
    switch (value) {
      case 'text':
        return ModType.text;
      case 'note':
        return ModType.note;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ModType self) {
    switch (self) {
      case ModType.text:
        return 'text';
      case ModType.note:
        return 'note';
    }
  }
}

extension ModTypeMapperExtension on ModType {
  String toValue() {
    ModTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class AttributeMapper extends EnumMapper<Attribute> {
  AttributeMapper._();
  static AttributeMapper? _instance;
  static AttributeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AttributeMapper._());
    }
    return _instance!;
  }

  static Attribute fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Attribute decode(dynamic value) {
    switch (value) {
      case 'awardsAP':
        return Attribute.awardsAP;
      case 'awardsCP':
        return Attribute.awardsCP;
      case 'attackArmorPiercing':
        return Attribute.attackArmorPiercing;
      case 'attackAceForReroll':
        return Attribute.attackAceForReroll;
      case 'attackCoverAceBasic1':
        return Attribute.attackCoverAceBasic1;
      case 'attackCrewBlue1':
        return Attribute.attackCrewBlue1;
      case 'attackCrewBlue2':
        return Attribute.attackCrewBlue2;
      case 'attackCrewYellow1':
        return Attribute.attackCrewYellow1;
      case 'attackDriverYellow11':
        return Attribute.attackDriverYellow11;
      case 'attackGunnerBasic1':
        return Attribute.attackGunnerBasic1;
      case 'attackGunnerBasic2':
        return Attribute.attackGunnerBasic2;
      case 'attackGunnerFireBlack1':
        return Attribute.attackGunnerFireBlack1;
      case 'attackGunnerHcAnyArc':
        return Attribute.attackGunnerHcAnyArc;
      case 'attackGunnerRerolls2':
        return Attribute.attackGunnerRerolls2;
      case 'attackGunnerShredBlack1':
        return Attribute.attackGunnerShredBlack1;
      case 'attackGunnerYellow1Blue1':
        return Attribute.attackGunnerYellow1Blue1;
      case 'attackIncendiaryTires1':
        return Attribute.attackIncendiaryTires1;
      case 'attackIncendiaryTires2':
        return Attribute.attackIncendiaryTires2;
      case 'attackIneptYellow1':
        return Attribute.attackIneptYellow1;
      case 'attackRerolls1':
        return Attribute.attackRerolls1;
      case 'attackRerolls2':
        return Attribute.attackRerolls2;
      case 'attackSidearmRerolls2':
        return Attribute.attackSidearmRerolls2;
      case 'canAbsorbCrewDamage':
        return Attribute.canAbsorbCrewDamage;
      case 'canAbsorbFireDamage':
        return Attribute.canAbsorbFireDamage;
      case 'canAbsorbPowerPlantDamage':
        return Attribute.canAbsorbPowerPlantDamage;
      case 'canAbsorbTireDamage':
        return Attribute.canAbsorbTireDamage;
      case 'canStoreControl':
        return Attribute.canStoreControl;
      case 'enhancesCrewDurability':
        return Attribute.enhancesCrewDurability;
      case 'expendable':
        return Attribute.expendable;
      case 'internalDamagePowerPlantFirst':
        return Attribute.internalDamagePowerPlantFirst;
      case 'internalDamageTiresFirst':
        return Attribute.internalDamageTiresFirst;
      case 'maneuverBlue1':
        return Attribute.maneuverBlue1;
      case 'maneuverRemoveYellow1':
        return Attribute.maneuverRemoveYellow1;
      case 'paired':
        return Attribute.paired;
      case 'preventsTireMaxSpeedAdjustments':
        return Attribute.preventsTireMaxSpeedAdjustments;
      case 'replaceableWeapon3BP':
        return Attribute.replaceableWeapon3BP;
      case 'replaceableWeapon6BP':
        return Attribute.replaceableWeapon6BP;
      case 'requiresDiv6':
        return Attribute.requiresDiv6;
      case 'shieldReducesWeaponDamage':
        return Attribute.shieldReducesWeaponDamage;
      case 'takeAce':
        return Attribute.takeAce;
      case 'takeAce2':
        return Attribute.takeAce2;
      case 'takeAce3':
        return Attribute.takeAce3;
      case 'takeControl':
        return Attribute.takeControl;
      case 'takeControl2':
        return Attribute.takeControl2;
      case 'takeControlSpeed4':
        return Attribute.takeControlSpeed4;
      case 'takeControl2Speed5':
        return Attribute.takeControl2Speed5;
      case 'turret':
        return Attribute.turret;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Attribute self) {
    switch (self) {
      case Attribute.awardsAP:
        return 'awardsAP';
      case Attribute.awardsCP:
        return 'awardsCP';
      case Attribute.attackArmorPiercing:
        return 'attackArmorPiercing';
      case Attribute.attackAceForReroll:
        return 'attackAceForReroll';
      case Attribute.attackCoverAceBasic1:
        return 'attackCoverAceBasic1';
      case Attribute.attackCrewBlue1:
        return 'attackCrewBlue1';
      case Attribute.attackCrewBlue2:
        return 'attackCrewBlue2';
      case Attribute.attackCrewYellow1:
        return 'attackCrewYellow1';
      case Attribute.attackDriverYellow11:
        return 'attackDriverYellow11';
      case Attribute.attackGunnerBasic1:
        return 'attackGunnerBasic1';
      case Attribute.attackGunnerBasic2:
        return 'attackGunnerBasic2';
      case Attribute.attackGunnerFireBlack1:
        return 'attackGunnerFireBlack1';
      case Attribute.attackGunnerHcAnyArc:
        return 'attackGunnerHcAnyArc';
      case Attribute.attackGunnerRerolls2:
        return 'attackGunnerRerolls2';
      case Attribute.attackGunnerShredBlack1:
        return 'attackGunnerShredBlack1';
      case Attribute.attackGunnerYellow1Blue1:
        return 'attackGunnerYellow1Blue1';
      case Attribute.attackIncendiaryTires1:
        return 'attackIncendiaryTires1';
      case Attribute.attackIncendiaryTires2:
        return 'attackIncendiaryTires2';
      case Attribute.attackIneptYellow1:
        return 'attackIneptYellow1';
      case Attribute.attackRerolls1:
        return 'attackRerolls1';
      case Attribute.attackRerolls2:
        return 'attackRerolls2';
      case Attribute.attackSidearmRerolls2:
        return 'attackSidearmRerolls2';
      case Attribute.canAbsorbCrewDamage:
        return 'canAbsorbCrewDamage';
      case Attribute.canAbsorbFireDamage:
        return 'canAbsorbFireDamage';
      case Attribute.canAbsorbPowerPlantDamage:
        return 'canAbsorbPowerPlantDamage';
      case Attribute.canAbsorbTireDamage:
        return 'canAbsorbTireDamage';
      case Attribute.canStoreControl:
        return 'canStoreControl';
      case Attribute.enhancesCrewDurability:
        return 'enhancesCrewDurability';
      case Attribute.expendable:
        return 'expendable';
      case Attribute.internalDamagePowerPlantFirst:
        return 'internalDamagePowerPlantFirst';
      case Attribute.internalDamageTiresFirst:
        return 'internalDamageTiresFirst';
      case Attribute.maneuverBlue1:
        return 'maneuverBlue1';
      case Attribute.maneuverRemoveYellow1:
        return 'maneuverRemoveYellow1';
      case Attribute.paired:
        return 'paired';
      case Attribute.preventsTireMaxSpeedAdjustments:
        return 'preventsTireMaxSpeedAdjustments';
      case Attribute.replaceableWeapon3BP:
        return 'replaceableWeapon3BP';
      case Attribute.replaceableWeapon6BP:
        return 'replaceableWeapon6BP';
      case Attribute.requiresDiv6:
        return 'requiresDiv6';
      case Attribute.shieldReducesWeaponDamage:
        return 'shieldReducesWeaponDamage';
      case Attribute.takeAce:
        return 'takeAce';
      case Attribute.takeAce2:
        return 'takeAce2';
      case Attribute.takeAce3:
        return 'takeAce3';
      case Attribute.takeControl:
        return 'takeControl';
      case Attribute.takeControl2:
        return 'takeControl2';
      case Attribute.takeControlSpeed4:
        return 'takeControlSpeed4';
      case Attribute.takeControl2Speed5:
        return 'takeControl2Speed5';
      case Attribute.turret:
        return 'turret';
    }
  }
}

extension AttributeMapperExtension on Attribute {
  String toValue() {
    AttributeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class InternalDamageLocationMapper extends EnumMapper<InternalDamageLocation> {
  InternalDamageLocationMapper._();
  static InternalDamageLocationMapper? _instance;
  static InternalDamageLocationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InternalDamageLocationMapper._());
    }
    return _instance!;
  }

  static InternalDamageLocation fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  InternalDamageLocation decode(dynamic value) {
    switch (value) {
      case 'accessory':
        return InternalDamageLocation.accessory;
      case 'crew':
        return InternalDamageLocation.crew;
      case 'driver':
        return InternalDamageLocation.driver;
      case 'gunner':
        return InternalDamageLocation.gunner;
      case 'fire':
        return InternalDamageLocation.fire;
      case 'oppositeArmor':
        return InternalDamageLocation.oppositeArmor;
      case 'powerPlant':
        return InternalDamageLocation.powerPlant;
      case 'structure':
        return InternalDamageLocation.structure;
      case 'tires':
        return InternalDamageLocation.tires;
      case 'weapon':
        return InternalDamageLocation.weapon;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(InternalDamageLocation self) {
    switch (self) {
      case InternalDamageLocation.accessory:
        return 'accessory';
      case InternalDamageLocation.crew:
        return 'crew';
      case InternalDamageLocation.driver:
        return 'driver';
      case InternalDamageLocation.gunner:
        return 'gunner';
      case InternalDamageLocation.fire:
        return 'fire';
      case InternalDamageLocation.oppositeArmor:
        return 'oppositeArmor';
      case InternalDamageLocation.powerPlant:
        return 'powerPlant';
      case InternalDamageLocation.structure:
        return 'structure';
      case InternalDamageLocation.tires:
        return 'tires';
      case InternalDamageLocation.weapon:
        return 'weapon';
    }
  }
}

extension InternalDamageLocationMapperExtension on InternalDamageLocation {
  String toValue() {
    InternalDamageLocationMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}

class ManeuverMapper extends EnumMapper<Maneuver> {
  ManeuverMapper._();
  static ManeuverMapper? _instance;
  static ManeuverMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ManeuverMapper._());
    }
    return _instance!;
  }

  static Maneuver fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Maneuver decode(dynamic value) {
    switch (value) {
      case 'slide':
        return Maneuver.slide;
      case 'turnD1':
        return Maneuver.turnD1;
      case 'turnD2':
        return Maneuver.turnD2;
      case 'turnD3':
        return Maneuver.turnD3;
      case 'turnD4':
        return Maneuver.turnD4;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Maneuver self) {
    switch (self) {
      case Maneuver.slide:
        return 'slide';
      case Maneuver.turnD1:
        return 'turnD1';
      case Maneuver.turnD2:
        return 'turnD2';
      case Maneuver.turnD3:
        return 'turnD3';
      case Maneuver.turnD4:
        return 'turnD4';
    }
  }
}

extension ManeuverMapperExtension on Maneuver {
  String toValue() {
    ManeuverMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
