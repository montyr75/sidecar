import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';
import 'damage_dice.dart';
import 'enums.dart';

part 'components.g.dart';

/// Text will include encoded graphics, maybe enums or something like "[[Die.red:1]]" or "[[DamageType.basic:1]]" or "[[DamageType.explosion]]"
@JsonSerializable()
class Mod {
  final ModType type;
  final String text;
  final String? abbrText;

  const Mod({required this.text, this.abbrText, this.type = ModType.text});

  bool get hasAbbrText => abbrText != null;

  factory Mod.fromJson(Map<String, dynamic> json) => _$ModFromJson(json);
  Map<String, dynamic> toJson() => _$ModToJson(this);
}

enum ComponentClassType {
  component,
  weapon,
}

@JsonSerializable()
class Component {
  final ComponentClassType classType;

  final String name;
  final int cost;
  final bool asterisk; // an asterisk on the cost?
  final ComponentType type;
  final ComponentSubtype? subtype;
  final List<Restriction> restrictions;
  final List<Mod> mods;
  final List<Attribute> attributes;
  final int? durability;
  final Source source;

  const Component({
    this.classType = ComponentClassType.component,
    required this.name,
    required this.cost,
    this.asterisk = false,
    required this.type,
    this.subtype,
    this.restrictions = const [],
    this.mods = const [],
    this.attributes = const [],
    this.durability,
    required this.source,
  });

  bool get hasSubtype => subtype != null;
  bool get hasRestrictions => restrictions.isNotEmpty;
  bool get hasMods => mods.isNotEmpty;
  bool get canBeDamaged => durability != null;
  bool get hasAttributes => attributes.isNotEmpty;

  bool hasRestriction(Restriction value) => hasRestrictions && restrictions.contains(value);
  bool hasAttribute(Attribute value) => hasAttributes && attributes.contains(value);

  Component copyWith({
    ComponentClassType? classType,
    String? name,
    int? cost,
    bool? asterisk,
    ComponentType? type,
    ComponentSubtype? subtype,
    List<Restriction>? restrictions,
    List<Mod>? mods,
    List<Attribute>? attributes,
    int? durability,
    Source? source,
  }) {
    return Component(
      classType: classType ?? this.classType,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      asterisk: asterisk ?? this.asterisk,
      type: type ?? this.type,
      subtype: subtype ?? this.subtype,
      restrictions: restrictions ?? this.restrictions,
      mods: mods ?? this.mods,
      attributes: attributes ?? this.attributes,
      durability: durability ?? this.durability,
      source: source ?? this.source,
    );
  }

  String toKey() {
    switch (name) {
      case "Rookie": return "$name ${subtype.toString()}";
      case "Amateur": return "$name ${subtype.toString()}";
      case "Veteran": return "$name ${subtype.toString()}";
      case "Legend": return "$name ${subtype.toString()}";
      default: return name;
    }
  }

  factory Component.fromJson(Map<String, dynamic> json) => _$ComponentFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}

/// This includes any build card that can cause damage, like sidearms or weapons, etc.
@JsonSerializable()
class Weapon extends Component {
  final DamageDice? damageDice;
  final DamageType? wrenchResult;

  const Weapon({
    super.classType = ComponentClassType.weapon,
    required super.name,
    required super.cost,
    super.asterisk = false,
    required super.type,
    super.subtype,
    super.restrictions,
    super.mods,
    super.attributes,
    super.durability,
    required super.source,
    this.damageDice,
    this.wrenchResult,
  });

  bool get hasDamageDice => damageDice != null;
  bool get hasBasicDamage => damageDice?.hasBasicDamage ?? false;
  bool get hasTiresDamage => damageDice?.hasTiresDamage ?? false;
  bool get hasWrenchResult => wrenchResult != null;

  String get range {
    if (hasRestriction(Restriction.range2)) {
      return "2";
    }
    else if (hasRestriction(Restriction.range1)) {
      return "1";
    }

    return infinity;
  }

  factory Weapon.fromJson(Map<String, dynamic> json) => _$WeaponFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WeaponToJson(this);
}

enum InstalledComponentClassType {
  installedComponent,
  installedComponentWithControl,
}

/// Currently active component... Allows for health tracking, etc.
@JsonSerializable()
class InstalledComponent implements Comparable {
  final InstalledComponentClassType classType;
  final String id;
  final Component component;
  final Location loc;
  final int? currentDurability;
  final bool isExpended;

