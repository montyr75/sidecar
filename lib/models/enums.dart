import 'package:flutter/material.dart' show Color, Colors;
import 'package:recase/recase.dart';

import '../utils/utils.dart';
import 'damage_dice.dart';

enum Source {
  custom,
  armory,
  core,
  crew,
  drop,
  linked,
  playmat,
  road,
  set1,
  set2,
  set3,
  set4,
  uncleAl;

  @override
  String toString() {
    switch (this) {
      case Source.armory: return "Armory";
      case Source.core: return "Core Set";
      case Source.crew: return "Crew Pack";
      case Source.drop: return "Drop Weapon Pack";
      case Source.linked: return "Linked Weapon Pack";
      case Source.playmat: return "Playmat";
      case Source.road: return "Road Tiles";
      case Source.set1: return "Miniature Set 1";
      case Source.set2: return "Miniature Set 2";
      case Source.set3: return "Miniature Set 3";
      case Source.set4: return "Miniature Set 4";
      case Source.uncleAl: return "Uncle Al's Upgrade Pack";
      case Source.custom: return "";
    }
  }

  String toAbbrString() {
    switch (this) {
      case Source.set1: return "Set 1";
      case Source.set2: return "Set 2";
      case Source.set3: return "Set 3";
      case Source.set4: return "Set 4";
      case Source.custom: return "";
      default: return ReCase(name).titleCase;
    }
  }
}

enum Location {
  crew,
  front,
  left,
  right,
  back,
  turret,
  upgrade;

  static const carLocs = [
    Location.front,
    Location.left,
    Location.right,
    Location.back,
  ];

  bool get isCarLoc => carLocs.contains(this);

  @override
  String toString() => ReCase(name).titleCase;

  String toVehicleGuideString() {
    if (isCarLoc) {
      return toString();
    }
    else if (this == Location.turret) {
      return "Exclusive";
    }

    return '';
  }

  String toArcString() {
    if (isCarLoc) {
      return toString();
    }
    else if (this == Location.turret) {
      return "All";
    }

    return '';
  }
}

enum CarChassisType {
  custom(Source.custom),
  apollo(Source.set2),
  aristocrat(Source.set3),
  avalanche(Source.set3),
  boomerang(Source.core),
  brimstone(Source.set3),
  butcher(Source.core),
  conestoga(Source.set4),
  dragon(Source.core),
  fuzion(Source.set4),
  goblin(Source.core),
  hades(Source.set1),
  hammer(Source.core),
  hotshot(Source.core),
  hydra(Source.set1),
  jackal(Source.set3),
  jackrabbit(Source.core),
  josephSpecial(Source.set1),
  kodiak(Source.set4),
  pillbug(Source.set1),
  pureEnergy(Source.set2),
  redline(Source.set2),
  sawtooth(Source.set4),
  scarab(Source.core),
  scimitar(Source.set1),
  shuriken(Source.set4),
  sledge(Source.set2),
  slipstream(Source.core),
  spark(Source.set2),
  stiletto(Source.set3),
  superflash(Source.core),
  typhoon(Source.core),
  warhawk(Source.core);

  final Source source;

  const CarChassisType(this.source);

  @override
  String toString() => ReCase(name).titleCase;
}

enum ComponentType {
  accessory,
  crew,
  gear,
  sidearm,
  structure,
  upgrade,
  weapon;

  static const crewTypes = [
    ComponentType.crew,
    ComponentType.sidearm,
    ComponentType.gear,
  ];

  static const carTypes = [
    ComponentType.accessory,
    ComponentType.structure,
    ComponentType.upgrade,
    ComponentType.weapon,
  ];

  bool get isCrewType => crewTypes.contains(this);

  @override
  String toString() => ReCase(name).titleCase;
}

enum ComponentSubtype {
  blast,
  coating,
  driver,
  drop,
  fire,
  frame,
  gloves,
  gunner,
  laser,
  melee,
  mount,
  optic,
  shock,
  shred,
  slug,
  vest,
  wheels;

  @override
  String toString() => ReCase(name).titleCase;
}

enum Restriction {
  backOnly,
  drop,
  exclusive,
  frontBack,
  frontOnly,
  oneShot,
  range1,
  range2,
  sideArcFire;

  @override
  String toString() {
    switch (this) {
      case Restriction.backOnly: return "BACK ONLY";
      case Restriction.drop: return "DROP";
      case Restriction.exclusive: return "EXCLUSIVE";
      case Restriction.frontBack: return "FRONT/BACK";
      case Restriction.frontOnly: return "FRONT ONLY";
      case Restriction.oneShot: return "ONE-SHOT";
      case Restriction.range1: return "RANGE 1";
      case Restriction.range2: return "RANGE 2";
      case Restriction.sideArcFire: return "SIDE ARC FIRE";
    }
  }
}

enum Die {
  red(Colors.red),
  yellow(Colors.yellow, true),
  green(Colors.green),
  blue(Colors.blue),
  black(Colors.black),
  white(Colors.white, true);

  final Color color;
  final bool alternateTextColor;

  const Die(this.color, [this.alternateTextColor = false]);

  static Die fromString(String value) => fullStrToEnum<Die>(values, value);
}

enum DamageType {
  basic,
  explosion,
  fire,
  paint,
  tires;

  static DamageType fromString(String value) => fullStrToEnum<DamageType>(values, value);
}

enum ModType {
  text,       // the default, normal type
  note,       // should display in small red type
}

