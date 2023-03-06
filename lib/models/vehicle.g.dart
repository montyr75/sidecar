// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      version: json['version'] as String,
      name: json['name'] as String,
      vehicleType:
          $enumDecodeNullable(_$VehicleTypeEnumMap, json['vehicleType']) ??
              VehicleType.car,
      chassis: $enumDecode(_$ChassisTypeEnumMap, json['chassis']),
      division: json['division'] as int,
      locs: (json['locs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LocationEnumMap, k),
            (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'version': instance.version,
      'name': instance.name,
      'vehicleType': _$VehicleTypeEnumMap[instance.vehicleType]!,
      'chassis': _$ChassisTypeEnumMap[instance.chassis]!,
      'division': instance.division,
      'locs': instance.locs.map((k, e) => MapEntry(_$LocationEnumMap[k]!, e)),
    };

const _$VehicleTypeEnumMap = {
  VehicleType.car: 'car',
};

const _$ChassisTypeEnumMap = {
  ChassisType.custom: 'custom',
  ChassisType.apollo: 'apollo',
  ChassisType.aristocrat: 'aristocrat',
  ChassisType.avalanche: 'avalanche',
  ChassisType.boomerang: 'boomerang',
  ChassisType.brimstone: 'brimstone',
  ChassisType.butcher: 'butcher',
  ChassisType.conestoga: 'conestoga',
  ChassisType.dragon: 'dragon',
  ChassisType.fuzion: 'fuzion',
  ChassisType.goblin: 'goblin',
  ChassisType.hades: 'hades',
  ChassisType.hammer: 'hammer',
  ChassisType.hotshot: 'hotshot',
  ChassisType.hydra: 'hydra',
  ChassisType.jackal: 'jackal',
  ChassisType.jackrabbit: 'jackrabbit',
  ChassisType.josephSpecial: 'josephSpecial',
  ChassisType.kodiak: 'kodiak',
  ChassisType.pillbug: 'pillbug',
  ChassisType.pureEnergy: 'pureEnergy',
  ChassisType.redline: 'redline',
  ChassisType.sawtooth: 'sawtooth',
  ChassisType.scarab: 'scarab',
  ChassisType.scimitar: 'scimitar',
  ChassisType.shuriken: 'shuriken',
  ChassisType.sledge: 'sledge',
  ChassisType.slipstream: 'slipstream',
  ChassisType.spark: 'spark',
  ChassisType.stiletto: 'stiletto',
  ChassisType.superflash: 'superflash',
  ChassisType.typhoon: 'typhoon',
  ChassisType.warhawk: 'warhawk',
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
