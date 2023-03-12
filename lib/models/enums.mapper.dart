// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'enums.dart';

class LocationMapper extends EnumMapper<Location> {
  static MapperContainer container = MapperContainer(
    mappers: {LocationMapper()},
  );

  static final fromValue = container.fromValue<Location>;

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
  String toValue() => LocationMapper.container.toValue(this) as String;
}

class ChassisMapper extends EnumMapper<Chassis> {
  static MapperContainer container = MapperContainer(
    mappers: {ChassisMapper()},
  );

  static final fromValue = container.fromValue<Chassis>;

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
  String toValue() => ChassisMapper.container.toValue(this) as String;
}
