import 'package:collection/collection.dart';

import '../models/components.dart';
import '../models/damage_dice.dart';
import '../models/enums.dart';

const Map<String, Component> components = {
  "Active Camouflage": Component(
    name: "Active Camouflage",
    cost: 2,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.coating,
    mods: [
      Mod(
        text: "When attacked on any side that has at least 1 armor point remaining, add [[Die.black:1]] to your defense roll.",
        abbrText: "[[_Defense, 1+ AP]]: +[[Die.black:1]]",
      ),
    ],
    source: Source.uncleAl,
  ),
  "Advanced Breaks": Component(
    name: "Advanced Breaks",
    cost: 1,
    type: ComponentType.accessory,
    restrictions: [
      Restriction.backOnly,
    ],
    mods: [
      Mod(
        text: "Take 1 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]]",
      ),
      Mod(
        text: "Ignore tire damage from hard braking.",
        abbrText: "[[_Hard Braking]]: No [[DamageType.tires]]",
      ),
    ],
    attributes: [
      Attribute.takeAce,
    ],
    durability: 2,
    source: Source.core,
  ),
  "Advanced Firing Interface": Component(
    name: "Advanced Firing Interface",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(text: "This does not affect sidearms.", type: ModType.note),
      Mod(
        text: "Once per attack, you may re-roll 1 die.",
        abbrText: "[[_Attacks]]: +1 re-roll",
      ),
    ],
    attributes: [
      Attribute.attackRerolls1,
    ],
    durability: 1,
    source: Source.set1,
  ),
  "Aerodynamic Fairings": Component(
    name: "Aerodynamic Fairings",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "Ignore 1 [[Token.wrench]] when making a maneuver at speed 4 or 5.",
        abbrText: "[[_Maneuvers, Speed 4/5]]: –[[Token.wrench]]",
      ),
    ],
    durability: 1,
    source: Source.set1,
  ),
  "Airless Tires": Component(
    name: "Airless Tires",
    cost: 1,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.wheels,
    mods: [
      Mod(
        text: "Tire damage does not affect your maximum speed.",
        abbrText: "[[DamageType.tires]] = no speed loss",
      ),
    ],
    attributes: [
      Attribute.preventsTireMaxSpeedAdjustments,
    ],
    source: Source.set1,
  ),
  "Alpine": Component(
    name: "Alpine",
    cost: 5,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "When defending, roll [[Die.blue]] equal to your speed instead of [[Die.yellow]].",
        abbrText: "[[_Defense]]: [[Die.blue]] x Speed",
      ),
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Amateur Driver": Component(
    name: "Amateur",
    cost: 2,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Take 1 [[Token.control]] and 1 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.control]] AND +[[Token.ace]]",
      ),
    ],
    attributes: [
      Attribute.takeAce,
      Attribute.takeControl,
    ],
    durability: 3,
    source: Source.core,
  ),
  "Amateur Gunner": Component(
    name: "Amateur",
    cost: 2,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "When this gunner attacks, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    attributes: [
      Attribute.attackGunnerRerolls2,
    ],
    durability: 3,
    source: Source.core,
  ),
  "Anti-Power Plant Rocket": Weapon(
    name: "Anti-Power Plant Rocket",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
      Restriction.exclusive,
    ],
    mods: [
      Mod(
        text: "When attacking with this weapon, the first item on all damage cards is: POWER PLANT (limit 1)",
        abbrText: "[[_Attacks]]: [[Token.wrench]] = POWER PLANT (limit 1)",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
      ],
    ),
    attributes: [
      Attribute.internalDamagePowerPlantFirst,
    ],
    wrenchResult: DamageType.explosion,
    durability: 1,
    source: Source.uncleAl,
  ),
  "Anti-Tank Gun": Weapon(
    name: "Anti-Tank Gun",
    cost: 4,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.yellow, 2),
      ],
    ),
    durability: 2,
    source: Source.core,
  ),
  "Arc Rifle": Weapon(
    name: "Arc Rifle",
    cost: 4,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shock,
    mods: [
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench]] [[Token.wrench]] = [[Token.damage]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
        Dice(Die.blue, 1),
      ],
    ),
    wrenchResult: DamageType.basic,
    durability: 3,
    source: Source.set2,
  ),
  "Armor-Piercing Rocket": Weapon(
    name: "Armor-Piercing Rocket",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
    ],
    mods: [
      Mod(
        text: "If your target has at least 1 armor point remaining on the targeted side, add [[Die.yellow:1]] to your attack roll.",
        abbrText: "[[_Attacks vs. 1+ AP]]: +[[Die.yellow:1]]",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.red, 1),
      ],
    ),
    wrenchResult: DamageType.explosion,
    attributes: [
      Attribute.attackArmorPiercing,
    ],
    durability: 1,
    source: Source.uncleAl,
  ),
  "Armored Beer Refrigerator": Component(
    name: "Armored Beer Refrigerator",
    cost: 0,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "When making a maneuver, add [[Die.blue:1]] to your driving roll.",
        abbrText: "[[__Maneuvers]]: +[[Die.blue:1]]",
      ),
      Mod(
        text: "When one of your crew members takes damage, apply it to this card first.",
        abbrText: "Takes crew damage first.",
      ),
    ],
    attributes: [
      Attribute.canAbsorbCrewDamage,
      Attribute.maneuverBlue1,
    ],
    durability: 2,
    source: Source.core,
  ),
  "Armored Machine Gun": Weapon(
    name: "Armored Machine Gun",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.green, 2),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 3,
    source: Source.uncleAl,
  ),
  "Assault Rifle": Weapon(
    name: "Assault Rifle",
    cost: 1,
    type: ComponentType.sidearm,
    damageDice: DamageDice(
      dice: [
        Dice(Die.blue, 3),
        Dice(Die.black, 1),
      ],
    ),
    restrictions: [
      Restriction.sideArcFire,
    ],
    wrenchResult: DamageType.basic,
    source: Source.core,
  ),
  "Autocannon": Weapon(
    name: "Autocannon",
    cost: 6,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
        Dice(Die.green, 2),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.armory,
  ),
  "Automatic Fire Suppressor": Component(
    name: "Automatic Fire Suppressor",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "During the [[Mange Fires]] step, when a fire deals damage to any side of your car, apply the damage to this card instead and extinguish that fire.",
        abbrText: "[[_Manage Fires]]: Takes [[DamageType.fire]] first AND –[[DamageType.fire]]",
      ),
    ],
    attributes: [
      Attribute.canAbsorbFireDamage,
    ],
    durability: 3,
    source: Source.core,
  ),
  "Autopilot": Component(
    name: "Autopilot",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "If there is no [[Token.control]] on this, you may pay 3 [[Token.ace]] to place 1 [[Token.control]] on this (from the supply).",
        abbrText: "[[Token.ace]] [[Token.ace]] [[Token.ace]] = Store [[Token.control]",
      ),
      Mod(
        text: "Once per turn, you may pay [[Token.control]] from this as though it was provided by your dashboard.",
        abbrText: "[[_Once per Turn]]: Pay stored [[Token.control]]",
      ),
    ],
    attributes: [
      Attribute.canStoreControl,
    ],
    durability: 2,
    source: Source.uncleAl,
  ),
  "Ballistic Shell": Component(
    name: "Ballistic Shell",
    cost: 4,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.yellow:1]], [[Die.green:1]], and [[Die.blue:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.yellow:1]] [[Die.green:1]] [[Die.blue:1]]",
      ),
    ],
    durability: 2,
    source: Source.playmat,
  ),
  "Bandit": Component(
    name: "Bandit",
    cost: 4,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Once per driving roll, you may re-roll any 1 die.",
        abbrText: "[[_Driving Roll]]: +1 re-roll",
      ),
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Betatron": Weapon(
    name: "Betatron",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shock,
    mods: [
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench]] [[Token.wrench]] = [[Token.damage]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
        Dice(Die.blue, 2),
      ],
    ),
    wrenchResult: DamageType.basic,
    durability: 3,
    source: Source.set4,
  ),
  "Bonesaw": Weapon(
    name: "Bonesaw",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.melee,
    restrictions: [
      Restriction.range1,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.green, 1),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.basic,
    durability: 1,
    source: Source.set1,
  ),
  "Brushcutter": Weapon(
    name: "Brushcutter",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.melee,
    restrictions: [
      Restriction.range1,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.green, 1),
      ],
    ),
    wrenchResult: DamageType.basic,
    durability: 1,
    source: Source.set3,
  ),
  "Buffalo Gun": Weapon(
    name: "Buffalo Gun",
    cost: 6,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    durability: 2,
    source: Source.core,
  ),
  "Bug Zapper": Weapon(
    name: "Bug Zapper",
    cost: 1,
    type: ComponentType.sidearm,
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 1),
      ],
    ),
    mods: [
      Mod(
        text: "The defender gets 2 fewer range re-rolls when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    restrictions: [
      Restriction.sideArcFire,
    ],
    wrenchResult: DamageType.fire,
    source: Source.crew,
  ),
  "Bumper Spikes": Component(
    name: "Bumper Spikes",
    cost: 1,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.frame,
    mods: [
      Mod(
        text: "When the front or back of your car touches a heavy obstacle or wall, that obstacle takes [[DamageType.basic:1]] additional collision damage.",
        abbrText: "[[_Collisions, Front/Back]]: +[[DamageType.basic:1]]",
      ),
    ],
    source: Source.set1,
  ),
  "Cadmium Alloy Fasteners": Component(
    name: "Cadmium Alloy Fasteners",
    cost: 2,
    type: ComponentType.upgrade,
    mods: [
      Mod(
        text: "Increase your armor point (AP) value by 1 when constructing your car.",
        abbrText: "[[_Construction]]: +1 AP",
      ),
    ],
    attributes: [
      Attribute.awardsAP,
    ],
    source: Source.uncleAl,
  ),
  "Carbon Laminate": Component(
    name: "Carbon Laminate",
    cost: 2,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.black:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.black:1]]",
      ),
    ],
    durability: 3,
    source: Source.set1,
  ),
  "Chassis Brace": Component(
    name: "Chassis Brace",
    cost: 1,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.frame,
    mods: [
      Mod(
        text: "Take an additional [[Token.ace]] each time you make a maneuver at speed 4 or 5.",
        abbrText: "[[_Maneuvers, Speed 4/5]]: +[[Token.ace]]",
      ),
    ],
    source: Source.core,
  ),
  "Complex Concealment System": Component(
    name: "Complex Concealment System",
    cost: 8,
    type: ComponentType.upgrade,
    restrictions: [
      Restriction.exclusive,
    ],
    mods: [
      Mod(
        text: "During your movement or combat phase, you may flip this face-down. If you do, equip any Weapon cards with a total cost of 6BP to your car (following the build rules for your game).",
        abbrText: "[[__Movement/Combat]]: +6BP weapon(s) (once)",
      ),
    ],
    attributes: [
      Attribute.expendable,
      Attribute.replaceableWeapon6BP,
      Attribute.requiresDiv6,
    ],
    source: Source.uncleAl,
  ),
  "Concussion Grenades": Weapon(
    name: "Concussion Grenades",
    cost: 1,
    type: ComponentType.sidearm,
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.green, 1),
        Dice(Die.white, 1),
      ],
    ),
    restrictions: [
      Restriction.range2,
      Restriction.sideArcFire,
    ],
    wrenchResult: DamageType.explosion,
    source: Source.crew,
  ),
  "Concussion Mine Dropper": Weapon(
    name: "Concussion Mine Dropper",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.drop,
    restrictions: [
      Restriction.drop,
    ],
    mods: [
      Mod(text: "Take 4 [[Concussion Mine]] tokens.", type: ModType.note),
      Mod(
        text: "You may drop [[Concussion Mine]] tokens from this weapon's stockpile.",
        abbrText: "[[_Attacks]]: Drop [[Concussion Mine]]",
      ),
    ],
    durability: 2,
    source: Source.drop,
  ),
  "Devastator": Weapon(
    name: "Devastator",
    cost: 8,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.red, 3),
        Dice(Die.blue, 2),
        Dice(Die.white, 2),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    durability: 2,
    source: Source.core,
  ),
  "Disruptor": Weapon(
    name: "Disruptor",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shock,
    mods: [
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench]] [[Token.wrench]] = [[Token.damage]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
      ],
    ),
    wrenchResult: DamageType.basic,
    durability: 3,
    source: Source.set2,
  ),
  "Drag Chute": Component(
    name: "Drag Chute",
    cost: 1,
    type: ComponentType.accessory,
    restrictions: [
      Restriction.backOnly,
    ],
    mods: [
      Mod(text: "Take 1 [[Token.ace]] during the [[Take Control]] step."),
      Mod(
        text: "During the [[Check Speed]] step, you may decelerate to speed 0. If you do, flip this card face-down.",
        abbrText: "[[__Check Speed]]: Speed 0 (once)",
      ),
    ],
    attributes: [
      Attribute.expendable,
      Attribute.takeAce,
    ],
    durability: 1,
    source: Source.uncleAl,
  ),
  "Dreadnaught": Weapon(
    name: "Dreadnaught",
    cost: 8,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 4,
      dice: [
        Dice(Die.blue, 1),
        Dice(Die.white, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    durability: 2,
    source: Source.set1,
  ),
  "Driving Boots": Component(
    name: "Driving Boots",
    cost: 1,
    type: ComponentType.gear,
    mods: [
      Mod(
        text: "Once per driving roll, you may pay 1 [[Token.ace]] to re-roll [[Die.yellow:1]].",
        abbrText: "[[_Driving Roll]]: [[Token.ace]] = re-roll [[Die.yellow:1]]",
      ),
    ],
    source: Source.crew,
  ),
  "Driving Gloves": Component(
    name: "Driving Gloves",
    cost: 1,
    type: ComponentType.gear,
    subtype: ComponentSubtype.gloves,
    mods: [
      Mod(
        text: "When making a D1 turn, you may add [[Die.yellow:1]] to your driving roll instead of [[Die.green:1]] (this does not apply to D2, D3, or D4 turns).",
        abbrText: "[[_D1 Turn]]: [[Die.green:1]] → [[Die.yellow:1]]",
      ),
    ],
    source: Source.crew,
  ),
  "Dynamic Suspension": Component(
    name: "Dynamic Suspension",
    cost: 2,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "Take 1 [[Token.control]] during the [[Take Control]] step. Also take [[Token.ace]] equal to the highest terrain level your car is overlapping.",
        abbrText: "[[__Take Control]]: +[[Token.control]] AND +[[Token.ace]] for [[Terrain]]",
      ),
    ],
    attributes: [
      Attribute.takeControl,
    ],
    durability: 1,
    source: Source.core,
  ),
  "Electrolaser": Weapon(
    name: "Electrolaser",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    mods: [
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.red, 1),
      ],
    ),
    wrenchResult: DamageType.fire,
    durability: 1,
    source: Source.set3,
  ),
  "EM Distortion Field": Component(
    name: "EM Distortion Field",
    cost: 3,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.coating,
    mods: [
      Mod(
        text: "When attacked on any side that has at least 1 armor point remaining, add [[Die.black:1]] to your defense roll. When attacked by a [[Shock]] weapon, add [[Die.white:1]] instead.",
        abbrText: "[[_Defense, 1+ AP]]: +[[Die.black:1]] OR +[[Die.white:1]] for [[Shock]]",
      ),
    ],
    source: Source.armory,
  ),
  "Experimental Ablative Cladding": Component(
    name: "Experimental Ablative Cladding",
    cost: 3,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.black:2]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.black:2]]",
      ),
    ],
    durability: 4,
    source: Source.set1,
  ),
  "Fang": Component(
    name: "Fang",
    cost: 6,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "Add [[Die.blue:2]] to each attack made by your crew.",
        abbrText: "[[_Crew Attacks]]: +[[Die.blue:2]]",
      ),
    ],
    attributes: [
      Attribute.attackCrewBlue2,
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Fire Extinguisher": Component(
    name: "Fire Extinguisher",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "During your combat phase, you may spend 2 [[Token.control]] to extinguish 1 fire.",
        abbrText: "[[__Combat]]: [[Token.control]] [[Token.control]] = –[[DamageType.fire]]",
      ),
    ],
    attributes: [
      Attribute.attackCrewBlue2,
    ],
    durability: 3,
    source: Source.set3,
  ),
  "Fire Lance": Weapon(
    name: "Fire Lance",
    cost: 4,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.fire,
    restrictions: [
      Restriction.range2,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.blue, 1),
        Dice(Die.black, 1),
      ],
    ),
    wrenchResult: DamageType.fire,
    durability: 2,
    source: Source.set2,
  ),
  "Fire-Resistant Coating": Component(
    name: "Fire-Resistant Coating",
    cost: 3,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.coating,
    mods: [
      Mod(
        text: "When attacked on any side that has at least 1 armor point remaining, add [[Die.black:1]] to your defense roll. When attacked by a [[Fire]] weapon, add [[Die.white:1]] instead.",
        abbrText: "[[_Defense, 1+ AP]]: +[[Die.black:1]] OR +[[Die.white:1]] for [[Fire]]",
      ),
    ],
    source: Source.uncleAl,
  ),
  "First-Aid Kit": Component(
    name: "First-Aid Kit",
    cost: 1,
    type: ComponentType.gear,
    mods: [
      Mod(
        text: "At the start of the round, you may remove up to 2 [[Token.damage]] from 1 of your surviving crew members. If you do, flip this card face-down.",
        abbrText: "[[__Check Speed]]: –[[Token.damage]] [[Token.damage]] from 1 crew (once)",
      ),
    ],
    attributes: [
      Attribute.expendable,
    ],
    source: Source.crew,
  ),
  "Flak Jacket": Component(
    name: "Flak Jacket",
    cost: 1,
    type: ComponentType.gear,
    subtype: ComponentSubtype.vest,
    mods: [
      Mod(
        text: "Your crew members can each take an additional [[Token.damage]] before they are killed.",
        abbrText: "+1 Crew Durability",
      ),
    ],
    attributes: [
      Attribute.enhancesCrewDurability,
    ],
    source: Source.core,
  ),
  "Flame Jets": Component(
    name: "Flame Jets",
    cost: 1,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.frame,
    mods: [
      Mod(
        text: "When the front or back of your car touches a heavy obstacle or wall, a [[DamageType.fire]] starts on that obstacle on the side that is touching your car. Do this before resolving collision damage.",
        abbrText: "[[_Collisions, Front/Back]]: +[[DamageType.fire]]",
      ),
    ],
    source: Source.set4,
  ),
  "Fire Mine Dropper": Weapon(
    name: "Fire Mine Dropper",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.drop,
    restrictions: [
      Restriction.drop,
    ],
    mods: [
      Mod(text: "Take 4 [[Fire Mine]] tokens.", type: ModType.note),
      Mod(
        text: "You may drop [[Fire Mine]] tokens from this weapon's stockpile.",
        abbrText: "[[_Attacks]]: Drop [[Fire Mine]]",
      ),
    ],
    durability: 2,
    source: Source.drop,
  ),
  "Firecracker": Weapon(
    name: "Firecracker",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.blue, 1),
        Dice(Die.black, 1),
      ],
    ),
    wrenchResult: DamageType.explosion,
    durability: 1,
    source: Source.set2,
  ),
  "Flamethrower": Weapon(
    name: "Flamethrower",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.fire,
    restrictions: [
      Restriction.range2,
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
      ],
    ),
    wrenchResult: DamageType.fire,
    durability: 2,
    source: Source.core,
  ),
  "Foam Nozzle": Weapon(
    name: "Foam Nozzle",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.drop,
    restrictions: [
      Restriction.drop,
    ],
    mods: [
      Mod(text: "Take 4 [[Foam]] tokens.", type: ModType.note),
      Mod(
        text: "You may drop [[Foam]] tokens from this weapon's stockpile.",
        abbrText: "[[_Attacks]]: Drop [[Foam]]",
      ),
    ],
    durability: 2,
    source: Source.drop,
  ),
  "Gator": Weapon(
    name: "Gator",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 4,
      dice: [
        Dice(Die.black, 1),
      ],
    ),
    durability: 2,
    source: Source.set2,
  ),
  "Gauss Cannon": Weapon(
    name: "Gauss Cannon",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.red, 2),
        Dice(Die.blue, 1),
        Dice(Die.white, 2),
      ],
    ),
    durability: 2,
    source: Source.armory,
  ),
  "Ghost": Component(
    name: "Ghost",
    cost: 1,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "When hard braking or hard accelerating, you may pay 1 [[Token.control]] instead of taking damage to your tires or power plant.",
        abbrText: "[[_Hard Braking/Accelerating]]: [[Token.control]] = –[[damage]]",
      ),
    ],
    durability: 2,
    source: Source.uncleAl,
  ),
  "Grapeshot Cannon": Weapon(
    name: "Grapeshot Cannon",
    cost: 7,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.range2,
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 3),
        Dice(Die.yellow, 2),
        Dice(Die.black, 1),
        Dice(Die.white, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.drop,
  ),
  "Grendel": Component(
    name: "Grendel",
    cost: 3,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "When this gunner attacks, add [[DamageType.basic:1]].",
        abbrText: "[[_Attacks]]: +[[DamageType.basic:1]]",
      ),
    ],
    attributes: [
      Attribute.attackGunnerBasic1,
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Gyroscopic Stabilizer": Component(
    name: "Gyroscopic Stabilizer",
    cost: 1,
    type: ComponentType.upgrade,
    mods: [
      Mod(
        text: "During the [[Take Control]] step, if you are at speed 4, take 1 [[Token.control]].",
        abbrText: "[[__Take Control]][[_, Speed 4]]: +[[Token.control]]",
      ),
      Mod(
        text: "During the [[Take Control]] step, if you are at speed 5, take 2 [[Token.control]].",
        abbrText: "[[__Take Control]][[_, Speed 5]]: +[[Token.control]] [[Token.control]]",
      ),
    ],
    attributes: [
      Attribute.takeControlSpeed4,
      Attribute.takeControl2Speed5,
    ],
    source: Source.set4,
  ),
  "Hacker": Component(
    name: "Hacker",
    cost: 1,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "When attacking with any crew member, you may pay 1 [[Token.ace]] to fire a 1BP weapon that has already been fired this turn.",
        abbrText: "[[_Crew Attacks]]: [[Token.ace]] = 1BP weapon re-fire",
      ),
    ],
    durability: 3,
    source: Source.uncleAl,
  ),
  "Hammerhead": Weapon(
    name: "Hammerhead",
    cost: 6,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 1),
        Dice(Die.blue, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.explosion,
    durability: 2,
    source: Source.set3,
  ),
  "Hand Cannon": Weapon(
    name: "Hand Cannon",
    cost: 0,
    asterisk: true,
    type: ComponentType.sidearm,
    damageDice: DamageDice(
      dice: [
        Dice(Die.blue, 3),
      ],
    ),
    restrictions: [
      Restriction.sideArcFire,
    ],
    mods: [
      Mod(text: "*All players start the game with this equipped.", type: ModType.note),
    ],
    source: Source.core,
  ),
  "Heat Saber": Weapon(
    name: "Heat Saber",
    cost: 6,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.fire,
    restrictions: [
      Restriction.range2,
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 1),
        Dice(Die.blue, 1),
        Dice(Die.white, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.fire,
    durability: 2,
    source: Source.core,
  ),
  "Hellfire": Weapon(
    name: "Hellfire",
    cost: 7,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 3),
        Dice(Die.blue, 1),
        Dice(Die.black, 1),
        Dice(Die.white, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.core,
  ),
  "Heavy Ceramic Plate": Component(
    name: "Heavy Ceramic Plate",
    cost: 3,
    type: ComponentType.structure,
    durability: 6,
    source: Source.set1,
  ),
  "Heavy Composite Plate": Component(
    name: "Heavy Composite Plate",
    cost: 4,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.blue:2]] and [[Die.black:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.blue:2]] [[Die.black:1]]",
      ),
    ],
    durability: 1,
    source: Source.set2,
  ),
  "Heavy Machine Gun": Weapon(
    name: "Heavy Machine Gun",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.core,
  ),
  "Heavy Machine Gun Incendiary Rounds": Weapon(
    name: "Heavy Machine Gun Incendiary Rounds",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    mods: [
      Mod(
        text: "When attacking with this, add [[DamageType.tires:2]].",
        abbrText: "[[_Attacks]]: +[[DamageType.tires:2]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
      ],
    ),
    wrenchResult: DamageType.fire,
    attributes: [
      Attribute.attackIncendiaryTires2,
    ],
    durability: 2,
    source: Source.set4,
  ),
  "Heavy Plastic Cladding": Component(
    name: "Heavy Plastic Cladding",
    cost: 3,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.yellow:1]] and [[Die.red:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.yellow:1]] [[Die.red:1]]",
      ),
    ],
    durability: 1,
    source: Source.set4,
  ),
  "Heavy Recoilless Rifle": Weapon(
    name: "Heavy Recoilless Rifle",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.yellow, 2),
        Dice(Die.blue, 1),
      ],
    ),
    durability: 2,
    source: Source.armory,
  ),
  "Heavy Rocket": Weapon(
    name: "Heavy Rocket",
    cost: 8,
    asterisk: true,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
      Restriction.frontBack,
    ],
    mods: [
      Mod(text: "*Take and equip a second copy of this for free.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 3),
        Dice(Die.blue, 3),
        Dice(Die.black, 1),
      ],
    ),
    attributes: [
      Attribute.paired,
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.explosion,
    durability: 1,
    source: Source.core,
  ),
  "Heavy Steel Plate": Component(
    name: "Heavy Steel Plate",
    cost: 3,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.green:1]] and [[Die.yellow:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.green:1]] [[Die.yellow:1]]",
      ),
    ],
    durability: 3,
    source: Source.set3,
  ),
  "High-Density Radials": Component(
    name: "High-Density Radials",
    cost: 2,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.wheels,
    mods: [
      Mod(
        text: "Take 2 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]] [[Token.ace]]",
      ),
      Mod(
        text: "Each time you make a driving roll, you may pay [[Token.ace]] to ignore [[Token.wrench]] results. Ignore 1 [[Token.wrench]] for every 2 [[Token.ace]] spent.",
        abbrText: "[[_Driving Roll]]: [[Token.ace]] [[Token.ace]] = –[[Token.wrench]]",
      ),
    ],
    attributes: [
      Attribute.takeAce2,
    ],
    source: Source.core,
  ),
  "High-Torque Differential": Component(
    name: "High-Torque Differential",
    cost: 2,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "When you make a maneuver, remove [[Die.yellow:1]] from your driving roll.",
        abbrText: "[[_Maneuvers]]: –[[Die.yellow:1]]",
      ),
    ],
    attributes: [
      Attribute.maneuverRemoveYellow1,
    ],
    durability: 1,
    source: Source.set4,
  ),
  "Holographic Sight": Component(
    name: "Holographic Sight",
    cost: 1,
    type: ComponentType.gear,
    subtype: ComponentSubtype.optic,
    mods: [
      Mod(
        text: "When attacking with a sidearm, add [[Die.blue:1]] if your target is within 2 car lengths.",
        abbrText: "[[_Sidearm Attacks]]: +[[Die.blue:1]] if <= 2 car lengths",
      ),
    ],
    source: Source.core,
  ),
  "Hound": Component(
    name: "Hound",
    cost: 0,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "Take 1 [[Token.control]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.control]]",
      ),
      Mod(
        text: "When this gunner attacks, the defender adds [[Die.yellow:1]] to their defense roll.",
        abbrText: "[[_Attacks]]: +[[Die.yellow:1]] defense",
      ),
    ],
    attributes: [
      Attribute.takeControl,
      Attribute.attackIneptYellow1,
    ],
    durability: 3,
    source: Source.crew,
  ),
  "HUD Goggles": Component(
    name: "HUD Goggles",
    cost: 1,
    type: ComponentType.gear,
    mods: [
      Mod(
        text: "Once per attack, if your target is provided any [[Token.shield]] by cover, you may pay 1 [[Token.ace]] to add [[DamageType.basic:1]] to the attack.",
        abbrText: "[[_Attacks with Cover]]: [[Token.ace]] = [[DamageType.basic:1]]",
      ),
    ],
    source: Source.crew,
  ),
  "Hyperion": Component(
    name: "Hyperion",
    cost: 5,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "This gunner may make one additional attack each turn using the [[Hand Cannon]].",
        abbrText: "[[__Combat]]: +1 [[Hand Cannon]] attack",
      ),
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Jackhammer": Weapon(
    name: "Jackhammer",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 3,
      dice: [
        Dice(Die.black, 1),
      ],
    ),
    durability: 2,
    source: Source.set3,
  ),
  "Javelin": Weapon(
    name: "Javelin",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.blue, 1),
      ],
    ),
    durability: 2,
    source: Source.set1,
  ),
  "Killstreak": Weapon(
    name: "Killstreak",
    cost: 1,
    type: ComponentType.sidearm,
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.blue, 1),
        Dice(Die.white, 1),
      ],
    ),
    restrictions: [
      Restriction.sideArcFire,
    ],
    wrenchResult: DamageType.tires,
    source: Source.crew,
  ),
  "Kinetic Diffuser": Component(
    name: "Kinetic Diffuser",
    cost: 4,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.green:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.green:1]]",
      ),
    ],
    durability: 7,
    source: Source.road,
  ),
  "Laser-Guided Light Rocket": Weapon(
    name: "Laser-Guided Light Rocket",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
    ],
    mods: [
      Mod(
        text: "You may pay [[Token.ace]] to re-roll dice when attacking with this. Re-roll 1 die for each [[Token.ace]] spent.",
        abbrText: "[[_Attacks]]: [[Token.ace]] = re-roll",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 1),
      ],
    ),
    wrenchResult: DamageType.explosion,
    attributes: [
      Attribute.attackAceForReroll,
    ],
    durability: 1,
    source: Source.uncleAl,
  ),
  "Laser-Reflective Coating": Component(
    name: "Laser-Reflective Coating",
    cost: 3,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.coating,
    mods: [
      Mod(
        text: "When attacked on any side that has at least 1 armor point remaining, add [[Die.black:1]] to your defense roll. When attacked by a [[Laser]] weapon, add [[Die.white:1]] instead.",
        abbrText: "[[_Defense, 1+ AP]]: +[[Die.black:1]] OR +[[Die.white:1]] for [[Laser]]",
      ),
    ],
    source: Source.uncleAl,
  ),
  "Legend Driver": Component(
    name: "Legend",
    cost: 6,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Add [[Die.white:1]] to each of your defense rolls.",
        abbrText: "[[_Defense]]: +[[Die.white:1]]",
      ),
    ],
    durability: 3,
    source: Source.core,
  ),
  "Legend Gunner": Component(
    name: "Legend",
    cost: 6,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "When this gunner attacks, add [[DamageType.basic:2]].",
        abbrText: "[[_Attacks]]: +[[DamageType.basic:2]]",
      ),
    ],
    attributes: [
      Attribute.attackGunnerBasic2,
    ],
    durability: 3,
    source: Source.core,
  ),
  "Light Ceramic Plate": Component(
    name: "Light Ceramic Plate",
    cost: 1,
    type: ComponentType.structure,
    durability: 2,
    source: Source.set2,
  ),
  "Light Incendiary Rocket": Weapon(
    name: "Light Incendiary Rocket",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.fire,
    restrictions: [
      Restriction.oneShot,
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.blue, 1),
        Dice(Die.black, 1),
      ],
    ),
    wrenchResult: DamageType.explosion,
    durability: 1,
    source: Source.uncleAl,
  ),
  "Light Machine Gun": Weapon(
    name: "Light Machine Gun",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.black, 2),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.core,
  ),
  "Light Machine Gun Incendiary Rounds": Weapon(
    name: "Light Machine Gun Incendiary Rounds",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    mods: [
      Mod(
        text: "When attacking with this, add [[DamageType.tires:1]]",
        abbrText: "[[_Attacks]]: +[[DamageType.tires:1]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
      ],
    ),
    wrenchResult: DamageType.fire,
    attributes: [
      Attribute.attackIncendiaryTires1,
    ],
    durability: 2,
    source: Source.set3,
  ),
  "Light Plastic Cladding": Component(
    name: "Light Plastic Cladding",
    cost: 2,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.blue:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.blue:1]]",
      ),
    ],
    durability: 1,
    source: Source.set1,
  ),
  "Light Recoilless Rifle": Weapon(
    name: "Light Recoilless Rifle",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 2),
      ],
    ),
    durability: 2,
    source: Source.armory,
  ),
  "Light Rocket": Weapon(
    name: "Light Rocket",
    cost: 1,
    asterisk: true,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
    ],
    mods: [
      Mod(text: "*Take and equip a second copy of this for free.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 1),
        Dice(Die.blue, 1),
      ],
    ),
    attributes: [
      Attribute.paired,
    ],
    wrenchResult: DamageType.explosion,
    durability: 1,
    source: Source.set1,
  ),
  "Light Steel Plate": Component(
    name: "Light Steel Plate",
    cost: 1,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.black:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.black:1]]",
      ),
    ],
    durability: 1,
    source: Source.set3,
  ),
  "Lightning Scythe": Weapon(
    name: "Lightning Scythe",
    cost: 7,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shock,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench]] [[Token.wrench]] = [[Token.damage]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 3),
        Dice(Die.green, 2),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.basic,
    durability: 3,
    source: Source.set2,
  ),
  "Linked Brushcutters": Weapon(
    name: "Linked Brushcutters",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.melee,
    restrictions: [
      Restriction.range1,
    ],
    mods: [
      Mod(
        text: "When attacking with this weapon, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
      ],
    ),
    attributes: [
      Attribute.attackRerolls2,
    ],
    durability: 1,
    source: Source.linked,
  ),
  "Linked Disruptors": Weapon(
    name: "Linked Disruptors",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shock,
    mods: [
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench]] [[Token.wrench]] = [[Token.damage]]",
      ),
      Mod(
        text: "When attacking with this weapon, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 1),
        Dice(Die.blue, 1),
        Dice(Die.black, 1),
      ],
    ),
    wrenchResult: DamageType.basic,
    attributes: [
      Attribute.attackRerolls2,
    ],
    durability: 3,
    source: Source.linked,
  ),
  "Linked Flamethrowers": Weapon(
    name: "Linked Flamethrowers",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.fire,
    restrictions: [
      Restriction.range2,
    ],
    mods: [
      Mod(
        text: "When attacking with this weapon, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.white, 2),
      ],
    ),
    wrenchResult: DamageType.fire,
    attributes: [
      Attribute.attackRerolls2,
    ],
    durability: 2,
    source: Source.linked,
  ),
  "Linked Hammerheads": Weapon(
    name: "Linked Hammerheads",
    cost: 8,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "When attacking with this weapon, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
        Dice(Die.blue, 1),
        Dice(Die.white, 2),
      ],
    ),
    attributes: [
      Attribute.attackRerolls2,
      Attribute.requiresDiv6,
    ],
    durability: 2,
    source: Source.linked,
  ),
  "Linked Jackhammers": Weapon(
    name: "Linked Jackhammers",
    cost: 6,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "When attacking with this weapon, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 3,
      dice: [
        Dice(Die.red, 3),
      ],
    ),
    attributes: [
      Attribute.attackRerolls2,
      Attribute.requiresDiv6,
    ],
    durability: 2,
    source: Source.linked,
  ),
  "Linked Pulse Lasers": Weapon(
    name: "Linked Pulse Lasers",
    cost: 7,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench]] [[Token.wrench]] = [[Token.damage]]",
      ),
      Mod(
        text: "When attacking with this weapon, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 1),
        Dice(Die.blue, 4),
      ],
    ),
    wrenchResult: DamageType.fire,
    attributes: [
      Attribute.attackRerolls2,
      Attribute.requiresDiv6,
    ],
    durability: 1,
    source: Source.linked,
  ),
  "Linked Standard Machine Guns": Weapon(
    name: "Linked Standard Machine Guns",
    cost: 4,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    mods: [
      Mod(
        text: "When attacking with this weapon, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.blue, 2),
        Dice(Die.black, 1),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    attributes: [
      Attribute.attackRerolls2,
    ],
    durability: 2,
    source: Source.linked,
  ),
  "Linked Shotguns": Weapon(
    name: "Linked Shotguns",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.range2,
    ],
    mods: [
      Mod(
        text: "When attacking with this weapon, you may re-roll 2 dice.",
        abbrText: "[[_Attacks]]: +2 re-rolls",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.blue, 1),
        Dice(Die.black, 1),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    attributes: [
      Attribute.attackRerolls2,
    ],
    durability: 2,
    source: Source.linked,
  ),
  "Longbow": Weapon(
    name: "Longbow",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 4),
        Dice(Die.black, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.uncleAl,
  ),
  "Mamba": Component(
    name: "Mamba",
    cost: 1,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "During the [[Take Control]] step, roll [[Die.black:1]]:<br>[[Token.wrench]] = take 1 [[Token.control]]<br>[[DamageType.basic:0]] = take 1 [[Token.ace]]",
        abbrText: "[[__Take Control]]: [[Die.black:1]] = ([[Token.wrench]] = [[Token.control]], [[DamageType.basic:0]] = [[Token.ace]])",
      ),
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Machete": Component(
    name: "Machete",
    cost: 2,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "When this gunner attacks with a [[Shred]] weapon, add [[Die.black:1]].",
        abbrText: "[[__Shred]] [[_Attacks]]: +[[Die.black:1]]",
      ),
    ],
    attributes: [
      Attribute.attackGunnerShredBlack1,
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Magnetic Dampers": Component(
    name: "Magnetic Dampers",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "When making a driving roll for a maneuver, you may re-roll 1 die.",
        abbrText: "[[_Maneuvers]]: +1 re-roll",
      ),
    ],
    durability: 1,
    source: Source.set4,
  ),
  "Mass Driver": Weapon(
    name: "Mass Driver",
    cost: 6,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 4,
      dice: [
        Dice(Die.blue, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    durability: 2,
    source: Source.set4,
  ),
  "Max": Component(
    name: "Max",
    cost: 5,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "Add [[Die.yellow:1]] to each attack made by your crew.",
        abbrText: "[[_Crew Attacks]]: +[[Die.yellow:1]]",
      ),
    ],
    attributes: [
      Attribute.attackCrewYellow1,
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Medusa": Component(
    name: "Medusa",
    cost: 3,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Take 1 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]]",
      ),
      Mod(
        text: "After rolling for defense, you may pay [[Token.ace]] to add [[Token.shield]] to your defense results. Add 1 [[Token.shield]] for every 3 [[Token.ace]] spent.",
        abbrText: "[[_Defense]]: [[Token.ace]] [[Token.ace]] [[Token.ace]] = [[Token.shield]]",
      ),
    ],
    attributes: [
      Attribute.takeAce,
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Minigun": Weapon(
    name: "Minigun",
    cost: 8,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 2),
        Dice(Die.blue, 3),
        Dice(Die.black, 1),
        Dice(Die.white, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.armory,
  ),
  "Monarch": Component(
    name: "Monarch",
    cost: 4,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "Once per attack, when the defender reveals a damage card, you may choose to have them set that card aside and draw again.",
        abbrText: "[[_Attacks]]: +1 damage re-draw",
      ),
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Off-Road Suspension": Component(
    name: "Off-Road Suspension",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "When your car is overlapping [[Terrain:1]] or higher or you are out of control (or if both conditions are true), add [[Die.yellow:1]] to your defense rolls.",
        abbrText: "[[_Out of Control/]][[Terrain:1]]+: +[[Die.yellow:1]] defense",
      ),
    ],
    durability: 1,
    source: Source.playmat,
  ),
  "Off-Road Tires": Component(
    name: "Off-Road Tires",
    cost: 1,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.wheels,
    mods: [
      Mod(
        text: "Take 2 [[Token.ace]] during the [[Take Control]] step. Also take [[Token.ace]] equal to the highest terrain level your car is overlapping.",
        abbrText: "[[__Take Control]]: +[[Token.ace]] [[Token.ace]] + [[Token.ace]] per [[Terrain]]",
      ),
    ],
    attributes: [
      Attribute.takeAce2,
    ],
    source: Source.playmat,
  ),
  "Oil Jets": Weapon(
    name: "Oil Jets",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.drop,
    restrictions: [
      Restriction.drop,
    ],
    mods: [
      Mod(text: "Take 4 [[Oil]] cards.", type: ModType.note),
      Mod(
        text: "You may drop [[Oil]] cards from this weapon's stockpile.",
        abbrText: "[[_Attacks]]: Drop [[Oil]]",
      ),
    ],
    durability: 2,
    source: Source.drop,
  ),
  "Paint Grenades": Weapon(
    name: "Paint Grenades",
    cost: 1,
    type: ComponentType.sidearm,
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.green, 1),
      ],
    ),
    mods: [
      Mod(
        text: "(Apply 1 [[Paint]] card to the targeted side. If that side is already painted, [[Token.wrench]] = [[DamageType.basic:1]].)",
        abbrText: "[[_Attacks]]: [[Token.wrench]] = [[Paint]] OR [[Token.wrench]] = [[DamageType.basic:1]]",
      ),
    ],
    restrictions: [
      Restriction.range2,
      Restriction.sideArcFire,
    ],
    wrenchResult: DamageType.paint,
    source: Source.drop,
  ),
  "Particle Beam": Weapon(
    name: "Particle Beam",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    mods: [
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
      ],
    ),
    wrenchResult: DamageType.fire,
    durability: 1,
    source: Source.set4,
  ),
  "Peppermill": Weapon(
    name: "Peppermill",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.range2,
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.set1,
  ),
  "Plasma Cannon": Weapon(
    name: "Plasma Cannon",
    cost: 8,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.fire,
    restrictions: [
      Restriction.range2,
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.red, 2),
        Dice(Die.green, 2),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.fire,
    durability: 2,
    source: Source.set4,
  ),
  "Plated Vest": Component(
    name: "Plated Vest",
    cost: 1,
    type: ComponentType.gear,
    subtype: ComponentSubtype.vest,
    mods: [
      Mod(
        text: "When on foot, add [[Die.blue:1]] to your defense roll.",
        abbrText: "[[_On Foot]]: +[[Die.blue:1]] defense",
      ),
    ],
    source: Source.uncleAl,
  ),
  "Possum": Component(
    name: "Possum",
    cost: 2,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "When you are out of control, add [[Die.black:1]] to each of your defense rolls AND you may still make slight, D0, and D1 maneuvers.",
        abbrText: "[[_Out of Control]]: +[[Die.black:1]] defense AND up to D1",
      ),
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Power Plant Shielding": Component(
    name: "Power Plant Shielding",
    cost: 2,
    type: ComponentType.upgrade,
    mods: [
      Mod(
        text: "When your power plant takes damage, apply it to this card first.",
        abbrText: "Takes power plant damage first",
      ),
    ],
    attributes: [
      Attribute.canAbsorbPowerPlantDamage,
    ],
    durability: 2,
    source: Source.uncleAl,
  ),
  "Power Plant Superconductor": Component(
    name: "Power Plant Superconductor",
    cost: 1,
    type: ComponentType.accessory,
    restrictions: [
      Restriction.backOnly,
    ],
    mods: [
      Mod(
        text: "During the [[Adjust Speed]] step, instead of adjusting your speed normally, you may set your speed to 5. If you do, flip this face-down.",
        abbrText: "[[__Adjust Speed]]: Speed 5 (once)",
      ),
    ],
    attributes: [
      Attribute.expendable,
    ],
    durability: 1,
    source: Source.uncleAl,
  ),
  "Pulse Laser": Weapon(
    name: "Pulse Laser",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    mods: [
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
      ],
    ),
    wrenchResult: DamageType.fire,
    durability: 1,
    source: Source.set1,
  ),
  "Punchbumper": Component(
    name: "Punchbumper",
    cost: 1,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.frame,
    mods: [
      Mod(
        text: "When the front of your car touches a heavy obstacle or wall, an [[DamageType.explosion]] occurs on that obstacle on the side that is touching your car. Do this before resolving collision damage.",
        abbrText: "[[_Collisions]]: +[[DamageType.explosion]]",
      ),
    ],
    source: Source.drop,
  ),
  "Pyro": Component(
    name: "Pyro",
    cost: 2,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "When this gunner attacks with a [[Fire]] weapon, add [[Die.black:1]].",
        abbrText: "[[__Fire]] [[_Attacks]]: +[[Die.black:1]].",
      ),
    ],
    attributes: [
      Attribute.attackGunnerFireBlack1,
    ],
    durability: 3,
    source: Source.uncleAl,
  ),
  "Quad Laser": Weapon(
    name: "Quad Laser",
    cost: 7,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 4),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.fire,
    durability: 1,
    source: Source.set4,
  ),
  "Radar Detector": Component(
    name: "Radar Detector",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "You get 2 defense re-rolls each time you are attacked.",
        abbrText: "[[_Defense]]: +2 re-rolls",
      ),
    ],
    durability: 1,
    source: Source.uncleAl,
  ),
  "Radar Jammer": Component(
    name: "Radar Jammer",
    cost: 2,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "Add [[Die.green:1]] to each of your defense rolls.",
        abbrText: "[[_Defense]]: +[[Die.green:1]]",
      ),
    ],
    durability: 1,
    source: Source.uncleAl,
  ),
  "Radar Transmitter": Weapon(
    name: "Radar Transmitter",
    cost: 1,
    type: ComponentType.sidearm,
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.blue, 2),
      ],
    ),
    mods: [
      Mod(
        text: "If you use this for your first attack on your turn, add [[DamageType.basic:1]] to the next attack you make this turn against the same target.",
        abbrText: "[[_First Attack]]: +[[DamageType.basic:1]] to next attack",
      ),
      Mod(text: "This does not affect sidearms.", type: ModType.note),
    ],
    restrictions: [
      Restriction.sideArcFire,
    ],
    source: Source.uncleAl,
  ),
  "Railgun": Weapon(
    name: "Railgun",
    cost: 7,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.blue, 2),
        Dice(Die.white, 2),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    durability: 2,
    source: Source.armory,
  ),
  "Ramplate": Component(
    name: "Ramplate",
    cost: 3,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When the front of your car touches a heavy obstacle or wall, that obstacle takes [[DamageType.basic:2]] additional collision damage.",
        abbrText: "[[_Collisions]]: +[[DamageType.basic:2]]",
      ),
    ],
    durability: 3,
    source: Source.set3,
  ),
  "Ranger": Component(
    name: "Ranger",
    cost: 6,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Before making a driving roll, choose and remove any 1 die.",
        abbrText: "[[_Driving Roll]]: -1 die",
      ),
    ],
    durability: 3,
    source: Source.uncleAl,
  ),
  "Rapid-Cycle Laser": Weapon(
    name: "Rapid-Cycle Laser",
    cost: 4,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    mods: [
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
        Dice(Die.blue, 1),
      ],
    ),
    wrenchResult: DamageType.fire,
    durability: 1,
    source: Source.set2,
  ),
  "Ravager": Weapon(
    name: "Ravager",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.range2,
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.green, 3),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.set3,
  ),
  "Reactive Defense System": Component(
    name: "Reactive Defense System",
    cost: 3,
    type: ComponentType.upgrade,
    mods: [
      Mod(
        text: "Each time you are attacked, you may place a [[Token.damage]] token on this card to add [[Die.blue:2]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Token.damage]] = [[Die.blue:2]]",
      ),
    ],
    durability: 3,
    source: Source.uncleAl,
  ),
  "Regenerative Brakes": Component(
    name: "Regenerative Brakes",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "Ignore 1 [[Token.shield]] when making a maneuver at speed 2 or less.",
        abbrText: "[[_Maneuvers]]: –[[Token.shield]] if speed 2 or less",
      ),
    ],
    durability: 2,
    source: Source.set2,
  ),
  "Reinforced Weapon Brackets": Component(
    name: "Reinforced Weapon Brackets",
    cost: 1,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.mount,
    mods: [
      Mod(
        text: "When one of your equipped weapons would take damage, roll [[Die.yellow:1]]. If you roll a [[Token.shield]], reduce that damage by 1.",
        abbrText: "Weapons get [[Die.yellow:1]] defense roll",
      ),
    ],
    attributes: [
      Attribute.shieldReducesWeaponDamage,
    ],
    source: Source.set2,
  ),
  "Rhino": Component(
    name: "Rhino",
    cost: 2,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Add [[Die.black:1]] to each of your defense rolls.",
        abbrText: "[[_Defense]]: +[[Die.black:1]]",
      ),
    ],
    durability: 3,
    source: Source.uncleAl,
  ),
  "Rockwolf": Component(
    name: "Rockwolf",
    cost: 5,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Before making a driving roll, choose and remove any 1 die added by a maneuver.",
        abbrText: "[[_Maneuvers]]: -1 die",
      ),
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Roll Bar": Component(
    name: "Roll Bar",
    cost: 1,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.frame,
    mods: [
      Mod(
          text: "When resolving collision damage, roll [[Die.white:1]]. Reduce the damage to your car by 1 for each [[Token.shield]].",
          abbrText: "[[_Collisions]]: [[Die.white:1]] = –[[damage]] per [[Token.shield]]",
      ),
    ],
    source: Source.set2,
  ),
  "Rookie Driver": Component(
    name: "Rookie",
    cost: 0,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    durability: 3,
    source: Source.core,
  ),
  "Rookie Gunner": Component(
    name: "Rookie",
    cost: 0,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    durability: 3,
    source: Source.core,
  ),
  "Rugged Suspension": Component(
    name: "Rugged Suspension",
    cost: 2,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "When you roll 3 or more [[Token.shield]] as the result of a driving roll, ignore 1 [[Token.shield]].",
        abbrText: "[[_Driving Roll]]: [[Token.shield]] [[Token.shield]] [[Token.shield]]+ = –[[Token.shield]]",
      ),
    ],
    durability: 3,
    source: Source.set3,
  ),
  "Run-Flat System": Component(
    name: "Run-Flat System",
    cost: 2,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.wheels,
    mods: [
      Mod(text: "Take 1 [[Token.ace]] during the [[Take Control]] step."),
      Mod(
        text: "If your tires are at 0 at the start of the round, set your tires slider to 1.",
        abbrText: "[[__Check Speed]]: 0 → 1 Tires",
      ),
    ],
    attributes: [
      Attribute.takeAce,
    ],
    source: Source.set2,
  ),
  "Safety Cage": Component(
    name: "Safety Cage",
    cost: 2,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.frame,
    mods: [
      Mod(
        text: "When resolving collision damage, roll [[Die.yellow:3]]. Reduce the damage to your car by 1 for each [[Token.shield]].",
        abbrText: "[[_Collisions]]: [[Die.yellow:3]] = –[[damage]] per [[Token.shield]]",
      ),
    ],
    source: Source.core,
  ),
  "Scatter Gun": Weapon(
    name: "Scatter Gun",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.range2,
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.green, 1),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.set1,
  ),
  "Scorpion": Component(
    name: "Scorpion",
    cost: 3,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Once per maneuver, you may spend 2 [[Token.ace]] to ignore 1 [[Token.shield]].",
        abbrText:"[[_Maneuvers]]: [[Token.ace]] [[Token.ace]] = –[[Token.shield]]",
      ),
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Sharkfin Aero Package": Component(
    name: "Sharkfin Aero Package",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "Once per maneuver, you may add [[Die.blue:2]] to your driving roll. If you do, extinguish 1 [[DamageType.fire]] on your car.",
        abbrText: "[[_Maneuvers]]: +[[Die.blue:2]] = –[[DamageType.fire]]",
      ),
    ],
    durability: 2,
    source: Source.uncleAl,
  ),
  "Shockwave Cannon": Weapon(
    name: "Shockwave Cannon",
    cost: 8,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shock,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench] [[Token.wrench] = [[Token.damage]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 2),
        Dice(Die.green, 2),
        Dice(Die.blue, 2),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.basic,
    durability: 3,
    source: Source.set3,
  ),
  "Simple Concealment System": Component(
    name: "Simple Concealment System",
    cost: 4,
    type: ComponentType.upgrade,
    restrictions: [
      Restriction.exclusive,
    ],
    mods: [
      Mod(
        text: "During your movement or combat phase, you may flip this face-down. If you do, equip any Weapon cards with a total cost of 3BP to your car (following the build rules for your game).",
        abbrText: "[[__Movement/Combat]]: +3BP weapon(s) (once)",
      ),
    ],
    attributes: [
      Attribute.expendable,
      Attribute.replaceableWeapon3BP,
    ],
    source: Source.uncleAl,
  ),
  "Slingshot": Weapon(
    name: "Slingshot",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.blue, 1),
        Dice(Die.black, 1),
      ],
    ),
    durability: 2,
    source: Source.set4,
  ),
  "Smoke Emitter": Weapon(
    name: "Smoke Emitter",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.drop,
    restrictions: [
      Restriction.drop,
    ],
    mods: [
      Mod(text: "Take 4 [[Smoke]] cards.", type: ModType.note),
      Mod(
        text: "You may drop [[Smoke]] cards from this weapon's stockpile.",
        abbrText: "[[_Attacks]]: Drop [[Smoke]]",
      ),
    ],
    durability: 2,
    source: Source.drop,
  ),
  "Solid-State Laser": Weapon(
    name: "Solid-State Laser",
    cost: 8,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 2,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 3),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.fire,
    durability: 1,
    source: Source.set2,
  ),
  "Spike Dropper": Weapon(
    name: "Spike Dropper",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.drop,
    restrictions: [
      Restriction.drop,
    ],
    mods: [
      Mod(text: "Take 4 [[Spikes]] cards.", type: ModType.note),
      Mod(
        text: "You may drop [[Spikes]] cards from this weapon's stockpile.",
        abbrText: "[[_Attacks]]: Drop [[Spikes]]",
      ),
    ],
    durability: 2,
    source: Source.drop,
  ),
  "Spike Gun": Weapon(
    name: "Spike Gun",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    mods: [
      Mod(
        text:"When attacking with this weapon and a [[Token.wrench]] is rolled, the first item on all damage cards is: TIRES (limit 1)",
        abbrText: "[[_Attacks]]: [[Token.wrench]] = TIRES (limit 1)",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.green, 1),
        Dice(Die.blue, 2),
      ],
    ),
    attributes: [
      Attribute.internalDamageTiresFirst,
    ],
    durability: 2,
    source: Source.uncleAl,
  ),
  "Splitter": Component(
    name: "Splitter",
    cost: 1,
    type: ComponentType.accessory,
    restrictions: [
      Restriction.frontOnly,
    ],
    mods: [
      Mod(
        text: "Take 3 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]] [[Token.ace]] [[Token.ace]]",
      ),
    ],
    attributes: [
      Attribute.takeAce3,
    ],
    durability: 1,
    source: Source.set3,
  ),
  "Spoiler": Component(
    name: "Spoiler",
    cost: 1,
    type: ComponentType.accessory,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "Take 1 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]]",
      ),
      Mod(
        text:"When you would lose 1 [[Token.control]] as the result of a driving roll, you may instead spend 3 [[Token.ace]]. You may repeat this.",
        abbrText: "[[_Driving Roll]]: Pay [[Token.control]] OR [[Token.ace]] [[Token.ace]] [[Token.ace]]",
      ),
    ],
    attributes: [
      Attribute.takeAce,
    ],
    durability: 2,
    source: Source.set3,
  ),
  "Stability Controller": Component(
    name: "Stability Controller",
    cost: 1,
    asterisk: true,
    type: ComponentType.upgrade,
    mods: [
      Mod(
        text: "*You may spend 1 additional crew point (CP) when constructing your car.",
        abbrText: "[[_Construction]]: +1 CP",
      ),
    ],
    attributes: [
      Attribute.awardsCP,
    ],
    source: Source.crew,
  ),
  "Standard Ceramic Plate": Component(
    name: "Standard Ceramic Plate",
    cost: 2,
    type: ComponentType.structure,
    durability: 4,
    source: Source.set2,
  ),
  "Standard Composite Plate": Component(
    name: "Standard Composite Plate",
    cost: 3,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.green:1]] and [[Die.blue:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.green:1]] [[Die.blue:1]]",
      ),
    ],
    durability: 2,
    source: Source.set4,
  ),
  "Standard Machine Gun": Weapon(
    name: "Standard Machine Gun",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.blue, 3),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.armory,
  ),
  "Standard Machine Gun Incendiary Rounds": Weapon(
    name: "Standard Machine Gun Incendiary Rounds",
    cost: 4,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    mods: [
      Mod(
        text: "When attacking with this, add [[DamageType.tires:1]].",
        abbrText: "[[_Attacks]]: +[[DamageType.tires:1]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
        Dice(Die.blue, 1),
      ],
    ),
    wrenchResult: DamageType.fire,
    attributes: [
      Attribute.attackIncendiaryTires1,
    ],
    durability: 2,
    source: Source.set2,
  ),
  "Standard Machine Gun Tracer Rounds": Weapon(
    name: "Standard Machine Gun Tracer Rounds",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    mods: [
      Mod(text: "Take 1 [[Token.ace]] during the [[Take Control]] step."),
      Mod(
        text:"You may pay [[Token.ace]] to re-roll dice when attacking with this. Re-roll 1 die for each [[Token.ace]] spent.",
        abbrText: "[[_Attacks]]: [[Token.ace]] = re-roll",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.blue, 3),
        Dice(Die.white, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    attributes: [
      Attribute.takeAce,
      Attribute.attackAceForReroll,
    ],
    durability: 2,
    source: Source.uncleAl,
  ),
  "Standard Recoilless Rifle": Weapon(
    name: "Standard Recoilless Rifle",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 2),
        Dice(Die.yellow, 1),
      ],
    ),
    durability: 2,
    source: Source.core,
  ),
  "Standard Recoilless Rifle Explosive Rounds": Weapon(
    name: "Standard Recoilless Rifle Explosive Rounds",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.blue, 3),
      ],
    ),
    wrenchResult: DamageType.explosion,
    durability: 2,
    source: Source.uncleAl,
  ),
  "Standard Rocket": Weapon(
    name: "Standard Rocket",
    cost: 3,
    asterisk: true,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
    ],
    mods: [
      Mod(text: "*Take and equip a second copy of this for free.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
        Dice(Die.blue, 1),
      ],
    ),
    attributes: [
      Attribute.paired,
    ],
    wrenchResult: DamageType.explosion,
    durability: 1,
    source: Source.core,
  ),
  "Standard Steel Plate": Component(
    name: "Standard Steel Plate",
    cost: 2,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.yellow:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.yellow:1]]",
      ),
    ],
    durability: 2,
    source: Source.core,
  ),
  "Steady-Aim Gimbal": Component(
    name: "Steady-Aim Gimbal",
    cost: 1,
    type: ComponentType.gear,
    mods: [
      Mod(
        text: "You may re-roll 2 dice when attacking with a sidearm.",
        abbrText: "[[_Sidearm Attacks]]: +2 re-rolls",
      ),
    ],
    attributes: [
      Attribute.attackSidearmRerolls2,
    ],
    source: Source.uncleAl,
  ),
  "Stinger": Weapon(
    name: "Stinger",
    cost: 2,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 2),
        Dice(Die.black, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.set4,
  ),
  "Strengthened Undercarriage": Component(
    name: "Strengthened Undercarriage",
    cost: 2,
    type: ComponentType.upgrade,
    subtype: ComponentSubtype.frame,
    mods: [
      Mod(
        text: "Take 1 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]]",
      ),
      Mod(
        text: "Once per collision, you may pay 2 [[Token.ace]] instead of losing 1 [[Token.control]].",
        abbrText: "[[_Collisions]]: Pay [[Token.control]] OR [[Token.ace]] [[Token.ace]]",
      ),
    ],
    attributes: [
      Attribute.takeAce,
    ],
    source: Source.core,
  ),
  "Stovepipe": Weapon(
    name: "Stovepipe",
    cost: 4,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    damageDice: DamageDice(
      basicDamage: 3,
      dice: [
        Dice(Die.red, 2),
      ],
    ),
    durability: 2,
    source: Source.set3,
  ),
  "Super Heavy Ceramic Plate": Component(
    name: "Super Heavy Ceramic Plate",
    cost: 4,
    type: ComponentType.structure,
    durability: 8,
    source: Source.set3,
  ),
  "Super Heavy Steel Plate": Component(
    name: "Super Heavy Steel Plate",
    cost: 4,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.yellow:1]] and [[Die.green:2]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.yellow:1]] [[Die.green:2]]",
      ),
    ],
    durability: 4,
    source: Source.set4,
  ),
  "Superbooster": Component(
    name: "Superbooster",
    cost: 1,
    type: ComponentType.accessory,
    restrictions: [
      Restriction.frontOnly,
    ],
    mods: [
      Mod(
        text: "Take 1 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]]",
      ),
      Mod(
        text: "Ignore power plant damage from hard accelerating.",
        abbrText: "[[_Hard Accelerating]]: No [[damage]]",
      ),
    ],
    attributes: [
      Attribute.takeAce,
    ],
    durability: 2,
    source: Source.core,
  ),
  "Supercooled Laser": Weapon(
    name: "Supercooled Laser",
    cost: 6,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 3),
        Dice(Die.blue, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.fire,
    durability: 1,
    source: Source.set2,
  ),
  "Supplemental Power Cell": Component(
    name: "Supplemental Power Cell",
    cost: 2,
    type: ComponentType.accessory,
    mods: [
      Mod(
        text: "Once per driving roll, you may convert [[DamageType.tires:2]] to a [[Token.shield]].",
        abbrText: "[[_Driving Roll]]: [[DamageType.tires:2]] = [[Token.shield]]",
      ),
      Mod(
        text: "You may take [[DamageType.tires:2]] to increase your power plant by 1. If you do, flip this face-down.",
        abbrText: "+[[DamageType.tires:2]] = +1 Power Plant (once)",
      ),
    ],
    attributes: [
      Attribute.expendable,
    ],
    durability: 1,
    source: Source.uncleAl,
  ),
  "Taco!": Component(
    name: "Taco!",
    cost: 1,
    type: ComponentType.gear,
    mods: [
      Mod(
        text: "As long as both of your crew members are still alive, you may move 1 [[Token.damage]] from one crew member to the other at the start of the round.",
        abbrText: "[[__Check Speed:]]: Crew ← [[damage]] → Crew",
      ),
    ],
    source: Source.uncleAl,
  ),
  "Targeting Computer": Component(
    name: "Targeting Computer",
    cost: 1,
    type: ComponentType.accessory,
    mods: [
      Mod(text: "This does not affect sidearms.", type: ModType.note),
      Mod(
        text: "You may add [[Die.blue:1]] to one of your attacks each round.",
        abbrText: "[[_One Attack/Round]]: +[[Die.blue:1]]",
      ),
    ],
    durability: 1,
    source: Source.core,
  ),
  "The Anvil": Weapon(
    name: "The Anvil",
    cost: 7,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    restrictions: [
      Restriction.frontBack,
    ],
    damageDice: DamageDice(
      basicDamage: 4,
      dice: [
        Dice(Die.yellow, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    durability: 2,
    source: Source.set1,
  ),
  "The Slab": Component(
    name: "The Slab",
    cost: 3,
    type: ComponentType.structure,
    restrictions: [
      Restriction.backOnly,
    ],
    mods: [
      Mod(text: "Take 1 [[Slab]] token.", type: ModType.note),
      Mod(
        text: "You may drop your slab token behind your car and flip this face-down after any movement point.",
        abbrText: "[[__Movement]]: Drop slab",
      ),
    ],
    attributes: [
      Attribute.expendable,
    ],
    durability: 5,
    source: Source.drop,
  ),
  "Thermite Grenades": Weapon(
    name: "Thermite Grenades",
    cost: 1,
    type: ComponentType.sidearm,
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 2),
        Dice(Die.yellow, 1),
        Dice(Die.black, 1),
      ],
    ),
    restrictions: [
      Restriction.range2,
      Restriction.sideArcFire,
    ],
    wrenchResult: DamageType.fire,
    source: Source.crew,
  ),
  "Thresher": Weapon(
    name: "Thresher",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
        Dice(Die.blue, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.core,
  ),
  "Thundercat Battery": Component(
    name: "Thundercat Battery",
    cost: 2,
    type: ComponentType.accessory,
    restrictions: [
      Restriction.frontOnly,
    ],
    mods: [
      Mod(
        text:"Once during your movement phase, you may spend 1 [[Token.control]] and 1 [[Token.ace]] to drive straight 1 car length.",
        abbrText: "[[__Movement]]: [[Token.control]] + [[Token.ace]] = 1 car length",
      ),
    ],
    durability: 1,
    source: Source.set2,
  ),
  "Thundergun": Weapon(
    name: "Thundergun",
    cost: 6,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shock,
    restrictions: [
      Restriction.frontBack,
    ],
    mods: [
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench]] [[Token.wrench]] = [[Token.damage]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 2),
        Dice(Die.green, 2),
        Dice(Die.blue, 1),
      ],
    ),
    attributes: [
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.basic,
    durability: 3,
    source: Source.set4,
  ),
  "Titanium Laminate": Component(
    name: "Titanium Laminate",
    cost: 3,
    type: ComponentType.structure,
    mods: [
      Mod(
        text: "When attacked on this side, add [[Die.black:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.black:1]",
      ),
    ],
    durability: 5,
    source: Source.set3,
  ),
  "Turreted Arc Rifle": Weapon(
    name: "Turreted Arc Rifle",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shock,
    restrictions: [
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
      Mod(
        text: "If you roll 2 [[Token.wrench]], this takes 1 [[Token.damage]] after the attack is resolved.",
        abbrText: "[[_Attacks]]: [[Token.wrench]] [[Token.wrench]] = [[Token.damage]]",
      ),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.green, 1),
      ],
    ),
    attributes: [
      Attribute.turret,
    ],
    wrenchResult: DamageType.basic,
    durability: 4,
    source: Source.linked,
  ),
  "Turreted Flamethrower": Weapon(
    name: "Turreted Flamethrower",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.fire,
    restrictions: [
      Restriction.range2,
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 2),
        Dice(Die.blue, 1),
        Dice(Die.white, 1),
      ],
    ),
    attributes: [
      Attribute.turret,
    ],
    wrenchResult: DamageType.fire,
    durability: 3,
    source: Source.armory,
  ),
  "Turreted Heavy Rocket": Weapon(
    name: "Turreted Heavy Rocket",
    cost: 8,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 3),
        Dice(Die.blue, 1),
        Dice(Die.black, 1),
      ],
    ),
    attributes: [
      Attribute.turret,
      Attribute.requiresDiv6,
    ],
    wrenchResult: DamageType.explosion,
    durability: 1,
    source: Source.uncleAl,
  ),
  "Turreted Light Rocket": Weapon(
    name: "Turreted Light Rocket",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.blue, 2),
        Dice(Die.white, 1),
      ],
    ),
    attributes: [
      Attribute.turret,
    ],
    wrenchResult: DamageType.explosion,
    durability: 2,
    source: Source.linked,
  ),
  "Turreted Machine Gun": Weapon(
    name: "Turreted Machine Gun",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 3),
      ],
    ),
    attributes: [
      Attribute.turret,
    ],
    wrenchResult: DamageType.tires,
    durability: 4,
    source: Source.armory,
  ),
  "Turreted Micro-Missile": Weapon(
    name: "Turreted Micro-Missile",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.blast,
    restrictions: [
      Restriction.oneShot,
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.black, 2),
      ],
    ),
    attributes: [
      Attribute.turret,
    ],
    wrenchResult: DamageType.explosion,
    durability: 2,
    source: Source.uncleAl,
  ),
  "Turreted Particle Beam": Weapon(
    name: "Turreted Particle Beam",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    restrictions: [
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
      ],
    ),
    attributes: [
      Attribute.turret,
    ],
    wrenchResult: DamageType.fire,
    durability: 3,
    source: Source.linked,
  ),
  "Turreted Recoilless Rifle": Weapon(
    name: "Turreted Recoilless Rifle",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.slug,
    restrictions: [
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.blue, 1),
      ],
    ),
    attributes: [
      Attribute.turret,
    ],
    durability: 4,
    source: Source.armory,
  ),
  "Turreted Shotgun": Weapon(
    name: "Turreted Shotgun",
    cost: 3,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    restrictions: [
      Restriction.range2,
      Restriction.exclusive,
    ],
    mods: [
      Mod(text: "Place in your crew area. This is considered equipped to all firing arcs.", type: ModType.note),
    ],
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 2),
        Dice(Die.blue, 1),
        Dice(Die.white, 1),
      ],
    ),
    attributes: [
      Attribute.turret,
    ],
    durability: 3,
    source: Source.linked,
  ),
  "Twin Laser": Weapon(
    name: "Twin Laser",
    cost: 5,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.laser,
    mods: [
      Mod(
        text: "The defender gets 2 fewer re-rolls for range when you attack with this weapon.",
        abbrText: "[[_Attacks]]: -2 range re-rolls",
      ),
    ],
    damageDice: DamageDice(
      basicDamage: 1,
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 2),
        Dice(Die.blue, 2),
      ],
    ),
    wrenchResult: DamageType.fire,
    durability: 1,
    source: Source.uncleAl,
  ),
  "Vandal": Component(
    name: "Vandal",
    cost: 3,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "Add [[Die.blue:1]] to each attack made by your crew.",
        abbrText: "[[_Crew Attacks]]: +[[Die.blue:1]]",
      ),
    ],
    attributes: [
      Attribute.attackCrewBlue1,
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Veteran Driver": Component(
    name: "Veteran",
    cost: 4,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "Take 2 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]] [[Token.ace]]",
      ),
      Mod(
        text: "Each time you pay 1 [[Token.ace]] for a defense re-roll, you get 1 additional re-roll.",
        abbrText: "[[_Defense]]: [[Token.ace]] = 2 re-rolls",
      ),
    ],
    attributes: [
      Attribute.takeAce2,
      Attribute.attackAceForReroll,
    ],
    durability: 3,
    source: Source.core,
  ),
  "Veteran Gunner": Component(
    name: "Veteran",
    cost: 4,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "When this gunner attacks, add [[Die.yellow:1]] and [[Die.blue:1]].",
        abbrText: "[[_Attacks]]: +[[Die.yellow:1]] [[Die.blue:1]]",
      ),
    ],
    attributes: [
      Attribute.attackGunnerYellow1Blue1,
    ],
    durability: 3,
    source: Source.core,
  ),
  "Vulcan": Weapon(
    name: "Vulcan",
    cost: 4,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.red, 1),
        Dice(Die.yellow, 1),
        Dice(Die.green, 2),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.armory,
  ),
  "Wasp": Weapon(
    name: "Wasp",
    cost: 1,
    type: ComponentType.weapon,
    subtype: ComponentSubtype.shred,
    damageDice: DamageDice(
      dice: [
        Dice(Die.yellow, 1),
        Dice(Die.black, 1),
      ],
    ),
    wrenchResult: DamageType.tires,
    durability: 2,
    source: Source.set4,
  ),
  "Wheel Guards": Component(
    name: "Wheel Guards",
    cost: 1,
    type: ComponentType.upgrade,
    mods: [
      Mod(
        text: "Take 2 [[Token.ace]] during the [[Take Control]] step.",
        abbrText: "[[__Take Control]]: +[[Token.ace]] [[Token.ace]]",
      ),
      Mod(
        text: "When you are attacked with a [[Shred]] weapon, add [[Die.yellow:1]] to your defense roll.",
        abbrText: "[[_Defense]]: +[[Die.yellow:1]] vs. [[Shred]]",
      ),
    ],
    attributes: [
      Attribute.takeAce2,
    ],
    source: Source.set4,
  ),
  "Wheel Hubs": Component(
    name: "Wheel Hubs",
    cost: 2,
    type: ComponentType.upgrade,
    mods: [
      Mod(
        text: "When you take tire damage, apply it to this card first.",
        abbrText: "Takes [[DamageType.tires]] first",
      ),
    ],
    attributes: [
      Attribute.canAbsorbTireDamage,
    ],
    durability: 2,
    source: Source.set1,
  ),
  "Whiplash": Component(
    name: "Whiplash",
    cost: 1,
    type: ComponentType.crew,
    subtype: ComponentSubtype.gunner,
    mods: [
      Mod(
        text: "This gunner may attack with the [[Hand Cannon]] from any firing arc.",
        abbrText: "[[_Attacks]]: [[Hand Cannon]], any arc",
      ),
    ],
    attributes: [
      Attribute.attackGunnerHcAnyArc,
    ],
    durability: 3,
    source: Source.crew,
  ),
  "Wingnut": Component(
    name: "Wingnut",
    cost: 0,
    type: ComponentType.crew,
    subtype: ComponentSubtype.driver,
    mods: [
      Mod(
        text: "When making a maneuver, add [[Die.blue:1]] to your driving roll.",
        abbrText: "[[_Maneuvers]]: +[[Die.blue:1]]",
      ),
      Mod(
        text: "Add [[Die.yellow:1]] when this driver attacks.",
        abbrText: "[[_Attacks]]: +[[Die.yellow:1]]",
      ),
    ],
    attributes: [
      Attribute.attackDriverYellow11,
      Attribute.maneuverBlue1,
    ],
    durability: 3,
    source: Source.crew,
  ),
};

