import 'package:dart_mappable/dart_mappable.dart';

import '../utils/utils.dart';
import 'damage_dice.dart';
import 'enums.dart';

part 'components.mapper.dart';

/// Text will include encoded graphics, maybe enums or something like "[[Die.red:1]]" or "[[DamageType.basic:1]]" or "[[DamageType.explosion]]"
@MappableClass()
class Mod with ModMappable {
  final ModType type;
  final String text;
  final String? abbrText;

  const Mod({required this.text, this.abbrText, this.type = ModType.text});

  bool get hasAbbrText => abbrText != null;

  static const fromMap = ModMapper.fromMap;
  static const fromJson = ModMapper.fromJson;
}

@MappableClass(discriminatorKey: 'classType')
class Component with ComponentMappable {
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

  String toKey() {
    switch (name) {
      case "Rookie": return "$name ${subtype.toString()}";
      case "Amateur": return "$name ${subtype.toString()}";
      case "Veteran": return "$name ${subtype.toString()}";
      case "Legend": return "$name ${subtype.toString()}";
      default: return name;
    }
  }

  static const fromMap = ComponentMapper.fromMap;
  static const fromJson = ComponentMapper.fromJson;
}

/// This includes any build card that can cause damage, like sidearms or weapons, etc.
@MappableClass(discriminatorValue: 'weapon')
class Weapon extends Component with WeaponMappable {
  final DamageDice? damageDice;
  final DamageType? wrenchResult;

  const Weapon({
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

  static const fromMap = WeaponMapper.fromMap;
  static const fromJson = WeaponMapper.fromJson;
}

/// Currently active component... Allows for health tracking, etc.
@MappableClass(discriminatorKey: 'classType')
class InstalledComponent with InstalledComponentMappable implements Comparable {
  final String id;
  final Component component;
  final Location loc;
  final int? currentDurability;
  final bool isExpended;

  InstalledComponent({
    required this.id,
    required this.component,
    required this.loc,
    this.currentDurability,
    this.isExpended = false,
  });

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

  static const fromMap = InstalledComponentMapper.fromMap;
  static const fromJson = InstalledComponentMapper.fromJson;
}

/// Currently active component... Allows for health tracking, control tracking (for accessories like Autopilot), etc..
@MappableClass(discriminatorValue: 'instCompWithCtrl')
class InstalledComponentWithControl extends InstalledComponent with InstalledComponentWithControlMappable {
  final int control;

  InstalledComponentWithControl({
    required super.id,
    required super.component,
    required super.loc,
    required super.currentDurability,
    super.isExpended,
    this.control = 0,
  });

  static const fromMap = InstalledComponentWithControlMapper.fromMap;
  static const fromJson = InstalledComponentWithControlMapper.fromJson;
}