  InstalledComponent({
    this.classType = InstalledComponentClassType.installedComponent,
    required this.id,
    required this.component,
    required this.loc,
    this.currentDurability,
    this.isExpended = false,
  });

  InstalledComponent copyWith({
    InstalledComponentClassType? classType,
    String? id,
    Component? component,
    Location? loc,
    int? currentDurability,
    bool? isExpended,
  }) {
    return InstalledComponent(
      classType: classType ?? this.classType,
      id: id ?? this.id,
      component: component ?? this.component,
      loc: loc ?? this.loc,
      currentDurability: currentDurability ?? this.currentDurability,
      isExpended: isExpended ?? this.isExpended,
    );
  }

  @override
  int compareTo(other) => component.cost.compareTo(other.cost);

  String get name => component.name;
  ComponentType get type => component.type;
  ComponentSubtype? get subtype => component.subtype;
  int get cost => component.cost;
  Source get source => component.source;
  List<Mod> get mods => component.mods;
  List<Mod> get abbrMods => component.mods.where((value) => value.hasAbbrText).toList();
  List<Attribute> get attributes => component.attributes;
  List<Restriction> get restrictions => component.restrictions;
  bool get hasSubtype => component.hasSubtype;
  bool get hasRestrictions => component.hasRestrictions;
  bool get canBeDamaged => component.durability != null;
  int get maxDurability => component.durability ?? 0;
  bool get isDestroyed => currentDurability == 0;
  bool get isExpendable =>
      hasAttribute(Attribute.expendable) || hasRestriction(Restriction.oneShot);

  bool get isDriver => subtype == ComponentSubtype.driver;
  bool get isGunner => subtype == ComponentSubtype.gunner;
  bool get isSidearm => type == ComponentType.sidearm;
  bool get isGear => type == ComponentType.gear;
  bool get isAccessory => type == ComponentType.accessory;
  bool get isUpgrade => type == ComponentType.upgrade;
  bool get isStructure => type == ComponentType.structure;

  bool get isWeapon => component is Weapon;
  Weapon get weapon => component as Weapon;
  bool get hasWrenchResult => isWeapon && (component as Weapon).hasWrenchResult;
  bool get hasDamageDice => isWeapon && (component as Weapon).hasDamageDice;
  DamageDice? get damageDice => (component as Weapon).damageDice;
  DamageType? get wrenchResult => (component as Weapon).wrenchResult;
  String get weaponRange => (component as Weapon).range;
  bool get isTurret => component is Weapon && component.hasAttribute(Attribute.turret);

  bool hasRestriction(Restriction value) => component.hasRestriction(value);
  bool hasAttribute(Attribute value) => component.hasAttribute(value);

  String get weaponArc {
    if (type == ComponentType.sidearm) {
      // TODO: Check for crew who can use sidearms in other arcs.
      return "Side";
    }

    return loc.toArcString();
  }

  factory InstalledComponent.fromJson(Map<String, dynamic> json) => _$InstalledComponentFromJson(json);
  Map<String, dynamic> toJson() => _$InstalledComponentToJson(this);
}

/// Currently active component... Allows for health tracking, control tracking (for accessories like Autopilot), etc..
@JsonSerializable()
class InstalledComponentWithControl extends InstalledComponent {
  final int control;

  InstalledComponentWithControl({
    super.classType = InstalledComponentClassType.installedComponentWithControl,
    required super.id,
    required super.component,
    required super.loc,
    required super.currentDurability,
    super.isExpended,
    this.control = 0,
  });

  @override
  InstalledComponentWithControl copyWith({
    InstalledComponentClassType? classType,
    String? id,
    Component? component,
    Location? loc,
    int? currentDurability,
    bool? isExpended,
    int? control,
  }) {
    return InstalledComponentWithControl(
      classType: classType ?? this.classType,
      id: id ?? this.id,
      component: component ?? this.component,
      loc: loc ?? this.loc,
      currentDurability: currentDurability ?? this.currentDurability,
      isExpended: isExpended ?? this.isExpended,
      control: control ?? this.control,
    );
  }

  factory InstalledComponentWithControl.fromJson(Map<String, dynamic> json) => _$InstalledComponentWithControlFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$InstalledComponentWithControlToJson(this);
}
