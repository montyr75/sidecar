// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarState _$CarStateFromJson(Map<String, dynamic> json) => CarState(
      car: Vehicle.fromJson(json['car'] as Map<String, dynamic>),
      components: (json['components'] as List<dynamic>)
          .map((e) => InstalledComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      locs: (json['locs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$LocationEnumMap, k),
            LocationState.fromJson(e as Map<String, dynamic>)),
      ),
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => $enumDecode(_$AttributeEnumMap, e))
          .toList(),
      speed: json['speed'] as int? ?? defaultSpeed,
      powerPlant: json['powerPlant'] as int? ?? defaultPowerPlant,
      tires: json['tires'] as int? ?? defaultTires,
      control: json['control'] as int? ?? 0,
      ace: json['ace'] as int? ?? 0,
      saveName: json['saveName'] as String?,
    );

Map<String, dynamic> _$CarStateToJson(CarState instance) {
  final val = <String, dynamic>{
    'car': instance.car.toJson(),
    'components': instance.components.map((e) => e.toJson()).toList(),
    'locs': instance.locs
        .map((k, e) => MapEntry(_$LocationEnumMap[k]!, e.toJson())),
    'attributes':
        instance.attributes.map((e) => _$AttributeEnumMap[e]!).toList(),
    'speed': instance.speed,
    'powerPlant': instance.powerPlant,
    'tires': instance.tires,
    'control': instance.control,
    'ace': instance.ace,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('saveName', instance.saveName);
  return val;
}

const _$LocationEnumMap = {
  Location.crew: 'crew',
  Location.front: 'front',
  Location.left: 'left',
  Location.right: 'right',
  Location.back: 'back',
  Location.turret: 'turret',
  Location.upgrade: 'upgrade',
};

const _$AttributeEnumMap = {
  Attribute.awardsAP: 'awardsAP',
  Attribute.awardsCP: 'awardsCP',
  Attribute.attackArmorPiercing: 'attackArmorPiercing',
  Attribute.attackAceForReroll: 'attackAceForReroll',
  Attribute.attackCoverAceBasic1: 'attackCoverAceBasic1',
  Attribute.attackCrewBlue1: 'attackCrewBlue1',
  Attribute.attackCrewBlue2: 'attackCrewBlue2',
  Attribute.attackCrewYellow1: 'attackCrewYellow1',
  Attribute.attackDriverYellow11: 'attackDriverYellow11',
  Attribute.attackGunnerBasic1: 'attackGunnerBasic1',
  Attribute.attackGunnerBasic2: 'attackGunnerBasic2',
  Attribute.attackGunnerFireBlack1: 'attackGunnerFireBlack1',
  Attribute.attackGunnerHcAnyArc: 'attackGunnerHcAnyArc',
  Attribute.attackGunnerRerolls2: 'attackGunnerRerolls2',
  Attribute.attackGunnerShredBlack1: 'attackGunnerShredBlack1',
  Attribute.attackGunnerYellow1Blue1: 'attackGunnerYellow1Blue1',
  Attribute.attackIncendiaryTires1: 'attackIncendiaryTires1',
  Attribute.attackIncendiaryTires2: 'attackIncendiaryTires2',
  Attribute.attackIneptYellow1: 'attackIneptYellow1',
  Attribute.attackRerolls1: 'attackRerolls1',
  Attribute.attackRerolls2: 'attackRerolls2',
  Attribute.attackSidearmRerolls2: 'attackSidearmRerolls2',
  Attribute.canAbsorbCrewDamage: 'canAbsorbCrewDamage',
  Attribute.canAbsorbFireDamage: 'canAbsorbFireDamage',
  Attribute.canAbsorbPowerPlantDamage: 'canAbsorbPowerPlantDamage',
  Attribute.canAbsorbTireDamage: 'canAbsorbTireDamage',
  Attribute.canStoreControl: 'canStoreControl',
  Attribute.enhancesCrewDurability: 'enhancesCrewDurability',
  Attribute.expendable: 'expendable',
  Attribute.internalDamagePowerPlantFirst: 'internalDamagePowerPlantFirst',
  Attribute.internalDamageTiresFirst: 'internalDamageTiresFirst',
  Attribute.maneuverBlue1: 'maneuverBlue1',
  Attribute.maneuverRemoveYellow1: 'maneuverRemoveYellow1',
  Attribute.paired: 'paired',
  Attribute.preventsTireMaxSpeedAdjustments: 'preventsTireMaxSpeedAdjustments',
  Attribute.replaceableWeapon3BP: 'replaceableWeapon3BP',
  Attribute.replaceableWeapon6BP: 'replaceableWeapon6BP',
  Attribute.requiresDiv6: 'requiresDiv6',
  Attribute.shieldReducesWeaponDamage: 'shieldReducesWeaponDamage',
  Attribute.takeAce: 'takeAce',
  Attribute.takeAce2: 'takeAce2',
  Attribute.takeAce3: 'takeAce3',
  Attribute.takeControl: 'takeControl',
  Attribute.takeControl2: 'takeControl2',
  Attribute.takeControlSpeed4: 'takeControlSpeed4',
  Attribute.takeControl2Speed5: 'takeControl2Speed5',
  Attribute.turret: 'turret',
};

LocationState _$LocationStateFromJson(Map<String, dynamic> json) =>
    LocationState(
      loc: $enumDecode(_$LocationEnumMap, json['loc']),
      armor: ArmorState.fromJson(json['armor'] as Map<String, dynamic>),
      fire: json['fire'] as bool? ?? false,
      paint: json['paint'] as bool? ?? false,
    );

Map<String, dynamic> _$LocationStateToJson(LocationState instance) =>
    <String, dynamic>{
      'loc': _$LocationEnumMap[instance.loc]!,
      'armor': instance.armor.toJson(),
      'fire': instance.fire,
      'paint': instance.paint,
    };

ArmorState _$ArmorStateFromJson(Map<String, dynamic> json) => ArmorState(
      value: json['value'] as int,
      max: json['max'] as int,
    );

Map<String, dynamic> _$ArmorStateToJson(ArmorState instance) =>
    <String, dynamic>{
      'value': instance.value,
      'max': instance.max,
    };
