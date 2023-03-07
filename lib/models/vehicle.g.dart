// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      version: json['version'] as String,
      id: json['id'] as String? ?? '',
      name: json['name'] as String,
      vehicleType:
          $enumDecodeNullable(_$VehicleTypeEnumMap, json['vehicleType']) ??
              VehicleType.car,
      chassis: $enumDecode(_$ChassisEnumMap, json['chassis']),
      division: json['division'] as int,
      locs: (json['locs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LocationEnumMap, k),
            (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'version': instance.version,
      'id': instance.id,
      'name': instance.name,
      'vehicleType': _$VehicleTypeEnumMap[instance.vehicleType]!,
      'chassis': _$ChassisEnumMap[instance.chassis]!,
      'division': instance.division,
      'locs': instance.locs.map((k, e) => MapEntry(_$LocationEnumMap[k]!, e)),
    };

const _$VehicleTypeEnumMap = {
  VehicleType.car: 'car',
};

const _$ChassisEnumMap = {
  Chassis.custom: 'custom',
  Chassis.apollo: 'apollo',
  Chassis.aristocrat: 'aristocrat',
  Chassis.avalanche: 'avalanche',
  Chassis.boomerang: 'boomerang',
  Chassis.brimstone: 'brimstone',
  Chassis.butcher: 'butcher',
  Chassis.conestoga: 'conestoga',
  Chassis.dragon: 'dragon',
  Chassis.fuzion: 'fuzion',
  Chassis.goblin: 'goblin',
  Chassis.hades: 'hades',
  Chassis.hammer: 'hammer',
  Chassis.hotshot: 'hotshot',
  Chassis.hydra: 'hydra',
  Chassis.jackal: 'jackal',
  Chassis.jackrabbit: 'jackrabbit',
  Chassis.josephSpecial: 'josephSpecial',
  Chassis.kodiak: 'kodiak',
  Chassis.pillbug: 'pillbug',
  Chassis.pureEnergy: 'pureEnergy',
  Chassis.redline: 'redline',
  Chassis.sawtooth: 'sawtooth',
  Chassis.scarab: 'scarab',
  Chassis.scimitar: 'scimitar',
  Chassis.shuriken: 'shuriken',
  Chassis.sledge: 'sledge',
  Chassis.slipstream: 'slipstream',
  Chassis.spark: 'spark',
  Chassis.stiletto: 'stiletto',
  Chassis.superflash: 'superflash',
  Chassis.typhoon: 'typhoon',
  Chassis.warhawk: 'warhawk',
};

const _$LocationEnumMap = {
  Location.crew: 'crew',
  Location.front: 'front',
  Location.left: 'left',
  Location.right: 'right',
  Location.back: 'back',
  Location.turret: 'turret',
  Location.upgrade: 'upgrade',
};
