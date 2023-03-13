// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'components.dart';

class ModMapper extends ClassMapperBase<Mod> {
  ModMapper._();
  static ModMapper? _instance;
  static ModMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ModMapper._());
      ModTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Mod';

  static String _$text(Mod v) => v.text;
  static String? _$abbrText(Mod v) => v.abbrText;
  static ModType _$type(Mod v) => v.type;

  @override
  final Map<Symbol, Field<Mod, dynamic>> fields = const {
    #text: Field<Mod, String>('text', _$text),
    #abbrText: Field<Mod, String?>('abbrText', _$abbrText, opt: true),
    #type: Field<Mod, ModType>('type', _$type, opt: true, def: ModType.text),
  };

  static Mod _instantiate(DecodingData data) {
    return Mod(
        text: data.get(#text),
        abbrText: data.get(#abbrText),
        type: data.get(#type));
  }

  @override
  final Function instantiate = _instantiate;

  static Mod fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Mod>(map));
  }

  static Mod fromJson(String json) {
    return _guard((c) => c.fromJson<Mod>(json));
  }
}

mixin ModMappable {
  String toJson() {
    return ModMapper._guard((c) => c.toJson(this as Mod));
  }

  Map<String, dynamic> toMap() {
    return ModMapper._guard((c) => c.toMap(this as Mod));
  }

  ModCopyWith<Mod, Mod, Mod> get copyWith =>
      _ModCopyWithImpl(this as Mod, $identity, $identity);
  @override
  String toString() {
    return ModMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ModMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ModMapper._guard((c) => c.hash(this));
  }
}

extension ModValueCopy<$R, $Out extends Mod> on ObjectCopyWith<$R, Mod, $Out> {
  ModCopyWith<$R, Mod, $Out> get $asMod =>
      $base.as((v, t, t2) => _ModCopyWithImpl(v, t, t2));
}

typedef ModCopyWithBound = Mod;

abstract class ModCopyWith<$R, $In extends Mod, $Out extends Mod>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? text, String? abbrText, ModType? type});
  ModCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Mod>(
      Then<Mod, $Out2> t, Then<$Out2, $R2> t2);
}