enum Attribute {
  awardsAP,      // component adds one extra AP during a build
  awardsCP,      // component adds one extra CP during a build
  attackArmorPiercing,    // add note to attack calc: "[[_Attacks vs. 1+ AP]]: +[[Die.yellow:1]]"
  attackAceForReroll,   // add note to attack calc: pay ACE to re-roll attack dice with this weapon
  attackCoverAceBasic1, // add note to attack calc: [_Attacks with Cover]]: [[Token.ace]] = [[DamageType.basic:1]] -- as with HUD Goggles
  attackCrewBlue1,      // +[[Die.blue:1]] to all attacks made by any crew member
  attackCrewBlue2,      // +[[Die.blue:2]] to all attacks made by any crew member
  attackCrewYellow1,      // +[[Die.yellow:1]] to all attacks made by any crew member
  attackDriverYellow11,   // +[[Die.yellow:1]] for attacks made by the driver
  attackGunnerBasic1,   // +[[DamageType.basic:1]] for attacks made by the gunner
  attackGunnerBasic2,   // +[[DamageType.basic:2]] for attacks made by the gunner
  attackGunnerFireBlack1,  // +[[Die.black:1]] for Fire weapon attacks made by gunner
  attackGunnerHcAnyArc,   // gunner can use the Hand Cannon in any firing arc
  attackGunnerRerolls2,   // add a note to attack calc: +2 attack re-rolls for gunner attacks
  attackGunnerShredBlack1,  // +[[Die.black:1]] for Shred weapon attacks made by gunner
  attackGunnerYellow1Blue1,  // + [[Die.yellow:1]] [[Die.blue:1]] for Shred weapon attacks made by gunner
  attackIncendiaryTires1,  // +[[DamageType.tires:1]]
  attackIncendiaryTires2,  // +[[DamageType.tires:2]]
  attackIneptYellow1,     // add note to attack calc:  defender gets  +[[Die.yellow:1]] -- such as Hound (gunner)
  attackRerolls1,    // add a note to attack calc: +1 attack re-roll (such as for AFI)
  attackRerolls2,    // add a note to attack calc: +2 attack re-rolls (such as for linked weapons)
  attackSidearmRerolls2,    // add a note to attack calc: +2 attack re-rolls with a sidearm
  canAbsorbCrewDamage,  // crew damage is redirected to this component
  canAbsorbFireDamage,  // fire damage is redirected to this component
  canAbsorbPowerPlantDamage,  // power plant damage is redirected to this component
  canAbsorbTireDamage,  // tire damage is redirected to this component
  canStoreControl,      // component can store control points on it
  enhancesCrewDurability, // component raises the maximum durability of crew members by 1
  expendable,           // component can be used up (like the Drag Chute), typically after a single use
  internalDamagePowerPlantFirst,  // inserts "POWER PLANT (limit 1)" as first internal damage item when attacking
  internalDamageTiresFirst,  // inserts "TIRES (limit 1)" as first internal damage item when attacking
  maneuverBlue1,       // +[[Die.blue:1]] for maneuver driving rolls
  maneuverRemoveYellow1,    // –[[Die.yellow:1]] for maneuver driving rolls
  paired,         // component is equipped alongside a copy of itself on the same side for free
  preventsTireMaxSpeedAdjustments,  // max speed is not reduced due to tire damage
  replaceableWeapon3BP, // can be replaced by 3BP worth of weapons (following normal build rules)
  replaceableWeapon6BP, // can be replaced by 3BP worth of weapons (following normal build rules)
  requiresDiv6,       // a weapon that is legal only on cars that are division 6 (24BP) or higher
  shieldReducesWeaponDamage,  // player rolls something and a shield result reduces weapon damage by 1
  takeAce,          // take an ACE in the Take Control step
  takeAce2,          // take 2 ACE in the Take Control step
  takeAce3,          // take 3 ACE in the Take Control step
  takeControl,          // take a CONTROL in the Take Control step
  takeControl2,          // take 2 CONTROL in the Take Control step
  takeControlSpeed4,          // take a CONTROL in the Take Control step if at speed 4
  takeControl2Speed5,          // take 2 CONTROL in the Take Control step if at speed 5
  turret,       // a turreted weapon
}

enum InternalDamageLocation {
  accessory,
  crew,
  driver,
  gunner,
  fire,
  oppositeArmor,
  powerPlant,
  structure,
  tires,
  weapon;

  @override
  String toString() => ReCase(name).titleCase;
}

enum Maneuver {
  slide(DamageDice()),
  turnD1(DamageDice(dice: [Dice(Die.green, 1)])),
  turnD2(DamageDice(dice: [Dice(Die.green, 1), Dice(Die.yellow, 1)])),
  turnD3(DamageDice(dice: [Dice(Die.green, 1), Dice(Die.yellow, 1), Dice(Die.red, 1)])),
  turnD4(DamageDice(dice: [Dice(Die.green, 1), Dice(Die.yellow, 1), Dice(Die.red, 1), Dice(Die.white, 1)]));

  final DamageDice dice;

  const Maneuver(this.dice);

  @override
  String toString() {
    switch (this) {
      case Maneuver.slide: return "Slide";
      case Maneuver.turnD1: return "Turn (D1)";
      case Maneuver.turnD2: return "Turn (D2)";
      case Maneuver.turnD3: return "Turn (D3)";
      case Maneuver.turnD4: return "Turn (D4)";
    }
  }
}