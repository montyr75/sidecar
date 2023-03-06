import '../models/car_chassis.dart';
import '../models/enums.dart';
import '../models/vehicle.dart';

const Map<ChassisType, CarChassis> vg = {
  ChassisType.apollo: CarChassis(
    type: ChassisType.apollo,
    description:
        "Apollo is tough and very effective in a crowd, where its fire weapons and the crew's grenades can wreak the most havoc.\n\nThe long wheelbase means it isn't the easiest car to drive, so most Apollo drivers cruise around the perimeter of the arena until there is an ideal opportunity to dive into the mix.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Apollo (Div. 4)",
        chassis: ChassisType.apollo,
        division: 4,
        locs: {
          Location.crew: [
            "Rookie Driver",
            "Pyro",
            "Hand Cannon",
            "Paint Grenades",
            "Thermite Grenades",
          ],
          Location.front: [
            "Peppermill",
            "Peppermill",
            "Light Ceramic Plate",
          ],
          Location.back: [
            "Light Ceramic Plate",
          ],
          Location.left: [
            "Javelin",
            "Flamethrower",
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Javelin",
            "Flamethrower",
            "Light Ceramic Plate",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Apollo (Div. 8)",
        chassis: ChassisType.apollo,
        division: 8,
        locs: {
          Location.crew: [
            "Rhino",
            "Vandal",
            "Hand Cannon",
            "Paint Grenades",
            "Thermite Grenades",
            "First-Aid Kit",
          ],
          Location.front: [
            "Linked Shotguns",
            "Linked Shotguns",
            "Carbon Laminate",
          ],
          Location.back: [
            "Autopilot",
            "Carbon Laminate",
          ],
          Location.left: [
            "Fire Lance",
            "Jackhammer",
            "Heavy Composite Plate",
          ],
          Location.right: [
            "Fire Lance",
            "Jackhammer",
            "Heavy Composite Plate",
          ],
          Location.upgrade: [
            "Reinforced Weapon Brackets",
          ],
        },
      ),
    },
  ),
  ChassisType.aristocrat: CarChassis(
    type: ChassisType.aristocrat,
    description:
        "The Aristocrat is almost regal in design, despite the fact that it is bristling with a wide array of weapons.\n\nIts light defensive setup means it won't last long in a firefight if it doesn't get the upper hand quickly.\n\nIt is a rolling hornet's nest, encircling opponents with fire mines before ripping them to shreds.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Aristocrat (Div. 4)",
        chassis: ChassisType.aristocrat,
        division: 4,
        locs: {
          Location.crew: [
            "Scorpion",
            "Hacker",
            "Hand Cannon",
          ],
          Location.front: [
            "Heavy Machine Gun",
            "Heavy Machine Gun",
            "Advanced Firing Interface",
          ],
          Location.back: [
            "Slingshot",
            "Slingshot",
            "Fire Mine Dropper",
          ],
          Location.left: [
            "Wasp",
          ],
          Location.right: [
            "Wasp",
          ],
          Location.turret: [
            "Turreted Recoilless Rifle",
          ],
          Location.upgrade: [
            "Wheel Guards",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Aristocrat (Div. 8)",
        chassis: ChassisType.aristocrat,
        division: 8,
        locs: {
          Location.crew: [
            "Bandit",
            "Vandal",
            "Hand Cannon",
            "First-Aid Kit",
          ],
          Location.front: [
            "Linked Jackhammers",
            "Linked Flamethrowers",
            "Advanced Firing Interface",
          ],
          Location.back: [
            "Standard Recoilless Rifle",
            "Standard Recoilless Rifle",
            "Fire Mine Dropper",
          ],
          Location.left: [
            "Longbow",
          ],
          Location.right: [
            "Longbow",
          ],
          Location.turret: [
            "Turreted Recoilless Rifle",
          ],
          Location.upgrade: [
            "EM Distortion Field",
            "Wheel Guards",
          ],
        },
      ),
    },
  ),
  ChassisType.avalanche: CarChassis(
    type: ChassisType.avalanche,
    description:
        "The low-slung Avalanche is essentially a high-speed tank with a weapon loadout designed to maximize tire damage.\n\nHeavy armor, tire protection, and a roll bar help the crew shrug off most attacks as they patiently wait to bash through any opponents left limping around the arena.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Avalanche (Div. 4)",
        chassis: ChassisType.avalanche,
        division: 4,
        locs: {
          Location.crew: [
            "Medusa",
            "Hacker",
            "Hand Cannon",
          ],
          Location.front: [
            "Vulcan",
          ],
          Location.back: [
            "Light Machine Gun",
          ],
          Location.left: [
            "Vulcan",
          ],
          Location.right: [
            "Light Machine Gun",
          ],
          Location.upgrade: [
            "Reactive Defense System",
            "Wheel Hubs",
            "Roll Bar",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Avalanche (Div. 8)",
        chassis: ChassisType.avalanche,
        division: 8,
        locs: {
          Location.crew: [
            "Medusa",
            "Hyperion",
            "Hand Cannon",
          ],
          Location.front: [
            "Linked Jackhammers",
            "Heavy Ceramic Plate",
          ],
          Location.back: [
            "Linked Jackhammers",
            "Magnetic Dampers",
            "Heavy Ceramic Plate",
          ],
          Location.left: [
            "Heavy Machine Gun",
            "Standard Ceramic Plate",
          ],
          Location.right: [
            "Heavy Machine Gun",
            "Standard Ceramic Plate",
          ],
          Location.upgrade: [
            "Wheel Hubs",
            "Roll Bar",
          ],
        },
      ),
    },
  ),
  ChassisType.boomerang: CarChassis(
    type: ChassisType.boomerang,
    description:
        "The Boomerang's distinct profile is immediately recognizable.\n\nThe large rear tires seem like an obvious weak spot, but experienced duellists know to stay in the rear arc or risk an attack, even from great range.\n\nBoomerang is a favorite of many gunners as long as there is a talented driver at the controls.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Boomerang (Div. 4)",
        chassis: ChassisType.boomerang,
        division: 4,
        locs: {
          Location.crew: [
            "Wingnut",
            "Veteran Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Electrolaser",
            "Electrolaser",
            "Standard Steel Plate",
          ],
          Location.back: [
            "Regenerative Brakes",
          ],
          Location.left: [
            "Linked Shotguns",
            "Wasp",
            "Light Steel Plate",
          ],
          Location.right: [
            "Linked Shotguns",
            "Wasp",
            "Light Steel Plate",
          ],
          Location.upgrade: [
            "Airless Tires",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Boomerang (Div. 8)",
        chassis: ChassisType.boomerang,
        division: 8,
        locs: {
          Location.crew: [
            "Possum",
            "Hyperion",
            "Hand Cannon",
            "Driving Boots",
          ],
          Location.front: [
            "Rapid-Cycle Laser",
            "Rapid-Cycle Laser",
            "Heavy Plastic Cladding",
          ],
          Location.back: [
            "Regenerative Brakes",
            "Fire Extinguisher",
          ],
          Location.left: [
            "Linked Standard Machine Guns",
            "Heavy Recoilless Rifle",
            "Light Plastic Cladding",
          ],
          Location.right: [
            "Linked Standard Machine Guns",
            "Heavy Recoilless Rifle",
            "Light Plastic Cladding",
          ],
          Location.upgrade: [
            "Airless Tires",
          ],
        },
      ),
    },
  ),
  ChassisType.brimstone: CarChassis(
    type: ChassisType.brimstone,
    description:
        "Preferred by maniacs and daredevils, Brimstone is a scrapyard beast that pollutes the arena with oil slicks.\n\nDespite its ramshackle appearance, this raucous car is tough and can deal huge damage.\n\nThe unprotected tires seem to be an obvious weak spot, but good luck getting anywhere near them.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Brimstone (Div. 4)",
        chassis: ChassisType.brimstone,
        division: 4,
        locs: {
          Location.crew: [
            "Rookie Driver",
            "Hacker",
            "Hand Cannon",
            "Thermite Grenades",
            "Flak Jacket",
            "Driving Boots",
          ],
          Location.front: [
            "Gauss Cannon",
          ],
          Location.back: [
            "Gauss Cannon",
            "Firecracker",
            "Oil Jets",
          ],
          Location.left: [
            "Slingshot",
            "Light Steel Plate",
          ],
          Location.right: [
            "Slingshot",
            "Light Steel Plate",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Brimstone (Div. 8)",
        chassis: ChassisType.brimstone,
        division: 8,
        locs: {
          Location.crew: [
            "Possum",
            "Max",
            "Hand Cannon",
            "Flak Jacket",
          ],
          Location.front: [
            "Railgun",
            "Rugged Suspension",
          ],
          Location.back: [
            "Railgun",
            "Firecracker",
            "Firecracker",
          ],
          Location.left: [
            "Gator",
            "Oil Jets",
            "Light Steel Plate",
          ],
          Location.right: [
            "Gator",
            "Oil Jets",
            "Light Steel Plate",
          ],
        },
      ),
    },
  ),
  ChassisType.butcher: CarChassis(
    type: ChassisType.butcher,
    description:
        "Butcher is a savage monster sitting atop a simple tractor, deadly and durable.\n\nIt is a vehicle for bombastic crew members that revel in total chaos.\n\nThe cabover design leaves the front of the vehicle somewhat exposed, but every other angle promises a grim death for opponents.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Butcher (Div. 4)",
        chassis: ChassisType.butcher,
        division: 4,
        locs: {
          Location.crew: [
            "Scorpion",
            "Hacker",
            "Hand Cannon",
          ],
          Location.front: [
            "Laser-Guided Light Rocket",
            "Laser-Guided Light Rocket",
          ],
          Location.back: [
            "Electrolaser",
          ],
          Location.left: [
            "Heavy Recoilless Rifle",
            "Slingshot",
          ],
          Location.right: [
            "Heavy Recoilless Rifle",
            "Slingshot",
          ],
          Location.upgrade: [
            "Cadmium Alloy Fasteners",
            "Reinforced Weapon Brackets",
            "Wheel Guards",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Butcher (Div. 8)",
        chassis: ChassisType.butcher,
        division: 8,
        locs: {
          Location.crew: [
            "Amateur Driver",
            "Legend Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Standard Rocket",
            "Standard Rocket",
          ],
          Location.back: [
            "Supercooled Laser",
            "Rugged Suspension",
            "Light Steel Plate",
          ],
          Location.left: [
            "Stovepipe",
            "Jackhammer",
            "Light Steel Plate",
          ],
          Location.right: [
            "Stovepipe",
            "Jackhammer",
            "Light Steel Plate",
          ],
          Location.upgrade: [
            "Cadmium Alloy Fasteners",
            "Reinforced Weapon Brackets",
            "Wheel Guards",
          ],
        },
      ),
    },
  ),
  ChassisType.conestoga: CarChassis(
    type: ChassisType.conestoga,
    description:
        "The Conestoga is very well equipped, but requires a talented crew due to the lack of driving aids and asymmetrical loadout.\n\nThe handling isn't great, but as long as the crew can keep control of the car, the Conestoga is dangerous from all angles and performs well in any duelling format.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Conestoga (Div. 4)",
        chassis: ChassisType.conestoga,
        division: 4,
        locs: {
          Location.crew: [
            "Wingnut",
            "Vandal",
            "Hand Cannon",
            "Killstreak",
          ],
          Location.front: [
            "Thresher",
            "Ramplate",
          ],
          Location.back: [
            "Flamethrower",
            "Sharkfin Aero Package",
          ],
          Location.left: [
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Wasp",
            "Light Ceramic Plate",
          ],
          Location.upgrade: [
            "Wheel Guards",
            "Roll Bar",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Conestoga (Div. 8)",
        chassis: ChassisType.conestoga,
        division: 8,
        locs: {
          Location.crew: [
            "Rhino",
            "Fang",
            "Hand Cannon",
          ],
          Location.front: [
            "Minigun",
            "Ramplate",
          ],
          Location.back: [
            "Linked Flamethrowers",
            "Sharkfin Aero Package",
            "Heavy Ceramic Plate",
          ],
          Location.left: [
            "Heavy Ceramic Plate",
          ],
          Location.right: [
            "Longbow",
            "Heavy Ceramic Plate",
          ],
          Location.upgrade: [
            "Safety Cage",
            "Wheel Guards",
          ],
        },
      ),
    },
  ),
  ChassisType.dragon: CarChassis(
    type: ChassisType.dragon,
    description:
        "The Dragon is a fire-breathing beast that has proven to be a reliable platform for many different styles of arena combat.\n\nIts bulky frame allows for a variety of structural upgrades, and the heavy forward-facing weapon mounts mean that anyone unfortunate enough to be caught in front of a Dragon is unlikely to survive for long.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Dragon (Div. 4)",
        chassis: ChassisType.dragon,
        division: 4,
        locs: {
          Location.crew: [
            "Amateur Driver",
            "Pyro",
            "Hand Cannon",
          ],
          Location.front: [
            "Stinger",
            "Stinger",
          ],
          Location.back: [
            "Light Incendiary Rocket",
            "Light Incendiary Rocket",
            "Advanced Firing Interface",
          ],
          Location.left: [
            "Fire Lance",
            "Light Rocket",
          ],
          Location.right: [
            "Fire Lance",
            "Light Rocket",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Dragon (Div. 8)",
        chassis: ChassisType.dragon,
        division: 8,
        locs: {
          Location.crew: [
            "Veteran Driver",
            "Monarch",
            "Hand Cannon",
          ],
          Location.front: [
            "Heat Saber",
            "Heat Saber",
            "Radar Detector",
            "Ramplate",
          ],
          Location.back: [
            "Firecracker",
            "Firecracker",
            "Oil Jets",
          ],
          Location.left: [
            "Light Machine Gun Incendiary Rounds",
            "Standard Rocket",
            "Light Steel Plate",
          ],
          Location.right: [
            "Light Machine Gun Incendiary Rounds",
            "Standard Rocket",
            "Light Steel Plate",
          ],
          Location.upgrade: [
            "Safety Cage",
          ],
        },
      ),
    },
  ),
  ChassisType.fuzion: CarChassis(
    type: ChassisType.fuzion,
    description:
        "Fuzion is quite maneuverable and outfitted with an autopilot system that keeps the driver focused while the gunner unleashes an assortment of rockets to send enemies careening out of control.\n\nWhile not heavily armored, it is sturdy enough to put up a good fight.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Fuzion (Div. 4)",
        chassis: ChassisType.fuzion,
        division: 4,
        locs: {
          Location.crew: [
            "Rhino",
            "Machete",
            "Hand Cannon",
          ],
          Location.front: [
            "Light Recoilless Rifle",
            "Autopilot",
          ],
          Location.back: [
            "Light Machine Gun",
            "Spoiler",
          ],
          Location.left: [
            "Vulcan",
            "Firecracker",
            "Light Steel Plate",
          ],
          Location.right: [
            "Vulcan",
            "Firecracker",
            "Light Steel Plate",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Fuzion (Div. 8)",
        chassis: ChassisType.fuzion,
        division: 8,
        locs: {
          Location.crew: [
            "Legend Driver",
            "Amateur Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Heavy Recoilless Rifle",
            "Heavy Recoilless Rifle",
            "Radar Jammer",
            "Autopilot",
          ],
          Location.back: [
            "Linked Standard Machine Guns",
            "Spoiler",
          ],
          Location.left: [
            "Thresher",
            "Firecracker",
            "Armor-Piercing Rocket",
            "Laser-Guided Light Rocket",
          ],
          Location.right: [
            "Thresher",
            "Firecracker",
            "Armor-Piercing Rocket",
            "Laser-Guided Light Rocket",
          ],
          Location.upgrade: [
            "Active Camouflage",
          ],
        },
      ),
    },
  ),
  ChassisType.goblin: CarChassis(
    type: ChassisType.goblin,
    description:
        "Originally a light-duty military vehicle, the stout Goblin is well armored and plays the long game, chipping away at an opponent until the time is right to go in for the kill.\n\nDespite the added armor weight, Goblin is easy to control and is a good all-round rig for any duellist.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Goblin (Div. 4)",
        chassis: ChassisType.goblin,
        division: 4,
        locs: {
          Location.crew: [
            "Rookie Driver",
            "Vandal",
            "Hand Cannon",
            "Assault Rifle",
          ],
          Location.front: [
            "Armor-Piercing Rocket",
            "Armor-Piercing Rocket",
            "Light Ceramic Plate",
          ],
          Location.back: [
            "Light Recoilless Rifle",
            "Light Recoilless Rifle",
            "Concussion Mine Dropper",
            "Light Ceramic Plate",
          ],
          Location.left: [
            "Linked Shotguns",
            "Advanced Firing Interface",
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Linked Shotguns",
            "Regenerative Brakes",
            "Light Ceramic Plate",
          ],
          Location.upgrade: [
            "Wheel Guards",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Goblin (Div. 8)",
        chassis: ChassisType.goblin,
        division: 8,
        locs: {
          Location.crew: [
            "Rhino",
            "Max",
            "Hand Cannon",
            "Assault Rifle",
          ],
          Location.front: [
            "Standard Rocket",
            "Standard Rocket",
            "Targeting Computer",
            "Standard Ceramic Plate",
          ],
          Location.back: [
            "Standard Recoilless Rifle Explosive Rounds",
            "Standard Recoilless Rifle Explosive Rounds",
            "Concussion Mine Dropper",
            "Standard Ceramic Plate",
          ],
          Location.left: [
            "Linked Disruptors",
            "Advanced Firing Interface",
            "Standard Ceramic Plate",
          ],
          Location.right: [
            "Linked Disruptors",
            "Regenerative Brakes",
            "Standard Ceramic Plate",
          ],
          Location.upgrade: [
            "Wheel Guards",
          ],
        },
      ),
    },
  ),
  ChassisType.hades: CarChassis(
    type: ChassisType.hades,
    description:
        "A solid choice for any duellist, Hades is capable of accelerating unexpectedly fast and outfitted with a wide variety of weapons.\n\nIt carries enough mounted equipment to compensate for its relatively light armor, and when manned by an experienced crew, Hades can be a complex and overwhelming offensive force.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Hades (Div. 4)",
        chassis: ChassisType.hades,
        division: 4,
        locs: {
          Location.crew: [
            "Rookie Driver",
            "Vandal",
            "Hand Cannon",
            "Bug Zapper",
          ],
          Location.front: [
            "Superbooster",
          ],
          Location.back: [
            "Stinger",
            "Stinger",
            "Concussion Mine Dropper",
          ],
          Location.left: [
            "Rapid-Cycle Laser",
          ],
          Location.right: [
            "Rapid-Cycle Laser",
          ],
          Location.upgrade: [
            "Cadmium Alloy Fasteners",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Hades (Div. 8)",
        chassis: ChassisType.hades,
        division: 8,
        locs: {
          Location.crew: [
            "Rockwolf",
            "Whiplash",
            "Hand Cannon",
            "Holographic Sight",
            "Driving Boots",
          ],
          Location.front: [
            "Advanced Firing Interface",
            "Superbooster",
          ],
          Location.back: [
            "Standard Machine Gun Incendiary Rounds",
            "Standard Machine Gun Incendiary Rounds",
            "Concussion Mine Dropper",
            "Fire Extinguisher",
          ],
          Location.left: [
            "Twin Laser",
            "Electrolaser",
            "Carbon Laminate",
          ],
          Location.right: [
            "Twin Laser",
            "Electrolaser",
            "Carbon Laminate",
          ],
          Location.upgrade: [
            "Wheel Hubs",
          ],
        },
      ),
    },
  ),
  ChassisType.hammer: CarChassis(
    type: ChassisType.hammer,
    description:
        "The Hammer has enough firepower to soften up opponents quite a bit before plowing through them for the finishing blow.\n\nIt trades heavy weapons for a thick outer hull, so it requires a patient crew to create an effective attack strategy.\n\nThe extra plating may hinder the handling a bit but a Hammer does not go down easily.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Hammer (Div. 4)",
        chassis: ChassisType.hammer,
        division: 4,
        locs: {
          Location.crew: [
            "Veteran Driver",
            "Rookie Gunner",
            "Hand Cannon",
            "Concussion Grenades",
          ],
          Location.front: [
            "Gauss Cannon",
          ],
          Location.back: [
            "Concussion Mine Dropper",
            "Standard Steel Plate",
          ],
          Location.left: [
            "Armored Machine Gun",
          ],
          Location.right: [
            "Armored Machine Gun",
          ],
          Location.upgrade: [
            "Wheel Hubs",
            "Punchbumper",
            "Stability Controller",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Hammer (Div. 8)",
        chassis: ChassisType.hammer,
        division: 8,
        locs: {
          Location.crew: [
            "Legend Driver",
            "Rookie Gunner",
            "Hand Cannon",
            "Concussion Grenades",
            "Steady-Aim Gimbal",
          ],
          Location.front: [
            "Railgun",
            "Ramplate",
          ],
          Location.back: [
            "Concussion Mine Dropper",
            "Rugged Suspension",
          ],
          Location.left: [
            "Jackhammer",
            "Super Heavy Steel Plate",
          ],
          Location.right: [
            "Jackhammer",
            "Super Heavy Steel Plate",
          ],
          Location.upgrade: [
            "Power Plant Shielding",
            "Punchbumper",
            "Wheel Hubs",
          ],
        },
      ),
    },
  ),
  ChassisType.hotshot: CarChassis(
    type: ChassisType.hotshot,
    description:
        "Hotshot is not particularly effective from long range, but once it closes the distance, it is equipped to slag even the toughest opponent.\n\nFavored by experienced duellists that aren't afraid to take a few knocks before incinerating everything in sight, combatants must either outgun a Hotshot...or outrun it.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Hotshot (Div. 4)",
        chassis: ChassisType.hotshot,
        division: 4,
        locs: {
          Location.crew: [
            "Amateur Driver",
            "Pyro",
            "Hand Cannon",
          ],
          Location.front: [
            "Standard Machine Gun",
            "Standard Machine Gun",
          ],
          Location.back: [
            "Flamethrower",
          ],
          Location.left: [
            "Fire Lance",
          ],
          Location.right: [
            "Fire Lance",
          ],
          Location.upgrade: [
            "Active Camouflage",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Hotshot (Div. 8)",
        chassis: ChassisType.hotshot,
        division: 8,
        locs: {
          Location.crew: [
            "Rockwolf",
            "Pyro",
            "Hand Cannon",
            "Flak Jacket",
          ],
          Location.front: [
            "Heat Saber",
            "Heat Saber",
            "Carbon Laminate",
          ],
          Location.back: [
            "Linked Flamethrowers",
            "Oil Jets",
          ],
          Location.left: [
            "Heavy Machine Gun Incendiary Rounds",
            "Carbon Laminate",
          ],
          Location.right: [
            "Heavy Machine Gun Incendiary Rounds",
            "Carbon Laminate",
          ],
        },
      ),
    },
  ),
  ChassisType.hydra: CarChassis(
    type: ChassisType.hydra,
    description:
        "The four tires hiding under Hydra's front fenders provide increased traction and improved airflow.\n\nThis, combined with the high-torque differential, make the car very easy to control at high speeds.\n\nThis control is necessary because Hydra is only moderately armed except for the giant cannon on the front, so positioning is crucial to keep opponents on the defensive.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Hydra (Div. 4)",
        chassis: ChassisType.hydra,
        division: 4,
        locs: {
          Location.crew: [
            "Mamba",
            "Grendel",
            "Hand Cannon",
          ],
          Location.front: [
            "Gator",
          ],
          Location.back: [
            "High-Torque Differential",
          ],
          Location.left: [
            "Standard Machine Gun",
            "Wasp",
          ],
          Location.right: [
            "Standard Machine Gun",
            "Wasp",
          ],
          Location.upgrade: [
            "Active Camouflage",
            "Bumper Spikes",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Hydra (Div. 8)",
        chassis: ChassisType.hydra,
        division: 8,
        locs: {
          Location.crew: [
            "Bandit",
            "Monarch",
            "Hand Cannon",
          ],
          Location.front: [
            "Dreadnaught",
            "Standard Recoilless Rifle Explosive Rounds",
            "Standard Recoilless Rifle Explosive Rounds",
            "Light Steel Plate",
          ],
          Location.back: [
            "Foam Nozzle",
            "High-Torque Differential",
          ],
          Location.left: [
            "Vulcan",
            "Light Steel Plate",
          ],
          Location.right: [
            "Vulcan",
            "Light Steel Plate",
          ],
          Location.upgrade: [
            "Reactive Defense System",
            "Bumper Spikes",
          ],
        },
      ),
    },
  ),
  ChassisType.jackal: CarChassis(
    type: ChassisType.jackal,
    description:
        "A Jackal driver must be at once skittish, clever, and resourceful.\n\nThe small unibody design of the car makes it a small target, but only the front end carries any substantial plating.\n\nAs a result, Jackal performs best by charging directly at an opponent, attacking, then darting away before it gets into too much trouble.\n\nThe solid tires allow for high getaway speeds even after taking significant damage.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Jackal (Div. 4)",
        chassis: ChassisType.jackal,
        division: 4,
        locs: {
          Location.crew: [
            "Medusa",
            "Rookie Gunner",
            "Hand Cannon",
            "Killstreak",
          ],
          Location.front: [
            "Electrolaser",
            "Electrolaser",
            "Light Steel Plate",
          ],
          Location.back: [
            "Wasp",
            "Wasp",
            "Sharkfin Aero Package",
          ],
          Location.left: [
            "Stinger",
            "Light Rocket",
            "Light Steel Plate",
          ],
          Location.right: [
            "Stinger",
            "Light Rocket",
            "Light Steel Plate",
          ],
          Location.upgrade: [
            "Airless Tires",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Jackal (Div. 8)",
        chassis: ChassisType.jackal,
        division: 8,
        locs: {
          Location.crew: [
            "Rockwolf",
            "Rookie Gunner",
            "Hand Cannon",
            "Killstreak",
            "Concussion Grenades",
            "Flak Jacket",
          ],
          Location.front: [
            "Standard Rocket",
            "Standard Rocket",
            "Standard Steel Plate",
          ],
          Location.back: [
            "Heavy Recoilless Rifle",
            "Heavy Recoilless Rifle",
            "Sharkfin Aero Package",
          ],
          Location.left: [
            "Rapid-Cycle Laser",
            "Spike Gun",
          ],
          Location.right: [
            "Rapid-Cycle Laser",
            "Spike Gun",
          ],
          Location.upgrade: [
            "Reactive Defense System",
            "Wheel Hubs",
            "Airless Tires",
          ],
        },
      ),
    },
  ),
  ChassisType.jackrabbit: CarChassis(
    type: ChassisType.jackrabbit,
    description:
        "Packing an enormous punch into a compact and well-armored package, the Jackrabbit is particularly resilient in most duelling formats.\n\nOriginally designed using scrap parts, the Jackrabbit carries more diverse weaponry than many larger vehicles, and it can be fitted with significantly heavier plating than other vehicles of comparable size.\n\nThe Jackrabbit is most effective in close-quarters combat.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Jackrabbit (Div. 4)",
        chassis: ChassisType.jackrabbit,
        division: 4,
        locs: {
          Location.crew: [
            "Possum",
            "Whiplash",
            "Hand Cannon",
            "Steady-Aim Gimbal",
          ],
          Location.front: [
            "Thresher",
            "Superbooster",
          ],
          Location.back: [
            "Spike Dropper",
            "Spoiler",
          ],
          Location.left: [
            "Heavy Machine Gun",
            "Brushcutter",
          ],
          Location.right: [
            "Heavy Machine Gun",
            "Brushcutter",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Jackrabbit (Div. 8)",
        chassis: ChassisType.jackrabbit,
        division: 8,
        locs: {
          Location.crew: [
            "Alpine",
            "Machete",
            "Hand Cannon",
            "First-Aid Kit",
          ],
          Location.front: [
            "Autocannon",
            "Magnetic Dampers",
            "Standard Ceramic Plate",
          ],
          Location.back: [
            "Spike Dropper",
            "The Slab",
          ],
          Location.left: [
            "Heavy Machine Gun Incendiary Rounds",
            "Brushcutter",
            "Standard Ceramic Plate",
          ],
          Location.right: [
            "Heavy Machine Gun Incendiary Rounds",
            "Brushcutter",
            "Standard Ceramic Plate",
          ],
          Location.upgrade: [
            "Safety Cage",
            "Wheel Guards",
          ],
        },
      ),
    },
  ),
  ChassisType.josephSpecial: CarChassis(
    type: ChassisType.josephSpecial,
    description:
        "Well equipped and designed to hit extremely hard, the Joseph Special is an offensive powerhouse that demands an experienced crew.\n\nOpponents are advised to steer clear of the front arc, but nowhere is safe — watch for rocket attacks and mines when chasing behind it.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Joseph Special (Div. 4)",
        chassis: ChassisType.josephSpecial,
        division: 4,
        locs: {
          Location.crew: [
            "Mamba",
            "Grendel",
            "Hand Cannon",
          ],
          Location.front: [
            "Heavy Recoilless Rifle",
          ],
          Location.back: [
            "Light Rocket",
            "Light Rocket",
            "Fire Mine Dropper",
            "Automatic Fire Suppressor",
          ],
          Location.left: [
            "Vulcan",
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Vulcan",
            "Light Ceramic Plate",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Joseph Special (Div. 8)",
        chassis: ChassisType.josephSpecial,
        division: 8,
        locs: {
          Location.crew: [
            "Veteran Driver",
            "Veteran Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "The Anvil",
            "Light Plastic Cladding",
          ],
          Location.back: [
            "Standard Rocket",
            "Standard Rocket",
            "Fire Mine Dropper",
            "Automatic Fire Suppressor",
          ],
          Location.left: [
            "Thresher",
            "Super Heavy Steel Plate",
          ],
          Location.right: [
            "Thresher",
            "Super Heavy Steel Plate",
          ],
        },
      ),
    },
  ),
  ChassisType.kodiak: CarChassis(
    type: ChassisType.kodiak,
    description:
        "Kodiak's concealed weapons remain a mystery until an opponent overcommits and Kodiak lets loose.\n\nThe thick plating, wheel protection, and smoke emitter make the lumbering Kodiak extremely difficult to destroy even before considering the massive machine gun, melee weapons, and whatever is hiding beneath the plating.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Kodiak (Div. 4)",
        chassis: ChassisType.kodiak,
        division: 4,
        locs: {
          Location.crew: [
            "Scorpion",
            "Whiplash",
            "Hand Cannon",
          ],
          Location.front: [
            "Vulcan",
            "Light Ceramic Plate",
          ],
          Location.back: [
            "Peppermill",
            "Smoke Emitter",
            "Light Ceramic Plate",
          ],
          Location.left: [
            "Brushcutter",
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Brushcutter",
            "Light Ceramic Plate",
          ],
          Location.upgrade: [
            "Simple Concealment System",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Kodiak (Div. 8)",
        chassis: ChassisType.kodiak,
        division: 8,
        locs: {
          Location.crew: [
            "Legend Driver",
            "Machete",
            "Hand Cannon",
          ],
          Location.front: [
            "Hellfire",
            "Radar Detector",
            "Light Ceramic Plate",
          ],
          Location.back: [
            "Linked Flamethrowers",
            "Light Ceramic Plate",
          ],
          Location.left: [
            "Bonesaw",
            "Smoke Emitter",
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Bonesaw",
            "Light Ceramic Plate",
          ],
          Location.upgrade: [
            "Complex Concealment System",
            "Wheel Hubs",
          ],
        },
      ),
    },
  ),
  ChassisType.pillbug: CarChassis(
    type: ChassisType.pillbug,
    description:
        "The Pillbug is a rolling fortress, heavily armored but only moderately armed.\n\nThe extra defense results in mediocre handling, but the heavy plating, wheel hubs, and shielded power plant keep it in the fight, rolling for much longer than most.\n\nThe crew has plenty of time to tear their opponents to bits.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Pillbug (Div. 4)",
        chassis: ChassisType.pillbug,
        division: 4,
        locs: {
          Location.crew: [
            "Medusa",
            "Rookie Gunner",
            "Hand Cannon",
            "Flak Jacket",
          ],
          Location.front: [
            "Stovepipe",
          ],
          Location.back: [
            "Firecracker",
            "Firecracker",
          ],
          Location.left: [
            "Stinger",
            "Standard Ceramic Plate",
          ],
          Location.right: [
            "Stinger",
            "Standard Ceramic Plate",
          ],
          Location.upgrade: [
            "Wheel Hubs",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Pillbug (Div. 8)",
        chassis: ChassisType.pillbug,
        division: 8,
        locs: {
          Location.crew: [
            "Alpine",
            "Amateur Gunner",
            "Hand Cannon",
            "Flak Jacket",
          ],
          Location.front: [
            "Hammerhead",
            "Titanium Laminate",
          ],
          Location.back: [
            "Firecracker",
            "Firecracker",
            "Titanium Laminate",
          ],
          Location.left: [
            "Linked Standard Machine Guns",
            "Titanium Laminate",
          ],
          Location.right: [
            "Linked Standard Machine Guns",
            "Titanium Laminate",
          ],
          Location.upgrade: [
            "Wheel Hubs",
            "Power Plant Shielding",
          ],
        },
      ),
    },
  ),
  ChassisType.pureEnergy: CarChassis(
    type: ChassisType.pureEnergy,
    description:
        "Outfitted with an array of high-energy laser weapons, improved handling, and a reactive defense system, Pure Energy prefers to snipe at foes from long range, rather than charging into the fender-to-fender combat.\n\nIt is nimble and fairly durable, but its lasers are easily destroyed by a persistent opponent.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Pure Energy (Div. 4)",
        chassis: ChassisType.pureEnergy,
        division: 4,
        locs: {
          Location.crew: [
            "Medusa",
            "Rookie Gunner",
            "Hand Cannon",
            "Assault Rifle",
          ],
          Location.front: [
            "Electrolaser",
            "Electrolaser",
          ],
          Location.left: [
            "Rapid-Cycle Laser",
            "Light Rocket",
          ],
          Location.right: [
            "Rapid-Cycle Laser",
            "Light Rocket",
          ],
          Location.upgrade: [
            "Reactive Defense System",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Pure Energy (Div. 8)",
        chassis: ChassisType.pureEnergy,
        division: 8,
        locs: {
          Location.crew: [
            "Legend Driver",
            "Whiplash",
            "Hand Cannon",
            "Holographic Sight",
            "Flak Jacket",
          ],
          Location.front: [
            "Supercooled Laser",
            "Supercooled Laser",
          ],
          Location.back: [
            "Advanced Firing Interface",
            "Spoiler",
          ],
          Location.left: [
            "Rapid-Cycle Laser",
            "Standard Rocket",
          ],
          Location.right: [
            "Rapid-Cycle Laser",
            "Standard Rocket",
          ],
          Location.upgrade: [
            "Reactive Defense System",
            "High-Density Radials",
            "Reinforced Weapon Brackets",
            "Stability Controller",
          ],
        },
      ),
    },
  ),
  ChassisType.redline: CarChassis(
    type: ChassisType.redline,
    description:
        "Lightly armored, but sprightly and fast, Redline is a tricky vehicle to master.\n\nThe front and back are quite dangerous, but the sides are somewhat exposed.\n\nRedline darts in and out of the fray, but it won't last long in close-quarter combat, as its armor was sacrificed in exchange for substantially improved handling.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Redline (Div. 4)",
        chassis: ChassisType.redline,
        division: 4,
        locs: {
          Location.crew: [
            "Mamba",
            "Hound",
            "Hand Cannon",
            "Assault Rifle",
            "Flak Jacket",
            "Driving Boots",
          ],
          Location.front: [
            "Linked Standard Machine Guns",
            "Firecracker",
            "Splitter",
          ],
          Location.back: [
            "Betatron",
            "Oil Jets",
            "Spoiler",
          ],
          Location.upgrade: [
            "High-Density Radials",
            "Chassis Brace",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Redline (Div. 8)",
        chassis: ChassisType.redline,
        division: 8,
        locs: {
          Location.crew: [
            "Veteran Driver",
            "Hound",
            "Hand Cannon",
            "Flak Jacket",
            "Driving Boots",
            "Driving Gloves",
            "First-Aid Kit",
          ],
          Location.front: [
            "Linked Jackhammers",
            "Linked Jackhammers",
            "Light Rocket",
            "Light Rocket",
            "Splitter",
            "Aerodynamic Fairings",
          ],
          Location.back: [
            "Thundergun",
            "Oil Jets",
            "Spoiler",
          ],
          Location.left: [
            "Standard Recoilless Rifle Explosive Rounds",
          ],
          Location.right: [
            "Standard Recoilless Rifle Explosive Rounds",
          ],
          Location.upgrade: [
            "High-Density Radials",
            "Chassis Brace",
          ],
        },
      ),
    },
  ),
  ChassisType.sawtooth: CarChassis(
    type: ChassisType.sawtooth,
    description:
        "Sawtooth is fast, brutal, and crewed by absolute maniacs.\n\nBuilt on the frame of a small luxury coupe, it's exceptionally nimble and isn't concerned with tire damage.\n\nAn unpredictable clsoe-quarters nightmare, Sawtooth rams into other cars and jabs its Bonesaw right into the open wound.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Sawtooth (Div. 4)",
        chassis: ChassisType.sawtooth,
        division: 4,
        locs: {
          Location.crew: [
            "Possum",
            "Whiplash",
            "Hand Cannon",
            "Thermite Grenades",
          ],
          Location.front: [
            "Standard Recoilless Rifle",
            "Standard Recoilless Rifle",
            "Superbooster",
          ],
          Location.left: [
            "Bonesaw",
            "Light Steel Plate",
          ],
          Location.right: [
            "Javelin",
            "Javelin",
            "Light Steel Plate",
          ],
          Location.upgrade: [
            "Punchbumper",
            "Airless Tires",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Sawtooth (Div. 8)",
        chassis: ChassisType.sawtooth,
        division: 8,
        locs: {
          Location.crew: [
            "Possum",
            "Fang",
            "Hand Cannon",
          ],
          Location.front: [
            "Bonesaw",
            "Standard Recoilless Rifle Explosive Rounds",
            "Standard Recoilless Rifle Explosive Rounds",
            "Superbooster",
            "Ramplate",
          ],
          Location.back: [
            "Fire Mine Dropper",
            "Spoiler",
          ],
          Location.left: [
            "Standard Steel Plate",
          ],
          Location.right: [
            "Longbow",
            "Longbow",
            "Standard Steel Plate",
          ],
          Location.upgrade: [
            "High-Density Radials",
            "Wheel Guards",
          ],
        },
      ),
    },
  ),
  ChassisType.scarab: CarChassis(
    type: ChassisType.scarab,
    description:
        "Lightweight and maneuverable, with high visibility offered by the canopy design, the Scarab is versatile and deadly, especially when equipped with weapon concealment systems.\n\nThe lack of rear weaponry leaves it vulnerable to attacks from behind, but it can be easily modified to add a mine dropper.\n\nThis is a great choice for beginners and experienced duellists alike.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Scarab (Div. 4)",
        chassis: ChassisType.scarab,
        division: 4,
        locs: {
          Location.crew: [
            "Rookie Driver",
            "Veteran Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Armor-Piercing Rocket",
            "Armor-Piercing Rocket",
          ],
          Location.back: [
            "Magnetic Dampers",
          ],
          Location.left: [
            "Anti-Tank Gun",
            "Standard Recoilless Rifle",
          ],
          Location.right: [
            "Anti-Tank Gun",
            "Standard Recoilless Rifle",
          ],
          Location.upgrade: [
            "Airless Tires",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Scarab (Div. 8)",
        chassis: ChassisType.scarab,
        division: 8,
        locs: {
          Location.crew: [
            "Medusa",
            "Hyperion",
            "Hand Cannon",
          ],
          Location.front: [
            "Standard Recoilless Rifle",
            "Standard Recoilless Rifle",
            "Splitter",
            "Light Plastic Cladding",
          ],
          Location.back: [
            "Spoiler",
            "Light Plastic Cladding",
          ],
          Location.left: [
            "Heavy Recoilless Rifle",
            "Standard Rocket",
            "Light Plastic Cladding",
          ],
          Location.right: [
            "Heavy Recoilless Rifle",
            "Standard Rocket",
            "Light Plastic Cladding",
          ],
          Location.upgrade: [
            "Complex Concealment System",
            "Airless Tires",
          ],
        },
      ),
    },
  ),
  ChassisType.scimitar: CarChassis(
    type: ChassisType.scimitar,
    description:
        "The Scimitar is an all-purpose design that can adapted to many different arena settings, from drifting on pavement to rock crawling.\n\nDurable, modular, and sporting respectable armor for most engagements, the Scimitar is a well-rounded workhorse that holds its own at any range, balancing large shock weapons, lasers, and tire-shredding weaponry.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Scimitar (Div. 4)",
        chassis: ChassisType.scimitar,
        division: 4,
        locs: {
          Location.crew: [
            "Bandit",
            "Rookie Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Betatron",
          ],
          Location.back: [
            "Light Machine Gun",
            "Light Machine Gun",
          ],
          Location.left: [
            "Electrolaser",
            "Light Plastic Cladding",
          ],
          Location.right: [
            "Electrolaser",
            "Light Plastic Cladding",
          ],
          Location.upgrade: [
            "Reinforced Weapon Brackets",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Scimitar (Div. 8)",
        chassis: ChassisType.scimitar,
        division: 8,
        locs: {
          Location.crew: [
            "Scorpion",
            "Vandal",
            "Hand Cannon",
            "Assault Rifle",
            "Flak Jacket",
          ],
          Location.front: [
            "Shockwave Cannon",
            "Shockwave Cannon",
          ],
          Location.back: [
            "Linked Shotguns",
          ],
          Location.left: [
            "Rapid-Cycle Laser",
            "Experimental Ablative Cladding",
          ],
          Location.right: [
            "Rapid-Cycle Laser",
            "Experimental Ablative Cladding",
          ],
        },
      ),
    },
  ),
  ChassisType.shuriken: CarChassis(
    type: ChassisType.shuriken,
    description:
        "With excellent handling, a strengthened outer shell, and heavy firepower, the Shuriken is a frequent arena contender that strikes a careful balance between offense, defense, and driving performance.\n\nThis car has a complete lack of front weaponry, so an effective offense requires precision driving.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Shuriken (Div. 4)",
        chassis: ChassisType.shuriken,
        division: 4,
        locs: {
          Location.crew: [
            "Medusa",
            "Rookie Gunner",
            "Hand Cannon",
            "Paint Grenades",
          ],
          Location.front: [
            "Fire Extinguisher",
            "Autopilot",
          ],
          Location.back: [
            "Stovepipe",
            "Linked Shotguns",
          ],
          Location.left: [
            "Heavy Recoilless Rifle",
          ],
          Location.right: [
            "Heavy Recoilless Rifle",
          ],
          Location.upgrade: [
            "Cadmium Alloy Fasteners",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Shuriken (Div. 8)",
        chassis: ChassisType.shuriken,
        division: 8,
        locs: {
          Location.crew: [
            "Ranger",
            "Amateur Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Fire Extinguisher",
            "Autopilot",
            "Targeting Computer",
            "Advanced Firing Interface",
            "Magnetic Dampers",
            "Light Plastic Cladding",
          ],
          Location.back: [
            "Devastator",
            "Scatter Gun",
          ],
          Location.left: [
            "Anti-Tank Gun",
            "Light Plastic Cladding",
          ],
          Location.right: [
            "Anti-Tank Gun",
            "Light Plastic Cladding",
          ],
          Location.upgrade: [
            "Cadmium Alloy Fasteners",
          ],
        },
      ),
    },
  ),
  ChassisType.sledge: CarChassis(
    type: ChassisType.sledge,
    description:
        "Sledge is a titan on the battlefield, intimidating and mean.\n\nPart mobile weapons platform, part bulldozer, it unleashes a barrage of rockets and then fearlessly plunges into the thick of the smoke.\n\nSledge is built to deal a ton of damage quickly and then take its time picking apart the limping survivors.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Sledge (Div. 4)",
        chassis: ChassisType.sledge,
        division: 4,
        locs: {
          Location.crew: [
            "Rhino",
            "Machete",
            "Hand Cannon",
          ],
          Location.front: [
            "Armor-Piercing Rocket",
            "Laser-Guided Light Rocket",
            "Light Rocket",
            "Light Rocket",
          ],
          Location.back: [
            "Light Machine Gun",
            "Light Machine Gun",
          ],
          Location.left: [
            "Vulcan",
          ],
          Location.right: [
            "Vulcan",
          ],
          Location.upgrade: [
            "Cadmium Alloy Fasteners",
            "Punchbumper",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Sledge (Div. 8)",
        chassis: ChassisType.sledge,
        division: 8,
        locs: {
          Location.crew: [
            "Bandit",
            "Veteran Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Heavy Rocket",
            "Heavy Rocket",
            "Standard Rocket",
            "Standard Rocket",
            "Light Steel Plate",
          ],
          Location.back: [
            "Stinger",
            "Stinger",
          ],
          Location.left: [
            "Thresher",
            "Light Steel Plate",
          ],
          Location.right: [
            "Thresher",
            "Light Steel Plate",
          ],
          Location.upgrade: [
            "Cadmium Alloy Fasteners",
            "Reinforced Weapon Brackets",
            "Punchbumper",
          ],
        },
      ),
    },
  ),
  ChassisType.slipstream: CarChassis(
    type: ChassisType.slipstream,
    description:
        "As the name implies, Slipstream is sleek, fast, and agile.\n\nWhile not heavily armored, it is particularly capable of mitigating tire damage.\n\nExcellent maneuverability and reliable slug weapons allow Slipstream to dart around the arena as it overwhelms the defensive weaknesses of any opponent.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Slipstream (Div. 4)",
        chassis: ChassisType.slipstream,
        division: 4,
        locs: {
          Location.crew: [
            "Possum",
            "Amateur Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Standard Rocket",
            "Standard Rocket",
            "Splitter",
          ],
          Location.back: [
            "Standard Recoilless Rifle",
            "Standard Recoilless Rifle",
            "Power Plant Superconductor",
          ],
          Location.left: [
            "Standard Machine Gun Tracer Rounds",
          ],
          Location.right: [
            "Standard Machine Gun Tracer Rounds",
          ],
          Location.upgrade: [
            "Airless Tires",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Slipstream (Div. 8)",
        chassis: ChassisType.slipstream,
        division: 8,
        locs: {
          Location.crew: [
            "Bandit",
            "Grendel",
            "Hand Cannon",
            "Killstreak",
          ],
          Location.front: [
            "Heavy Rocket",
            "Heavy Rocket",
            "Splitter",
          ],
          Location.back: [
            "Javelin",
            "Javelin",
            "Sharkfin Aero Package",
            "Power Plant Superconductor",
          ],
          Location.left: [
            "Longbow",
          ],
          Location.right: [
            "Longbow",
          ],
          Location.upgrade: [
            "Simple Concealment System",
            "Run-Flat System",
            "Gyroscopic Stabilizer",
          ],
        },
      ),
    },
  ),
  ChassisType.spark: CarChassis(
    type: ChassisType.spark,
    description:
        "Spark's design was heavily influenced by old stealth aircraft.\n\nIts front weapons are lethal, so don't get caught by surprise.\n\nUnfortunately, the front is also the most vulnerable spot to attack.\n\nHeavily armed and armored, Spark is a technological marvel that can easily accommodate live crew members or complex AI systems.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Spark (Div. 4)",
        chassis: ChassisType.spark,
        division: 4,
        locs: {
          Location.crew: [
            "Rookie Driver",
            "Monarch",
            "Hand Cannon",
          ],
          Location.front: [
            "Vulcan",
            "Electrolaser",
            "Electrolaser",
          ],
          Location.back: [
            "Fire Mine Dropper",
            "Light Ceramic Plate",
          ],
          Location.left: [
            "Javelin",
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Javelin",
            "Light Ceramic Plate",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Spark (Div. 8)",
        chassis: ChassisType.spark,
        division: 8,
        locs: {
          Location.crew: [
            "Possum",
            "Fang",
            "Hand Cannon",
          ],
          Location.front: [
            "Thresher",
            "Thresher",
            "Particle Beam",
            "Ramplate",
          ],
          Location.back: [
            "Fire Mine Dropper",
            "Aerodynamic Fairings",
            "Light Steel Plate",
          ],
          Location.left: [
            "Jackhammer",
            "Light Plastic Cladding",
          ],
          Location.right: [
            "Jackhammer",
            "Light Plastic Cladding",
          ],
          Location.upgrade: [
            "Reactive Defense System",
          ],
        },
      ),
    },
  ),
  ChassisType.stiletto: CarChassis(
    type: ChassisType.stiletto,
    description:
        "The tight-handling and devious Stiletto relies on speed and maneuverability to bolster its defense.\n\nIt wields huge shock weapons that inflict massive damage, but can be quite fragile.\n\nIts smokescreens create confusion in the battlefield and provide Stiletto with cover for strategic targeting or quick getaways.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Stiletto (Div. 4)",
        chassis: ChassisType.stiletto,
        division: 4,
        locs: {
          Location.crew: [
            "Scorpion",
            "Rookie Gunner",
            "Hand Cannon",
            "Assault Rifle",
          ],
          Location.back: [
            "Standard Rocket",
            "Standard Rocket",
            "High-Torque Differential",
            "Power Plant Superconductor",
          ],
          Location.left: [
            "Arc Rifle",
          ],
          Location.right: [
            "Arc Rifle",
          ],
          Location.upgrade: [
            "Active Camouflage",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Stiletto (Div. 8)",
        chassis: ChassisType.stiletto,
        division: 8,
        locs: {
          Location.crew: [
            "Alpine",
            "Amateur Gunner",
            "Hand Cannon",
            "Paint Grenades",
          ],
          Location.front: [
            "Lightning Scythe",
            "Lightning Scythe",
            "Carbon Laminate",
          ],
          Location.back: [
            "Standard Rocket",
            "Standard Rocket",
            "High-Torque Differential",
            "Power Plant Superconductor",
          ],
          Location.left: [
            "Disruptor",
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Disruptor",
            "Light Ceramic Plate",
          ],
          Location.upgrade: [
            "Active Camouflage",
          ],
        },
      ),
    },
  ),
  ChassisType.superflash: CarChassis(
    type: ChassisType.superflash,
    description:
        "Superflash relies on an electromagnetic distortion field and smokescreens to minimize counterattacks while making long-range, precision attacks.\n\nIt can carry fewer weapons than most other vehicles because its thick skin keeps everything safe and functioning for much longer than usual, even under heavy fire.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Superflash (Div. 4)",
        chassis: ChassisType.superflash,
        division: 4,
        locs: {
          Location.crew: [
            "Medusa",
            "Whiplash",
            "Hand Cannon",
          ],
          Location.front: [
            "Rapid-Cycle Laser",
            "Peppermill",
          ],
          Location.back: [
            "Smoke Emitter",
            "Spoiler",
          ],
          Location.left: [
            "Electrolaser",
          ],
          Location.right: [
            "Electrolaser",
          ],
          Location.upgrade: [
            "EM Distortion Field",
            "Wheel Hubs",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Superflash (Div. 8)",
        chassis: ChassisType.superflash,
        division: 8,
        locs: {
          Location.crew: [
            "Veteran Driver",
            "Monarch",
            "Hand Cannon",
          ],
          Location.front: [
            "Solid-State Laser",
            "Linked Shotguns",
            "Standard Composite Plate",
          ],
          Location.back: [
            "Smoke Emitter",
            "Supplemental Power Cell",
            "Spoiler",
          ],
          Location.left: [
            "Rapid-Cycle Laser",
            "Light Steel Plate",
          ],
          Location.right: [
            "Rapid-Cycle Laser",
            "Light Steel Plate",
          ],
          Location.upgrade: [
            "EM Distortion Field",
            "Wheel Hubs",
          ],
        },
      ),
    },
  ),
  ChassisType.typhoon: CarChassis(
    type: ChassisType.typhoon,
    description:
        "Typhoon is the definition of a \"glass cannon.\"\n\nIt packs a big enough punch to tear through even the most armored foe, but relies on fancy driving to keep it safe from attack.\n\nWith that in mind, it is well equipped to maintain control during extreme maneuvers, and only a handful of well-placed shots are needed to ensure a win.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Typhoon (Div. 4)",
        chassis: ChassisType.typhoon,
        division: 4,
        locs: {
          Location.crew: [
            "Alpine",
            "Rookie Gunner",
            "Hand Cannon",
          ],
          Location.front: [
            "Splitter",
          ],
          Location.back: [
            "Electrolaser",
            "Electrolaser",
            "Spoiler",
          ],
          Location.left: [
            "Heavy Machine Gun",
          ],
          Location.right: [
            "Heavy Machine Gun",
          ],
          Location.turret: [
            "Turreted Arc Rifle",
          ],
          Location.upgrade: [
            "Stability Controller",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Typhoon (Div. 8)",
        chassis: ChassisType.typhoon,
        division: 8,
        locs: {
          Location.crew: [
            "Veteran Driver",
            "Max",
            "Hand Cannon",
          ],
          Location.front: [
            "Railgun",
            "Splitter",
          ],
          Location.back: [
            "Linked Pulse Lasers",
            "Spoiler",
          ],
          Location.left: [
            "Thresher",
          ],
          Location.right: [
            "Thresher",
          ],
          Location.upgrade: [
            "Fire-Resistant Coating",
            "Cadmium Alloy Fasteners",
            "Stability Controller",
          ],
        },
      ),
    },
  ),
  ChassisType.warhawk: CarChassis(
    type: ChassisType.warhawk,
    description:
        "Built for ramming and loaded with concussion mines, the heavily-armored Warhawk is a formidable opponent.\n\nThe machine gun turret on the roof means there is no safe place for opponents to hide.\n\nIts weakest point is the rear armor, but the mine droppers make it exceptionally difficult for anyone to chase a Warhawk for too long.",
    divisions: {
      4: Vehicle(
        version: "0.0.1",
        name: "Warhawk (Div. 4)",
        chassis: ChassisType.warhawk,
        division: 4,
        locs: {
          Location.crew: [
            "Rookie Driver",
            "Vandal",
            "Hand Cannon",
            "Assault Rifle",
          ],
          Location.front: [
            "Heavy Machine Gun",
            "Heavy Machine Gun",
          ],
          Location.back: [
            "Automatic Fire Suppressor",
          ],
          Location.left: [
            "Concussion Mine Dropper",
            "Light Ceramic Plate",
          ],
          Location.right: [
            "Concussion Mine Dropper",
            "Light Ceramic Plate",
          ],
          Location.turret: [
            "Turreted Machine Gun",
          ],
          Location.upgrade: [
            "Punchbumper",
            "Wheel Guards",
          ],
        },
      ),
      8: Vehicle(
        version: "0.0.1",
        name: "Warhawk (Div. 8)",
        chassis: ChassisType.warhawk,
        division: 8,
        locs: {
          Location.crew: [
            "Amateur Driver",
            "Fang",
            "Hand Cannon",
          ],
          Location.front: [
            "Mass Driver",
            "Linked Standard Machine Guns",
          ],
          Location.back: [
            "Mass Driver",
            "High-Torque Differential",
          ],
          Location.left: [
            "Concussion Mine Dropper",
            "Titanium Laminate",
          ],
          Location.right: [
            "Concussion Mine Dropper",
            "Titanium Laminate",
          ],
          Location.turret: [
            "Turreted Machine Gun",
          ],
          Location.upgrade: [
            "Punchbumper",
            "Wheel Hubs",
          ],
        },
      ),
    },
  ),
};