extension ListCompX on Iterable<Component> {
  Component? get driver => firstWhereOrNull((value) => value.type == ComponentType.crew && value.subtype == ComponentSubtype.driver);
  Component? get gunner => firstWhereOrNull((value) => value.type == ComponentType.crew && value.subtype == ComponentSubtype.gunner);

  List<Component> get drivers =>
      List<Component>.unmodifiable(where((value) => value.type == ComponentType.crew && value.subtype == ComponentSubtype.driver));

  List<Component> get gunners =>
      List<Component>.unmodifiable(where((value) => value.type == ComponentType.crew && value.subtype == ComponentSubtype.gunner));

  List<Component> get sidearms =>
      List<Component>.unmodifiable(where((value) => value.type == ComponentType.sidearm));

  List<Component> get gear =>
      List<Component>.unmodifiable(where((value) => value.type == ComponentType.gear));

  List<Component> get weapons =>
      List<Component>.unmodifiable(where((value) => value.type == ComponentType.weapon));

  List<Component> get accessories =>
      List<Component>.unmodifiable(where((value) => value.type == ComponentType.accessory));

  List<Component> get upgrades =>
      List<Component>.unmodifiable(where((value) => value.type == ComponentType.upgrade));

  List<Component> get structure =>
      List<Component>.unmodifiable(where((value) => value.type == ComponentType.structure));

  List<Component> getCompByAttr(Attribute attr) =>
      List<Component>.unmodifiable(where((value) => value.attributes.contains(attr)));
}
