// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mod _$ModFromJson(Map<String, dynamic> json) => Mod(
      text: json['text'] as String,
      abbrText: json['abbrText'] as String?,
      type: $enumDecodeNullable(_$ModTypeEnumMap, json['type']) ?? ModType.text,
    );

Map<String, dynamic> _$ModToJson(Mod instance) {
  final val = <String, dynamic>{
    'type': _$ModTypeEnumMap[instance.type]!,
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('abbrText', instance.abbrText);
  return val;
}

const _$ModTypeEnumMap = {
  ModType.text: 'text',
  ModType.note: 'note',
};

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      classType:
          $enumDecodeNullable(_$ComponentClassTypeEnumMap, json['classType']) ??
              ComponentClassType.component,
      name: json['name'] as String,
      cost: json['cost'] as int,
      asterisk: json['asterisk'] as bool? ?? false,
      type: $enumDecode(_$ComponentTypeEnumMap, json['type']),
      subtype: $enumDecodeNullable(_$ComponentSubtypeEnumMap, json['subtype']),
      restrictions: (json['restrictions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$RestrictionEnumMap, e))
              .toList() ??
          const [],
      mods: (json['mods'] as List<dynamic>?)
              ?.map((e) => Mod.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AttributeEnumMap, e))
              .toList() ??
          const [],
      durability: json['durability'] as int?,
      source: $enumDecode(_$SourceEnumMap, json['source']),
    );

Map<String, dynamic> _$ComponentToJson(Component instance) {
  final val = <String, dynamic>{
    'classType': _$ComponentClassTypeEnumMap[instance.classType]!,
    'name': instance.name,
    'cost': instance.cost,
    'asterisk': instance.asterisk,
    'type': _$ComponentTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subtype', _$ComponentSubtypeEnumMap[instance.subtype]);
  val['restrictions'] =
      instance.restrictions.map((e) => _$RestrictionEnumMap[e]!).toList();
  val['mods'] = instance.mods.map((e) => e.toJson()).toList();
  val['attributes'] =
      instance.attributes.map((e) => _$AttributeEnumMap[e]!).toList();
  writeNotNull('durability', instance.durability);
  val['source'] = _$SourceEnumMap[instance.source]!;
  return val;
}

const _$ComponentClassTypeEnumMap = {
  ComponentClassType.component: 'component',
  ComponentClassType.weapon: 'weapon',
};

const _$ComponentTypeEnumMap = {
  ComponentType.accessory: 'accessory',
  ComponentType.crew: 'crew',
  ComponentType.gear: 'gear',
  ComponentType.sidearm: 'sidearm',
  ComponentType.structure: 'structure',
  ComponentType.upgrade: 'upgrade',
  ComponentType.weapon: 'weapon',
};

const _$ComponentSubtypeEnumMap = {
  ComponentSubtype.blast: 'blast',
  ComponentSubtype.coating: 'coating',
  ComponentSubtype.driver: 'driver',
  ComponentSubtype.drop: 'drop',
  ComponentSubtype.fire: 'fire',
  ComponentSubtype.frame: 'frame',
  ComponentSubtype.gloves: 'gloves',
  ComponentSubtype.gunner: 'gunner',
  ComponentSubtype.laser: 'laser',
  ComponentSubtype.melee: 'melee',
  ComponentSubtype.mount: 'mount',
  ComponentSubtype.optic: 'optic',
  ComponentSubtype.shock: 'shock',
  ComponentSubtype.shred: 'shred',
  ComponentSubtype.slug: 'slug',
  ComponentSubtype.vest: 'vest',
  ComponentSubtype.wheels: 'wheels',
};

const _$RestrictionEnumMap = {
  Restriction.backOnly: 'backOnly',
  Restriction.drop: 'drop',
  Restriction.exclusive: 'exclusive',
  Restriction.frontBack: 'frontBack',
  Restriction.frontOnly: 'frontOnly',
  Restriction.oneShot: 'oneShot',
  Restriction.range1: 'range1',
  Restriction.range2: 'range2',
  Restriction.sideArcFire: 'sideArcFire',
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

const _$SourceEnumMap = {
  Source.custom: 'custom',
  Source.armory: 'armory',
  Source.core: 'core',
  Source.crew: 'crew',
  Source.drop: 'drop',
  Source.linked: 'linked',
  Source.playmat: 'playmat',
  Source.road: 'road',
  Source.set1: 'set1',
  Source.set2: 'set2',
  Source.set3: 'set3',
  Source.set4: 'set4',
  Source.uncleAl: 'uncleAl',
};

Weapon _$WeaponFromJson(Map<String, dynamic> json) => Weapon(
      classType:
          $enumDecodeNullable(_$ComponentClassTypeEnumMap, json['classType']) ??
              ComponentClassType.weapon,
      name: json['name'] as String,
      cost: json['cost'] as int,
      asterisk: json['asterisk'] as bool? ?? false,
      type: $enumDecode(_$ComponentTypeEnumMap, json['type']),
      subtype: $enumDecodeNullable(_$ComponentSubtypeEnumMap, json['subtype']),
      restrictions: (json['restrictions'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$RestrictionEnumMap, e))
              .toList() ??
          const [],
      mods: (json['mods'] as List<dynamic>?)
              ?.map((e) => Mod.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attributes: (json['attributes'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AttributeEnumMap, e))
              .toList() ??
          const [],
      durability: json['durability'] as int?,
      source: $enumDecode(_$SourceEnumMap, json['source']),
      damageDice: json['damageDice'] == null
          ? null
          : DamageDice.fromJson(json['damageDice'] as Map<String, dynamic>),
      wrenchResult:
          $enumDecodeNullable(_$DamageTypeEnumMap, json['wrenchResult']),
    );

Map<String, dynamic> _$WeaponToJson(Weapon instance) {
  final val = <String, dynamic>{
    'classType': _$ComponentClassTypeEnumMap[instance.classType]!,
    'name': instance.name,
    'cost': instance.cost,
    'asterisk': instance.asterisk,
    'type': _$ComponentTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subtype', _$ComponentSubtypeEnumMap[instance.subtype]);
  val['restrictions'] =
      instance.restrictions.map((e) => _$RestrictionEnumMap[e]!).toList();
  val['mods'] = instance.mods.map((e) => e.toJson()).toList();
  val['attributes'] =
      instance.attributes.map((e) => _$AttributeEnumMap[e]!).toList();
  writeNotNull('durability', instance.durability);
  val['source'] = _$SourceEnumMap[instance.source]!;
  writeNotNull('damageDice', instance.damageDice?.toJson());
  writeNotNull('wrenchResult', _$DamageTypeEnumMap[instance.wrenchResult]);
  return val;
}

const _$DamageTypeEnumMap = {
  DamageType.basic: 'basic',
  DamageType.explosion: 'explosion',
  DamageType.fire: 'fire',
  DamageType.paint: 'paint',
  DamageType.tires: 'tires',
};

InstalledComponent _$InstalledComponentFromJson(Map<String, dynamic> json) =>
    InstalledComponent(
      classType: $enumDecodeNullable(
              _$InstalledComponentClassTypeEnumMap, json['classType']) ??
          InstalledComponentClassType.installedComponent,
      id: json['id'] as String,
      component: Component.fromJson(json['component'] as Map<String, dynamic>),
      loc: $enumDecode(_$LocationEnumMap, json['loc']),
      currentDurability: json['currentDurability'] as int?,
      isExpended: json['isExpended'] as bool? ?? false,
    );

Map<String, dynamic> _$InstalledComponentToJson(InstalledComponent instance) {
  final val = <String, dynamic>{
    'classType': _$InstalledComponentClassTypeEnumMap[instance.classType]!,
    'id': instance.id,
    'component': instance.component.toJson(),
    'loc': _$LocationEnumMap[instance.loc]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currentDurability', instance.currentDurability);
  val['isExpended'] = instance.isExpended;
  return val;
}

const _$InstalledComponentClassTypeEnumMap = {
  InstalledComponentClassType.installedComponent: 'installedComponent',
  InstalledComponentClassType.installedComponentWithControl:
      'installedComponentWithControl',
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

InstalledComponentWithControl _$InstalledComponentWithControlFromJson(
        Map<String, dynamic> json) =>
    InstalledComponentWithControl(
      classType: $enumDecodeNullable(
              _$InstalledComponentClassTypeEnumMap, json['classType']) ??
          InstalledComponentClassType.installedComponentWithControl,
      id: json['id'] as String,
      component: Component.fromJson(json['component'] as Map<String, dynamic>),
      loc: $enumDecode(_$LocationEnumMap, json['loc']),
      currentDurability: json['currentDurability'] as int?,
      isExpended: json['isExpended'] as bool? ?? false,
      control: json['control'] as int? ?? 0,
    );

Map<String, dynamic> _$InstalledComponentWithControlToJson(
    InstalledComponentWithControl instance) {
  final val = <String, dynamic>{
    'classType': _$InstalledComponentClassTypeEnumMap[instance.classType]!,
    'id': instance.id,
    'component': instance.component.toJson(),
    'loc': _$LocationEnumMap[instance.loc]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currentDurability', instance.currentDurability);
  val['isExpended'] = instance.isExpended;
  val['control'] = instance.control;
  return val;
}