class _ModCopyWithImpl<$R, $Out extends Mod>
    extends ClassCopyWithBase<$R, Mod, $Out>
    implements ModCopyWith<$R, Mod, $Out> {
  _ModCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Mod> $mapper = ModMapper.ensureInitialized();
  @override
  $R call({String? text, Object? abbrText = $none, ModType? type}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (abbrText != $none) #abbrText: abbrText,
        if (type != null) #type: type
      }));
  @override
  Mod $make(CopyWithData data) => Mod(
      text: data.get(#text, or: $value.text),
      abbrText: data.get(#abbrText, or: $value.abbrText),
      type: data.get(#type, or: $value.type));

  @override
  ModCopyWith<$R2, Mod, $Out2> $chain<$R2, $Out2 extends Mod>(
          Then<Mod, $Out2> t, Then<$Out2, $R2> t2) =>
      _ModCopyWithImpl($value, t, t2);
}

class ComponentMapper extends ClassMapperBase<Component> {
  ComponentMapper._();
  static ComponentMapper? _instance;
  static ComponentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ComponentMapper._());
      WeaponMapper.ensureInitialized();
      ComponentTypeMapper.ensureInitialized();
      ComponentSubtypeMapper.ensureInitialized();
      RestrictionMapper.ensureInitialized();
      ModMapper.ensureInitialized();
      AttributeMapper.ensureInitialized();
      SourceMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Component';

  static String _$name(Component v) => v.name;
  static int _$cost(Component v) => v.cost;
  static bool _$asterisk(Component v) => v.asterisk;
  static ComponentType _$type(Component v) => v.type;
  static ComponentSubtype? _$subtype(Component v) => v.subtype;
  static List<Restriction> _$restrictions(Component v) => v.restrictions;
  static List<Mod> _$mods(Component v) => v.mods;
  static List<Attribute> _$attributes(Component v) => v.attributes;
  static int? _$durability(Component v) => v.durability;
  static Source _$source(Component v) => v.source;

  @override
  final Map<Symbol, Field<Component, dynamic>> fields = const {
    #name: Field<Component, String>('name', _$name),
    #cost: Field<Component, int>('cost', _$cost),
    #asterisk:
        Field<Component, bool>('asterisk', _$asterisk, opt: true, def: false),
    #type: Field<Component, ComponentType>('type', _$type),
    #subtype:
        Field<Component, ComponentSubtype?>('subtype', _$subtype, opt: true),
    #restrictions: Field<Component, List<Restriction>>(
        'restrictions', _$restrictions,
        opt: true, def: const []),
    #mods:
        Field<Component, List<Mod>>('mods', _$mods, opt: true, def: const []),
    #attributes: Field<Component, List<Attribute>>('attributes', _$attributes,
        opt: true, def: const []),
    #durability: Field<Component, int?>('durability', _$durability, opt: true),
    #source: Field<Component, Source>('source', _$source),
  };

  static Component _instantiate(DecodingData data) {
    return Component(
        name: data.get(#name),
        cost: data.get(#cost),
        asterisk: data.get(#asterisk),
        type: data.get(#type),
        subtype: data.get(#subtype),
        restrictions: data.get(#restrictions),
        mods: data.get(#mods),
        attributes: data.get(#attributes),
        durability: data.get(#durability),
        source: data.get(#source));
  }

  @override
  final Function instantiate = _instantiate;

  static Component fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Component>(map));
  }

  static Component fromJson(String json) {
    return _guard((c) => c.fromJson<Component>(json));
  }
}

mixin ComponentMappable {
  String toJson() {
    return ComponentMapper._guard((c) => c.toJson(this as Component));
  }

  Map<String, dynamic> toMap() {
    return ComponentMapper._guard((c) => c.toMap(this as Component));
  }

  ComponentCopyWith<Component, Component, Component> get copyWith =>
      _ComponentCopyWithImpl(this as Component, $identity, $identity);
  @override
  String toString() {
    return ComponentMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ComponentMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ComponentMapper._guard((c) => c.hash(this));
  }
}

extension ComponentValueCopy<$R, $Out extends Component>
    on ObjectCopyWith<$R, Component, $Out> {
  ComponentCopyWith<$R, Component, $Out> get $asComponent =>
      $base.as((v, t, t2) => _ComponentCopyWithImpl(v, t, t2));
}

typedef ComponentCopyWithBound = Component;

abstract class ComponentCopyWith<$R, $In extends Component,
    $Out extends Component> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Restriction, ObjectCopyWith<$R, Restriction, Restriction>?>
      get restrictions;
  ListCopyWith<$R, Mod, ModCopyWith<$R, Mod, Mod>> get mods;
  ListCopyWith<$R, Attribute, ObjectCopyWith<$R, Attribute, Attribute>?>
      get attributes;
  $R call(
      {String? name,
      int? cost,
      bool? asterisk,
      ComponentType? type,
      ComponentSubtype? subtype,
      List<Restriction>? restrictions,
      List<Mod>? mods,
      List<Attribute>? attributes,
      int? durability,
      Source? source});
  ComponentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Component>(
      Then<Component, $Out2> t, Then<$Out2, $R2> t2);
}

class _ComponentCopyWithImpl<$R, $Out extends Component>
    extends ClassCopyWithBase<$R, Component, $Out>
    implements ComponentCopyWith<$R, Component, $Out> {
  _ComponentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Component> $mapper =
      ComponentMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Restriction, ObjectCopyWith<$R, Restriction, Restriction>?>
      get restrictions => ListCopyWith(
          $value.restrictions,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(restrictions: v));
  @override
  ListCopyWith<$R, Mod, ModCopyWith<$R, Mod, Mod>> get mods => ListCopyWith(
      $value.mods,
      (v, t) => v.copyWith.$chain<$R, Mod>($identity, t),
      (v) => call(mods: v));
  @override
  ListCopyWith<$R, Attribute, ObjectCopyWith<$R, Attribute, Attribute>?>
      get attributes => ListCopyWith(
          $value.attributes,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(attributes: v));
  @override
  $R call(
          {String? name,
          int? cost,
          bool? asterisk,
          ComponentType? type,
          Object? subtype = $none,
          List<Restriction>? restrictions,
          List<Mod>? mods,
          List<Attribute>? attributes,
          Object? durability = $none,
          Source? source}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (cost != null) #cost: cost,
        if (asterisk != null) #asterisk: asterisk,
        if (type != null) #type: type,
        if (subtype != $none) #subtype: subtype,
        if (restrictions != null) #restrictions: restrictions,
        if (mods != null) #mods: mods,
        if (attributes != null) #attributes: attributes,
        if (durability != $none) #durability: durability,
        if (source != null) #source: source
      }));
  @override
  Component $make(CopyWithData data) => Component(
      name: data.get(#name, or: $value.name),
      cost: data.get(#cost, or: $value.cost),
      asterisk: data.get(#asterisk, or: $value.asterisk),
      type: data.get(#type, or: $value.type),
      subtype: data.get(#subtype, or: $value.subtype),
      restrictions: data.get(#restrictions, or: $value.restrictions),
      mods: data.get(#mods, or: $value.mods),
      attributes: data.get(#attributes, or: $value.attributes),
      durability: data.get(#durability, or: $value.durability),
      source: data.get(#source, or: $value.source));

  @override
  ComponentCopyWith<$R2, Component, $Out2> $chain<$R2, $Out2 extends Component>(
          Then<Component, $Out2> t, Then<$Out2, $R2> t2) =>
      _ComponentCopyWithImpl($value, t, t2);
}

class WeaponMapper extends SubClassMapperBase<Weapon> {
  WeaponMapper._();
  static WeaponMapper? _instance;
  static WeaponMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WeaponMapper._());
      ComponentMapper.ensureInitialized().addSubMapper(_instance!);
      ComponentTypeMapper.ensureInitialized();
      ComponentSubtypeMapper.ensureInitialized();
      RestrictionMapper.ensureInitialized();
      ModMapper.ensureInitialized();
      AttributeMapper.ensureInitialized();
      SourceMapper.ensureInitialized();
      DamageDiceMapper.ensureInitialized();
      DamageTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Weapon';

  static String _$name(Weapon v) => v.name;
  static int _$cost(Weapon v) => v.cost;
  static bool _$asterisk(Weapon v) => v.asterisk;
  static ComponentType _$type(Weapon v) => v.type;
  static ComponentSubtype? _$subtype(Weapon v) => v.subtype;
  static List<Restriction> _$restrictions(Weapon v) => v.restrictions;
  static List<Mod> _$mods(Weapon v) => v.mods;
  static List<Attribute> _$attributes(Weapon v) => v.attributes;
  static int? _$durability(Weapon v) => v.durability;
  static Source _$source(Weapon v) => v.source;
  static DamageDice? _$damageDice(Weapon v) => v.damageDice;
  static DamageType? _$wrenchResult(Weapon v) => v.wrenchResult;

  @override
  final Map<Symbol, Field<Weapon, dynamic>> fields = const {
    #name: Field<Weapon, String>('name', _$name),
    #cost: Field<Weapon, int>('cost', _$cost),
    #asterisk:
        Field<Weapon, bool>('asterisk', _$asterisk, opt: true, def: false),
    #type: Field<Weapon, ComponentType>('type', _$type),
    #subtype: Field<Weapon, ComponentSubtype?>('subtype', _$subtype, opt: true),
    #restrictions: Field<Weapon, List<Restriction>>(
        'restrictions', _$restrictions,
        opt: true, def: const []),
    #mods: Field<Weapon, List<Mod>>('mods', _$mods, opt: true, def: const []),
    #attributes: Field<Weapon, List<Attribute>>('attributes', _$attributes,
        opt: true, def: const []),
    #durability: Field<Weapon, int?>('durability', _$durability, opt: true),
    #source: Field<Weapon, Source>('source', _$source),
    #damageDice:
        Field<Weapon, DamageDice?>('damageDice', _$damageDice, opt: true),
    #wrenchResult:
        Field<Weapon, DamageType?>('wrenchResult', _$wrenchResult, opt: true),
  };

  @override
  final String discriminatorKey = 'classType';
  @override
  final dynamic discriminatorValue = 'weapon';
  @override
  late final ClassMapperBase superMapper = ComponentMapper.ensureInitialized();

  static Weapon _instantiate(DecodingData data) {
    return Weapon(
        name: data.get(#name),
        cost: data.get(#cost),
        asterisk: data.get(#asterisk),
        type: data.get(#type),
        subtype: data.get(#subtype),
        restrictions: data.get(#restrictions),
        mods: data.get(#mods),
        attributes: data.get(#attributes),
        durability: data.get(#durability),
        source: data.get(#source),
        damageDice: data.get(#damageDice),
        wrenchResult: data.get(#wrenchResult));
  }

  @override
  final Function instantiate = _instantiate;

  static Weapon fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Weapon>(map));
  }

  static Weapon fromJson(String json) {
    return _guard((c) => c.fromJson<Weapon>(json));
  }
}

mixin WeaponMappable {
  String toJson() {
    return WeaponMapper._guard((c) => c.toJson(this as Weapon));
  }

  Map<String, dynamic> toMap() {
    return WeaponMapper._guard((c) => c.toMap(this as Weapon));
  }

  WeaponCopyWith<Weapon, Weapon, Weapon> get copyWith =>
      _WeaponCopyWithImpl(this as Weapon, $identity, $identity);
  @override
  String toString() {
    return WeaponMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            WeaponMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return WeaponMapper._guard((c) => c.hash(this));
  }
}

extension WeaponValueCopy<$R, $Out extends Component>
    on ObjectCopyWith<$R, Weapon, $Out> {
  WeaponCopyWith<$R, Weapon, $Out> get $asWeapon =>
      $base.as((v, t, t2) => _WeaponCopyWithImpl(v, t, t2));
}

typedef WeaponCopyWithBound = Component;

abstract class WeaponCopyWith<$R, $In extends Weapon, $Out extends Component>
    implements ComponentCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, Restriction, ObjectCopyWith<$R, Restriction, Restriction>>
      get restrictions;
  @override
  ListCopyWith<$R, Mod, ModCopyWith<$R, Mod, Mod>> get mods;
  @override
  ListCopyWith<$R, Attribute, ObjectCopyWith<$R, Attribute, Attribute>>
      get attributes;
  DamageDiceCopyWith<$R, DamageDice, DamageDice>? get damageDice;
  @override
  $R call(
      {String? name,
      int? cost,
      bool? asterisk,
      ComponentType? type,
      ComponentSubtype? subtype,
      List<Restriction>? restrictions,
      List<Mod>? mods,
      List<Attribute>? attributes,
      int? durability,
      Source? source,
      DamageDice? damageDice,
      DamageType? wrenchResult});
  WeaponCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Component>(
      Then<Weapon, $Out2> t, Then<$Out2, $R2> t2);
}

class _WeaponCopyWithImpl<$R, $Out extends Component>
    extends ClassCopyWithBase<$R, Weapon, $Out>
    implements WeaponCopyWith<$R, Weapon, $Out> {
  _WeaponCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Weapon> $mapper = WeaponMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Restriction, ObjectCopyWith<$R, Restriction, Restriction>>
      get restrictions => ListCopyWith(
          $value.restrictions,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(restrictions: v));
  @override
  ListCopyWith<$R, Mod, ModCopyWith<$R, Mod, Mod>> get mods => ListCopyWith(
      $value.mods,
      (v, t) => v.copyWith.$chain<$R, Mod>($identity, t),
      (v) => call(mods: v));
  @override
  ListCopyWith<$R, Attribute, ObjectCopyWith<$R, Attribute, Attribute>>
      get attributes => ListCopyWith(
          $value.attributes,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(attributes: v));
  @override
  DamageDiceCopyWith<$R, DamageDice, DamageDice>? get damageDice =>
      $value.damageDice?.copyWith.$chain($identity, (v) => call(damageDice: v));
  @override
  $R call(
          {String? name,
          int? cost,
          bool? asterisk,
          ComponentType? type,
          Object? subtype = $none,
          List<Restriction>? restrictions,
          List<Mod>? mods,
          List<Attribute>? attributes,
          Object? durability = $none,
          Source? source,
          Object? damageDice = $none,
          Object? wrenchResult = $none}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (cost != null) #cost: cost,
        if (asterisk != null) #asterisk: asterisk,
        if (type != null) #type: type,
        if (subtype != $none) #subtype: subtype,
        if (restrictions != null) #restrictions: restrictions,
        if (mods != null) #mods: mods,
        if (attributes != null) #attributes: attributes,
        if (durability != $none) #durability: durability,
        if (source != null) #source: source,
        if (damageDice != $none) #damageDice: damageDice,
        if (wrenchResult != $none) #wrenchResult: wrenchResult
      }));
  @override
  Weapon $make(CopyWithData data) => Weapon(
      name: data.get(#name, or: $value.name),
      cost: data.get(#cost, or: $value.cost),
      asterisk: data.get(#asterisk, or: $value.asterisk),
      type: data.get(#type, or: $value.type),
      subtype: data.get(#subtype, or: $value.subtype),
      restrictions: data.get(#restrictions, or: $value.restrictions),
      mods: data.get(#mods, or: $value.mods),
      attributes: data.get(#attributes, or: $value.attributes),
      durability: data.get(#durability, or: $value.durability),
      source: data.get(#source, or: $value.source),
      damageDice: data.get(#damageDice, or: $value.damageDice),
      wrenchResult: data.get(#wrenchResult, or: $value.wrenchResult));

  @override
  WeaponCopyWith<$R2, Weapon, $Out2> $chain<$R2, $Out2 extends Component>(
          Then<Weapon, $Out2> t, Then<$Out2, $R2> t2) =>
      _WeaponCopyWithImpl($value, t, t2);
}

class InstalledComponentMapper extends ClassMapperBase<InstalledComponent> {
  InstalledComponentMapper._();
  static InstalledComponentMapper? _instance;
  static InstalledComponentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InstalledComponentMapper._());
      InstalledComponentWithControlMapper.ensureInitialized();
      ComponentMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'InstalledComponent';

  static String _$id(InstalledComponent v) => v.id;
  static Component _$component(InstalledComponent v) => v.component;
  static Location _$loc(InstalledComponent v) => v.loc;
  static int? _$currentDurability(InstalledComponent v) => v.currentDurability;
  static bool _$isExpended(InstalledComponent v) => v.isExpended;

  @override
  final Map<Symbol, Field<InstalledComponent, dynamic>> fields = const {
    #id: Field<InstalledComponent, String>('id', _$id),
    #component: Field<InstalledComponent, Component>('component', _$component),
    #loc: Field<InstalledComponent, Location>('loc', _$loc),
    #currentDurability: Field<InstalledComponent, int?>(
        'currentDurability', _$currentDurability,
        opt: true),
    #isExpended: Field<InstalledComponent, bool>('isExpended', _$isExpended,
        opt: true, def: false),
  };

  static InstalledComponent _instantiate(DecodingData data) {
    return InstalledComponent(
        id: data.get(#id),
        component: data.get(#component),
        loc: data.get(#loc),
        currentDurability: data.get(#currentDurability),
        isExpended: data.get(#isExpended));
  }

  @override
  final Function instantiate = _instantiate;

  static InstalledComponent fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<InstalledComponent>(map));
  }

  static InstalledComponent fromJson(String json) {
    return _guard((c) => c.fromJson<InstalledComponent>(json));
  }
}

mixin InstalledComponentMappable {
  String toJson() {
    return InstalledComponentMapper._guard(
        (c) => c.toJson(this as InstalledComponent));
  }

  Map<String, dynamic> toMap() {
    return InstalledComponentMapper._guard(
        (c) => c.toMap(this as InstalledComponent));
  }

  InstalledComponentCopyWith<InstalledComponent, InstalledComponent,
          InstalledComponent>
      get copyWith => _InstalledComponentCopyWithImpl(
          this as InstalledComponent, $identity, $identity);
  @override
  String toString() {
    return InstalledComponentMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            InstalledComponentMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return InstalledComponentMapper._guard((c) => c.hash(this));
  }
}

extension InstalledComponentValueCopy<$R, $Out extends InstalledComponent>
    on ObjectCopyWith<$R, InstalledComponent, $Out> {
  InstalledComponentCopyWith<$R, InstalledComponent, $Out>
      get $asInstalledComponent =>
          $base.as((v, t, t2) => _InstalledComponentCopyWithImpl(v, t, t2));
}

typedef InstalledComponentCopyWithBound = InstalledComponent;

abstract class InstalledComponentCopyWith<$R, $In extends InstalledComponent,
    $Out extends InstalledComponent> implements ClassCopyWith<$R, $In, $Out> {
  ComponentCopyWith<$R, Component, Component> get component;
  $R call(
      {String? id,
      Component? component,
      Location? loc,
      int? currentDurability,
      bool? isExpended});
  InstalledComponentCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends InstalledComponent>(
          Then<InstalledComponent, $Out2> t, Then<$Out2, $R2> t2);
}

class _InstalledComponentCopyWithImpl<$R, $Out extends InstalledComponent>
    extends ClassCopyWithBase<$R, InstalledComponent, $Out>
    implements InstalledComponentCopyWith<$R, InstalledComponent, $Out> {
  _InstalledComponentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InstalledComponent> $mapper =
      InstalledComponentMapper.ensureInitialized();
  @override
  ComponentCopyWith<$R, Component, Component> get component =>
      $value.component.copyWith.$chain($identity, (v) => call(component: v));
  @override
  $R call(
          {String? id,
          Component? component,
          Location? loc,
          Object? currentDurability = $none,
          bool? isExpended}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (component != null) #component: component,
        if (loc != null) #loc: loc,
        if (currentDurability != $none) #currentDurability: currentDurability,
        if (isExpended != null) #isExpended: isExpended
      }));
  @override
  InstalledComponent $make(CopyWithData data) => InstalledComponent(
      id: data.get(#id, or: $value.id),
      component: data.get(#component, or: $value.component),
      loc: data.get(#loc, or: $value.loc),
      currentDurability:
          data.get(#currentDurability, or: $value.currentDurability),
      isExpended: data.get(#isExpended, or: $value.isExpended));

  @override
  InstalledComponentCopyWith<$R2, InstalledComponent, $Out2>
      $chain<$R2, $Out2 extends InstalledComponent>(
              Then<InstalledComponent, $Out2> t, Then<$Out2, $R2> t2) =>
          _InstalledComponentCopyWithImpl($value, t, t2);
}

class InstalledComponentWithControlMapper
    extends SubClassMapperBase<InstalledComponentWithControl> {
  InstalledComponentWithControlMapper._();
  static InstalledComponentWithControlMapper? _instance;
  static InstalledComponentWithControlMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = InstalledComponentWithControlMapper._());
      InstalledComponentMapper.ensureInitialized().addSubMapper(_instance!);
      ComponentMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'InstalledComponentWithControl';

  static String _$id(InstalledComponentWithControl v) => v.id;
  static Component _$component(InstalledComponentWithControl v) => v.component;
  static Location _$loc(InstalledComponentWithControl v) => v.loc;
  static int? _$currentDurability(InstalledComponentWithControl v) =>
      v.currentDurability;
  static bool _$isExpended(InstalledComponentWithControl v) => v.isExpended;
  static int _$control(InstalledComponentWithControl v) => v.control;

  @override
  final Map<Symbol, Field<InstalledComponentWithControl, dynamic>> fields =
      const {
    #id: Field<InstalledComponentWithControl, String>('id', _$id),
    #component: Field<InstalledComponentWithControl, Component>(
        'component', _$component),
    #loc: Field<InstalledComponentWithControl, Location>('loc', _$loc),
    #currentDurability: Field<InstalledComponentWithControl, int?>(
        'currentDurability', _$currentDurability),
    #isExpended: Field<InstalledComponentWithControl, bool>(
        'isExpended', _$isExpended,
        opt: true, def: false),
    #control: Field<InstalledComponentWithControl, int>('control', _$control,
        opt: true, def: 0),
  };

  @override
  final String discriminatorKey = 'classType';
  @override
  final dynamic discriminatorValue = 'instCompWithCtrl';
  @override
  late final ClassMapperBase superMapper =
      InstalledComponentMapper.ensureInitialized();

  static InstalledComponentWithControl _instantiate(DecodingData data) {
    return InstalledComponentWithControl(
        id: data.get(#id),
        component: data.get(#component),
        loc: data.get(#loc),
        currentDurability: data.get(#currentDurability),
        isExpended: data.get(#isExpended),
        control: data.get(#control));
  }

  @override
  final Function instantiate = _instantiate;

  static InstalledComponentWithControl fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<InstalledComponentWithControl>(map));
  }

  static InstalledComponentWithControl fromJson(String json) {
    return _guard((c) => c.fromJson<InstalledComponentWithControl>(json));
  }
}

mixin InstalledComponentWithControlMappable {
  String toJson() {
    return InstalledComponentWithControlMapper._guard(
        (c) => c.toJson(this as InstalledComponentWithControl));
  }

  Map<String, dynamic> toMap() {
    return InstalledComponentWithControlMapper._guard(
        (c) => c.toMap(this as InstalledComponentWithControl));
  }

  InstalledComponentWithControlCopyWith<InstalledComponentWithControl,
          InstalledComponentWithControl, InstalledComponentWithControl>
      get copyWith => _InstalledComponentWithControlCopyWithImpl(
          this as InstalledComponentWithControl, $identity, $identity);
  @override
  String toString() {
    return InstalledComponentWithControlMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            InstalledComponentWithControlMapper._guard(
                (c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return InstalledComponentWithControlMapper._guard((c) => c.hash(this));
  }
}

extension InstalledComponentWithControlValueCopy<$R,
        $Out extends InstalledComponent>
    on ObjectCopyWith<$R, InstalledComponentWithControl, $Out> {
  InstalledComponentWithControlCopyWith<$R, InstalledComponentWithControl, $Out>
      get $asInstalledComponentWithControl => $base.as(
          (v, t, t2) => _InstalledComponentWithControlCopyWithImpl(v, t, t2));
}

typedef InstalledComponentWithControlCopyWithBound = InstalledComponent;

abstract class InstalledComponentWithControlCopyWith<
        $R,
        $In extends InstalledComponentWithControl,
        $Out extends InstalledComponent>
    implements InstalledComponentCopyWith<$R, $In, $Out> {
  @override
  ComponentCopyWith<$R, Component, Component> get component;
  @override
  $R call(
      {String? id,
      Component? component,
      Location? loc,
      int? currentDurability,
      bool? isExpended,
      int? control});
  InstalledComponentWithControlCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends InstalledComponent>(
          Then<InstalledComponentWithControl, $Out2> t, Then<$Out2, $R2> t2);
}

class _InstalledComponentWithControlCopyWithImpl<$R,
        $Out extends InstalledComponent>
    extends ClassCopyWithBase<$R, InstalledComponentWithControl, $Out>
    implements
        InstalledComponentWithControlCopyWith<$R, InstalledComponentWithControl,
            $Out> {
  _InstalledComponentWithControlCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<InstalledComponentWithControl> $mapper =
      InstalledComponentWithControlMapper.ensureInitialized();
  @override
  ComponentCopyWith<$R, Component, Component> get component =>
      $value.component.copyWith.$chain($identity, (v) => call(component: v));
  @override
  $R call(
          {String? id,
          Component? component,
          Location? loc,
          Object? currentDurability = $none,
          bool? isExpended,
          int? control}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (component != null) #component: component,
        if (loc != null) #loc: loc,
        if (currentDurability != $none) #currentDurability: currentDurability,
        if (isExpended != null) #isExpended: isExpended,
        if (control != null) #control: control
      }));
  @override
  InstalledComponentWithControl $make(CopyWithData data) =>
      InstalledComponentWithControl(
          id: data.get(#id, or: $value.id),
          component: data.get(#component, or: $value.component),
          loc: data.get(#loc, or: $value.loc),
          currentDurability:
              data.get(#currentDurability, or: $value.currentDurability),
          isExpended: data.get(#isExpended, or: $value.isExpended),
          control: data.get(#control, or: $value.control));

  @override
  InstalledComponentWithControlCopyWith<$R2, InstalledComponentWithControl,
      $Out2> $chain<$R2, $Out2 extends InstalledComponent>(
          Then<InstalledComponentWithControl, $Out2> t, Then<$Out2, $R2> t2) =>
      _InstalledComponentWithControlCopyWithImpl($value, t, t2);
}
