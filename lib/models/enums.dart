import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart' show Color, Colors;
import 'package:recase/recase.dart';

import '../utils/utils.dart';
import 'damage_dice.dart';

part 'enums.mapper.dart';

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

@MappableEnum()
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

@MappableEnum()
enum Chassis {
  custom(Source.custom, ''),
  apollo(Source.set2, "Apollo is tough and very effective in a crowd, where its fire weapons and the crew's grenades can wreak the most havoc.\n\nThe long wheelbase means it isn't the easiest car to drive, so most Apollo drivers cruise around the perimeter of the arena until there is an ideal opportunity to dive into the mix."),
  aristocrat(Source.set3, "The Aristocrat is almost regal in design, despite the fact that it is bristling with a wide array of weapons.\n\nIts light defensive setup means it won't last long in a firefight if it doesn't get the upper hand quickly.\n\nIt is a rolling hornet's nest, encircling opponents with fire mines before ripping them to shreds."),
  avalanche(Source.set3, "The low-slung Avalanche is essentially a high-speed tank with a weapon loadout designed to maximize tire damage.\n\nHeavy armor, tire protection, and a roll bar help the crew shrug off most attacks as they patiently wait to bash through any opponents left limping around the arena."),
  boomerang(Source.core, "The Boomerang's distinct profile is immediately recognizable.\n\nThe large rear tires seem like an obvious weak spot, but experienced duellists know to stay in the rear arc or risk an attack, even from great range.\n\nBoomerang is a favorite of many gunners as long as there is a talented driver at the controls."),
  brimstone(Source.set3, "Preferred by maniacs and daredevils, Brimstone is a scrapyard beast that pollutes the arena with oil slicks.\n\nDespite its ramshackle appearance, this raucous car is tough and can deal huge damage.\n\nThe unprotected tires seem to be an obvious weak spot, but good luck getting anywhere near them."),
  butcher(Source.core, "Butcher is a savage monster sitting atop a simple tractor, deadly and durable.\n\nIt is a vehicle for bombastic crew members that revel in total chaos.\n\nThe cabover design leaves the front of the vehicle somewhat exposed, but every other angle promises a grim death for opponents."),
  conestoga(Source.set4, "The Conestoga is very well equipped, but requires a talented crew due to the lack of driving aids and asymmetrical loadout.\n\nThe handling isn't great, but as long as the crew can keep control of the car, the Conestoga is dangerous from all angles and performs well in any duelling format."),
  dragon(Source.core, "The Dragon is a fire-breathing beast that has proven to be a reliable platform for many different styles of arena combat.\n\nIts bulky frame allows for a variety of structural upgrades, and the heavy forward-facing weapon mounts mean that anyone unfortunate enough to be caught in front of a Dragon is unlikely to survive for long."),
  fuzion(Source.set4, "Fuzion is quite maneuverable and outfitted with an autopilot system that keeps the driver focused while the gunner unleashes an assortment of rockets to send enemies careening out of control.\n\nWhile not heavily armored, it is sturdy enough to put up a good fight."),
  goblin(Source.core, "Originally a light-duty military vehicle, the stout Goblin is well armored and plays the long game, chipping away at an opponent until the time is right to go in for the kill.\n\nDespite the added armor weight, Goblin is easy to control and is a good all-round rig for any duellist."),
  hades(Source.set1, "A solid choice for any duellist, Hades is capable of accelerating unexpectedly fast and outfitted with a wide variety of weapons.\n\nIt carries enough mounted equipment to compensate for its relatively light armor, and when manned by an experienced crew, Hades can be a complex and overwhelming offensive force."),
  hammer(Source.core, "The Hammer has enough firepower to soften up opponents quite a bit before plowing through them for the finishing blow.\n\nIt trades heavy weapons for a thick outer hull, so it requires a patient crew to create an effective attack strategy.\n\nThe extra plating may hinder the handling a bit but a Hammer does not go down easily."),
  hotshot(Source.core, "Hotshot is not particularly effective from long range, but once it closes the distance, it is equipped to slag even the toughest opponent.\n\nFavored by experienced duellists that aren't afraid to take a few knocks before incinerating everything in sight, combatants must either outgun a Hotshot...or outrun it."),
  hydra(Source.set1, "The four tires hiding under Hydra's front fenders provide increased traction and improved airflow.\n\nThis, combined with the high-torque differential, make the car very easy to control at high speeds.\n\nThis control is necessary because Hydra is only moderately armed except for the giant cannon on the front, so positioning is crucial to keep opponents on the defensive."),
  jackal(Source.set3, "A Jackal driver must be at once skittish, clever, and resourceful.\n\nThe small unibody design of the car makes it a small target, but only the front end carries any substantial plating.\n\nAs a result, Jackal performs best by charging directly at an opponent, attacking, then darting away before it gets into too much trouble.\n\nThe solid tires allow for high getaway speeds even after taking significant damage."),
  jackrabbit(Source.core, "Packing an enormous punch into a compact and well-armored package, the Jackrabbit is particularly resilient in most duelling formats.\n\nOriginally designed using scrap parts, the Jackrabbit carries more diverse weaponry than many larger vehicles, and it can be fitted with significantly heavier plating than other vehicles of comparable size.\n\nThe Jackrabbit is most effective in close-quarters combat."),
  josephSpecial(Source.set1, "Well equipped and designed to hit extremely hard, the Joseph Special is an offensive powerhouse that demands an experienced crew.\n\nOpponents are advised to steer clear of the front arc, but nowhere is safe — watch for rocket attacks and mines when chasing behind it."),
  kodiak(Source.set4, "Kodiak's concealed weapons remain a mystery until an opponent overcommits and Kodiak lets loose.\n\nThe thick plating, wheel protection, and smoke emitter make the lumbering Kodiak extremely difficult to destroy even before considering the massive machine gun, melee weapons, and whatever is hiding beneath the plating."),
  pillbug(Source.set1, "The Pillbug is a rolling fortress, heavily armored but only moderately armed.\n\nThe extra defense results in mediocre handling, but the heavy plating, wheel hubs, and shielded power plant keep it in the fight, rolling for much longer than most.\n\nThe crew has plenty of time to tear their opponents to bits."),
  pureEnergy(Source.set2, "Outfitted with an array of high-energy laser weapons, improved handling, and a reactive defense system, Pure Energy prefers to snipe at foes from long range, rather than charging into the fender-to-fender combat.\n\nIt is nimble and fairly durable, but its lasers are easily destroyed by a persistent opponent."),
  redline(Source.set2, "Lightly armored, but sprightly and fast, Redline is a tricky vehicle to master.\n\nThe front and back are quite dangerous, but the sides are somewhat exposed.\n\nRedline darts in and out of the fray, but it won't last long in close-quarter combat, as its armor was sacrificed in exchange for substantially improved handling."),
  sawtooth(Source.set4, "Sawtooth is fast, brutal, and crewed by absolute maniacs.\n\nBuilt on the frame of a small luxury coupe, it's exceptionally nimble and isn't concerned with tire damage.\n\nAn unpredictable clsoe-quarters nightmare, Sawtooth rams into other cars and jabs its Bonesaw right into the open wound."),
  scarab(Source.core, "Lightweight and maneuverable, with high visibility offered by the canopy design, the Scarab is versatile and deadly, especially when equipped with weapon concealment systems.\n\nThe lack of rear weaponry leaves it vulnerable to attacks from behind, but it can be easily modified to add a mine dropper.\n\nThis is a great choice for beginners and experienced duellists alike."),
  scimitar(Source.set1, "The Scimitar is an all-purpose design that can adapted to many different arena settings, from drifting on pavement to rock crawling.\n\nDurable, modular, and sporting respectable armor for most engagements, the Scimitar is a well-rounded workhorse that holds its own at any range, balancing large shock weapons, lasers, and tire-shredding weaponry."),
  shuriken(Source.set4, "With excellent handling, a strengthened outer shell, and heavy firepower, the Shuriken is a frequent arena contender that strikes a careful balance between offense, defense, and driving performance.\n\nThis car has a complete lack of front weaponry, so an effective offense requires precision driving."),
  sledge(Source.set2, "Sledge is a titan on the battlefield, intimidating and mean.\n\nPart mobile weapons platform, part bulldozer, it unleashes a barrage of rockets and then fearlessly plunges into the thick of the smoke.\n\nSledge is built to deal a ton of damage quickly and then take its time picking apart the limping survivors."),
  slipstream(Source.core, "As the name implies, Slipstream is sleek, fast, and agile.\n\nWhile not heavily armored, it is particularly capable of mitigating tire damage.\n\nExcellent maneuverability and reliable slug weapons allow Slipstream to dart around the arena as it overwhelms the defensive weaknesses of any opponent."),
  spark(Source.set2, "Spark's design was heavily influenced by old stealth aircraft.\n\nIts front weapons are lethal, so don't get caught by surprise.\n\nUnfortunately, the front is also the most vulnerable spot to attack.\n\nHeavily armed and armored, Spark is a technological marvel that can easily accommodate live crew members or complex AI systems."),
  stiletto(Source.set3, "The tight-handling and devious Stiletto relies on speed and maneuverability to bolster its defense.\n\nIt wields huge shock weapons that inflict massive damage, but can be quite fragile.\n\nIts smokescreens create confusion in the battlefield and provide Stiletto with cover for strategic targeting or quick getaways."),
  superflash(Source.core, "Superflash relies on an electromagnetic distortion field and smokescreens to minimize counterattacks while making long-range, precision attacks.\n\nIt can carry fewer weapons than most other vehicles because its thick skin keeps everything safe and functioning for much longer than usual, even under heavy fire."),
  typhoon(Source.core, "Typhoon is the definition of a \"glass cannon.\"\n\nIt packs a big enough punch to tear through even the most armored foe, but relies on fancy driving to keep it safe from attack.\n\nWith that in mind, it is well equipped to maintain control during extreme maneuvers, and only a handful of well-placed shots are needed to ensure a win."),
  warhawk(Source.core, "Built for ramming and loaded with concussion mines, the heavily-armored Warhawk is a formidable opponent.\n\nThe machine gun turret on the roof means there is no safe place for opponents to hide.\n\nIts weakest point is the rear armor, but the mine droppers make it exceptionally difficult for anyone to chase a Warhawk for too long.");

  final Source source;
  final String description;

  const Chassis(this.source, this.description);

  static List<Chassis> get officialValues => values.skip(1).toList();

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