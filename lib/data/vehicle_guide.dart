import '../models/enums.dart';
import '../models/vehicle.dart';

const List<Vehicle> vg = [
  Vehicle(
    version: "0.0.1",
    name: "Apollo",
    chassis: Chassis.apollo,
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
  Vehicle(
    version: "0.0.1",
    name: "Apollo",
    chassis: Chassis.apollo,
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
  Vehicle(
    version: "0.0.1",
    name: "Aristocrat",
    chassis: Chassis.aristocrat,
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
  Vehicle(
    version: "0.0.1",
    name: "Aristocrat",
    chassis: Chassis.aristocrat,
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
  Vehicle(
    version: "0.0.1",
    name: "Avalanche",
    chassis: Chassis.avalanche,
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
  Vehicle(
    version: "0.0.1",
    name: "Avalanche",
    chassis: Chassis.avalanche,
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
  Vehicle(
    version: "0.0.1",
    name: "Boomerang",
    chassis: Chassis.boomerang,
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
  Vehicle(
    version: "0.0.1",
    name: "Boomerang",
    chassis: Chassis.boomerang,
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
  Vehicle(
    version: "0.0.1",
    name: "Brimstone",
    chassis: Chassis.brimstone,
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
  Vehicle(
    version: "0.0.1",
    name: "Brimstone",
    chassis: Chassis.brimstone,
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
  Vehicle(
    version: "0.0.1",
    name: "Butcher",
    chassis: Chassis.butcher,
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
  Vehicle(
    version: "0.0.1",
    name: "Butcher",
    chassis: Chassis.butcher,
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
  Vehicle(
    version: "0.0.1",
    name: "Conestoga",
    chassis: Chassis.conestoga,
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
  Vehicle(
    version: "0.0.1",
    name: "Conestoga",
    chassis: Chassis.conestoga,
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
  Vehicle(
    version: "0.0.1",
    name: "Dragon",
    chassis: Chassis.dragon,
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
  Vehicle(
    version: "0.0.1",
    name: "Dragon",
    chassis: Chassis.dragon,
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
  Vehicle(
    version: "0.0.1",
    name: "Fuzion",
    chassis: Chassis.fuzion,
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
  Vehicle(
    version: "0.0.1",
    name: "Fuzion",
    chassis: Chassis.fuzion,
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
  Vehicle(
    version: "0.0.1",
    name: "Goblin",
    chassis: Chassis.goblin,
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
  Vehicle(
    version: "0.0.1",
    name: "Goblin",
    chassis: Chassis.goblin,
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
  Vehicle(
    version: "0.0.1",
    name: "Hades",
    chassis: Chassis.hades,
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
  Vehicle(
    version: "0.0.1",
    name: "Hades",
    chassis: Chassis.hades,
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
  Vehicle(
    version: "0.0.1",
    name: "Hammer",
    chassis: Chassis.hammer,
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
  Vehicle(
    version: "0.0.1",
    name: "Hammer",
    chassis: Chassis.hammer,
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
  Vehicle(
    version: "0.0.1",
    name: "Hotshot",
    chassis: Chassis.hotshot,
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
  Vehicle(
    version: "0.0.1",
    name: "Hotshot",
    chassis: Chassis.hotshot,
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
  Vehicle(
    version: "0.0.1",
    name: "Hydra",
    chassis: Chassis.hydra,
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
  Vehicle(
    version: "0.0.1",
    name: "Hydra",
    chassis: Chassis.hydra,
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
  Vehicle(
    version: "0.0.1",
    name: "Jackal",
    chassis: Chassis.jackal,
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
  Vehicle(
    version: "0.0.1",
    name: "Jackal",
    chassis: Chassis.jackal,
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
  Vehicle(
    version: "0.0.1",
    name: "Jackrabbit",
    chassis: Chassis.jackrabbit,
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
  Vehicle(
    version: "0.0.1",
    name: "Jackrabbit",
    chassis: Chassis.jackrabbit,
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
  Vehicle(
    version: "0.0.1",
    name: "Joseph Special",
    chassis: Chassis.josephSpecial,
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
  Vehicle(
    version: "0.0.1",
    name: "Joseph Special",
    chassis: Chassis.josephSpecial,
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
  Vehicle(
    version: "0.0.1",
    name: "Kodiak",
    chassis: Chassis.kodiak,
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
  Vehicle(
    version: "0.0.1",
    name: "Kodiak",
    chassis: Chassis.kodiak,
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
  Vehicle(
    version: "0.0.1",
    name: "Pillbug",
    chassis: Chassis.pillbug,
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
  Vehicle(
    version: "0.0.1",
    name: "Pillbug",
    chassis: Chassis.pillbug,
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
  Vehicle(
    version: "0.0.1",
    name: "Pure Energy",
    chassis: Chassis.pureEnergy,
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
  Vehicle(
    version: "0.0.1",
    name: "Pure Energy",
    chassis: Chassis.pureEnergy,
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
  Vehicle(
    version: "0.0.1",
    name: "Redline",
    chassis: Chassis.redline,
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
  Vehicle(
    version: "0.0.1",
    name: "Redline",
    chassis: Chassis.redline,
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
  Vehicle(
    version: "0.0.1",
    name: "Sawtooth",
    chassis: Chassis.sawtooth,
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
  Vehicle(
    version: "0.0.1",
    name: "Sawtooth",
    chassis: Chassis.sawtooth,
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
  Vehicle(
    version: "0.0.1",
    name: "Scarab",
    chassis: Chassis.scarab,
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
  Vehicle(
    version: "0.0.1",
    name: "Scarab",
    chassis: Chassis.scarab,
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
  Vehicle(
    version: "0.0.1",
    name: "Scimitar",
    chassis: Chassis.scimitar,
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
  Vehicle(
    version: "0.0.1",
    name: "Scimitar",
    chassis: Chassis.scimitar,
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
  Vehicle(
    version: "0.0.1",
    name: "Shuriken",
    chassis: Chassis.shuriken,
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
  Vehicle(
    version: "0.0.1",
    name: "Shuriken",
    chassis: Chassis.shuriken,
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
  Vehicle(
    version: "0.0.1",
    name: "Sledge",
    chassis: Chassis.sledge,
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
  Vehicle(
    version: "0.0.1",
    name: "Sledge",
    chassis: Chassis.sledge,
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
  Vehicle(
    version: "0.0.1",
    name: "Slipstream",
    chassis: Chassis.slipstream,
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
  Vehicle(
    version: "0.0.1",
    name: "Slipstream",
    chassis: Chassis.slipstream,
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
  Vehicle(
    version: "0.0.1",
    name: "Spark",
    chassis: Chassis.spark,
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
  Vehicle(
    version: "0.0.1",
    name: "Spark",
    chassis: Chassis.spark,
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
  Vehicle(
    version: "0.0.1",
    name: "Stiletto",
    chassis: Chassis.stiletto,
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
  Vehicle(
    version: "0.0.1",
    name: "Stiletto",
    chassis: Chassis.stiletto,
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
  Vehicle(
    version: "0.0.1",
    name: "Superflash",
    chassis: Chassis.superflash,
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
  Vehicle(
    version: "0.0.1",
    name: "Superflash",
    chassis: Chassis.superflash,
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
  Vehicle(
    version: "0.0.1",
    name: "Typhoon",
    chassis: Chassis.typhoon,
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
  Vehicle(
    version: "0.0.1",
    name: "Typhoon",
    chassis: Chassis.typhoon,
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
  Vehicle(
    version: "0.0.1",
    name: "Warhawk",
    chassis: Chassis.warhawk,
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
  Vehicle(
    version: "0.0.1",
    name: "Warhawk",
    chassis: Chassis.warhawk,
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
];

extension ListVehicleX on List<Vehicle> {
  List<Vehicle> getByChassis(Chassis chassis) => where((value) => value.chassis == chassis).toList();
  List<Vehicle> getByDivision(int division) => where((value) => value.division == division).toList();
}