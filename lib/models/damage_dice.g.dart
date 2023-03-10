// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damage_dice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dice _$DiceFromJson(Map<String, dynamic> json) => Dice(
      $enumDecode(_$DieEnumMap, json['die']),
      json['qty'] as int,
    );

Map<String, dynamic> _$DiceToJson(Dice instance) => <String, dynamic>{
      'die': _$DieEnumMap[instance.die]!,
      'qty': instance.qty,
    };

const _$DieEnumMap = {
  Die.red: 'red',
  Die.yellow: 'yellow',
  Die.green: 'green',
  Die.blue: 'blue',
  Die.black: 'black',
  Die.white: 'white',
};

DamageDice _$DamageDiceFromJson(Map<String, dynamic> json) => DamageDice(
      basicDamage: json['basicDamage'] as int? ?? 0,
      tiresDamage: json['tiresDamage'] as int? ?? 0,
      dice: (json['dice'] as List<dynamic>?)
              ?.map((e) => Dice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DamageDiceToJson(DamageDice instance) =>
    <String, dynamic>{
      'basicDamage': instance.basicDamage,
      'tiresDamage': instance.tiresDamage,
      'dice': instance.dice.map((e) => e.toJson()).toList(),
    };

CrewDamageDice _$CrewDamageDiceFromJson(Map<String, dynamic> json) =>
    CrewDamageDice(
      driverDamage: json['driverDamage'] == null
          ? null
          : DamageDice.fromJson(json['driverDamage'] as Map<String, dynamic>),
      gunnerDamage: json['gunnerDamage'] == null
          ? null
          : DamageDice.fromJson(json['gunnerDamage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CrewDamageDiceToJson(CrewDamageDice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driverDamage', instance.driverDamage?.toJson());
  writeNotNull('gunnerDamage', instance.gunnerDamage?.toJson());
  return val;
}
