// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'vehicle_state.dart';

class VehicleStateMapper extends ClassMapperBase<VehicleState> {
  VehicleStateMapper._();
  static VehicleStateMapper? _instance;
  static VehicleStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VehicleStateMapper._());
      VehicleMapper.ensureInitialized();
      ComponentStateMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
      LocationStateMapper.ensureInitialized();
      AttributeMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'VehicleState';

  static String _$id(VehicleState v) => v.id;
  static Vehicle _$vehicle(VehicleState v) => v.vehicle;
  static List<ComponentState> _$components(VehicleState v) => v.components;
  static Map<Location, LocationState> _$locs(VehicleState v) => v.locs;
  static List<Attribute> _$attributes(VehicleState v) => v.attributes;
  static int _$speed(VehicleState v) => v.speed;
  static int _$powerPlant(VehicleState v) => v.powerPlant;
  static int _$tires(VehicleState v) => v.tires;
  static int _$control(VehicleState v) => v.control;
  static int _$ace(VehicleState v) => v.ace;
  static String? _$saveName(VehicleState v) => v.saveName;

  @override
  final Map<Symbol, Field<VehicleState, dynamic>> fields = const {
    #id: Field<VehicleState, String>('id', _$id),
    #vehicle: Field<VehicleState, Vehicle>('vehicle', _$vehicle),
    #components:
        Field<VehicleState, List<ComponentState>>('components', _$components),
    #locs: Field<VehicleState, Map<Location, LocationState>>('locs', _$locs),
    #attributes:
        Field<VehicleState, List<Attribute>>('attributes', _$attributes),
    #speed: Field<VehicleState, int>('speed', _$speed,
        opt: true, def: defaultSpeed),
    #powerPlant: Field<VehicleState, int>('powerPlant', _$powerPlant,
        opt: true, def: defaultPowerPlant),
    #tires: Field<VehicleState, int>('tires', _$tires,
        opt: true, def: defaultTires),
    #control: Field<VehicleState, int>('control', _$control, opt: true, def: 0),
    #ace: Field<VehicleState, int>('ace', _$ace, opt: true, def: 0),
    #saveName: Field<VehicleState, String?>('saveName', _$saveName, opt: true),
  };

  static VehicleState _instantiate(DecodingData data) {
    return VehicleState(
        id: data.get(#id),
        vehicle: data.get(#vehicle),
        components: data.get(#components),
        locs: data.get(#locs),
        attributes: data.get(#attributes),
        speed: data.get(#speed),
        powerPlant: data.get(#powerPlant),
        tires: data.get(#tires),
        control: data.get(#control),
        ace: data.get(#ace),
        saveName: data.get(#saveName));
  }

  @override
  final Function instantiate = _instantiate;

  static VehicleState fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<VehicleState>(map));
  }

  static VehicleState fromJson(String json) {
    return _guard((c) => c.fromJson<VehicleState>(json));
  }
}

mixin VehicleStateMappable {
  String toJson() {
    return VehicleStateMapper._guard((c) => c.toJson(this as VehicleState));
  }

  Map<String, dynamic> toMap() {
    return VehicleStateMapper._guard((c) => c.toMap(this as VehicleState));
  }

  VehicleStateCopyWith<VehicleState, VehicleState, VehicleState> get copyWith =>
      _VehicleStateCopyWithImpl(this as VehicleState, $identity, $identity);
  @override
  String toString() {
    return VehicleStateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            VehicleStateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return VehicleStateMapper._guard((c) => c.hash(this));
  }
}

extension VehicleStateValueCopy<$R, $Out extends VehicleState>
    on ObjectCopyWith<$R, VehicleState, $Out> {
  VehicleStateCopyWith<$R, VehicleState, $Out> get $asVehicleState =>
      $base.as((v, t, t2) => _VehicleStateCopyWithImpl(v, t, t2));
}

typedef VehicleStateCopyWithBound = VehicleState;

abstract class VehicleStateCopyWith<$R, $In extends VehicleState,
    $Out extends VehicleState> implements ClassCopyWith<$R, $In, $Out> {
  VehicleCopyWith<$R, Vehicle, Vehicle> get vehicle;
  ListCopyWith<$R, ComponentState,
          ComponentStateCopyWith<$R, ComponentState, ComponentState>>
      get components;
  MapCopyWith<$R, Location, LocationState,
      LocationStateCopyWith<$R, LocationState, LocationState>> get locs;
  ListCopyWith<$R, Attribute, ObjectCopyWith<$R, Attribute, Attribute>>
      get attributes;
  $R call(
      {String? id,
      Vehicle? vehicle,
      List<ComponentState>? components,
      Map<Location, LocationState>? locs,
      List<Attribute>? attributes,
      int? speed,
      int? powerPlant,
      int? tires,
      int? control,
      int? ace,
      String? saveName});
  VehicleStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends VehicleState>(
      Then<VehicleState, $Out2> t, Then<$Out2, $R2> t2);
}

class _VehicleStateCopyWithImpl<$R, $Out extends VehicleState>
    extends ClassCopyWithBase<$R, VehicleState, $Out>
    implements VehicleStateCopyWith<$R, VehicleState, $Out> {
  _VehicleStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VehicleState> $mapper =
      VehicleStateMapper.ensureInitialized();
  @override
  VehicleCopyWith<$R, Vehicle, Vehicle> get vehicle =>
      $value.vehicle.copyWith.$chain($identity, (v) => call(vehicle: v));
  @override
  ListCopyWith<$R, ComponentState,
          ComponentStateCopyWith<$R, ComponentState, ComponentState>>
      get components => ListCopyWith(
          $value.components,
          (v, t) => v.copyWith.$chain<$R, ComponentState>($identity, t),
          (v) => call(components: v));
  @override
  MapCopyWith<$R, Location, LocationState,
          LocationStateCopyWith<$R, LocationState, LocationState>>
      get locs => MapCopyWith(
          $value.locs,
          (v, t) => v.copyWith.$chain<$R, LocationState>($identity, t),
          (v) => call(locs: v));
  @override
  ListCopyWith<$R, Attribute, ObjectCopyWith<$R, Attribute, Attribute>>
      get attributes => ListCopyWith(
          $value.attributes,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(attributes: v));
  @override
  $R call(
          {String? id,
          Vehicle? vehicle,
          List<ComponentState>? components,
          Map<Location, LocationState>? locs,
          List<Attribute>? attributes,
          int? speed,
          int? powerPlant,
          int? tires,
          int? control,
          int? ace,
          Object? saveName = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (vehicle != null) #vehicle: vehicle,
        if (components != null) #components: components,
        if (locs != null) #locs: locs,
        if (attributes != null) #attributes: attributes,
        if (speed != null) #speed: speed,
        if (powerPlant != null) #powerPlant: powerPlant,
        if (tires != null) #tires: tires,
        if (control != null) #control: control,
        if (ace != null) #ace: ace,
        if (saveName != $none) #saveName: saveName
      }));
  @override
  VehicleState $make(CopyWithData data) => VehicleState(
      id: data.get(#id, or: $value.id),
      vehicle: data.get(#vehicle, or: $value.vehicle),
      components: data.get(#components, or: $value.components),
      locs: data.get(#locs, or: $value.locs),
      attributes: data.get(#attributes, or: $value.attributes),
      speed: data.get(#speed, or: $value.speed),
      powerPlant: data.get(#powerPlant, or: $value.powerPlant),
      tires: data.get(#tires, or: $value.tires),
      control: data.get(#control, or: $value.control),
      ace: data.get(#ace, or: $value.ace),
      saveName: data.get(#saveName, or: $value.saveName));

  @override
  VehicleStateCopyWith<$R2, VehicleState, $Out2>
      $chain<$R2, $Out2 extends VehicleState>(
              Then<VehicleState, $Out2> t, Then<$Out2, $R2> t2) =>
          _VehicleStateCopyWithImpl($value, t, t2);
}

class LocationStateMapper extends ClassMapperBase<LocationState> {
  LocationStateMapper._();
  static LocationStateMapper? _instance;
  static LocationStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocationStateMapper._());
      LocationMapper.ensureInitialized();
      ArmorStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'LocationState';

  static Location _$loc(LocationState v) => v.loc;
  static ArmorState _$armor(LocationState v) => v.armor;
  static bool _$fire(LocationState v) => v.fire;
  static bool _$paint(LocationState v) => v.paint;

  @override
  final Map<Symbol, Field<LocationState, dynamic>> fields = const {
    #loc: Field<LocationState, Location>('loc', _$loc),
    #armor: Field<LocationState, ArmorState>('armor', _$armor),
    #fire: Field<LocationState, bool>('fire', _$fire, opt: true, def: false),
    #paint: Field<LocationState, bool>('paint', _$paint, opt: true, def: false),
  };

  static LocationState _instantiate(DecodingData data) {
    return LocationState(
        loc: data.get(#loc),
        armor: data.get(#armor),
        fire: data.get(#fire),
        paint: data.get(#paint));
  }

  @override
  final Function instantiate = _instantiate;

  static LocationState fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<LocationState>(map));
  }

  static LocationState fromJson(String json) {
    return _guard((c) => c.fromJson<LocationState>(json));
  }
}

mixin LocationStateMappable {
  String toJson() {
    return LocationStateMapper._guard((c) => c.toJson(this as LocationState));
  }

  Map<String, dynamic> toMap() {
    return LocationStateMapper._guard((c) => c.toMap(this as LocationState));
  }

  LocationStateCopyWith<LocationState, LocationState, LocationState>
      get copyWith => _LocationStateCopyWithImpl(
          this as LocationState, $identity, $identity);
  @override
  String toString() {
    return LocationStateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocationStateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return LocationStateMapper._guard((c) => c.hash(this));
  }
}

extension LocationStateValueCopy<$R, $Out extends LocationState>
    on ObjectCopyWith<$R, LocationState, $Out> {
  LocationStateCopyWith<$R, LocationState, $Out> get $asLocationState =>
      $base.as((v, t, t2) => _LocationStateCopyWithImpl(v, t, t2));
}

typedef LocationStateCopyWithBound = LocationState;

abstract class LocationStateCopyWith<$R, $In extends LocationState,
    $Out extends LocationState> implements ClassCopyWith<$R, $In, $Out> {
  ArmorStateCopyWith<$R, ArmorState, ArmorState> get armor;
  $R call({Location? loc, ArmorState? armor, bool? fire, bool? paint});
  LocationStateCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2 extends LocationState>(
          Then<LocationState, $Out2> t, Then<$Out2, $R2> t2);
}

class _LocationStateCopyWithImpl<$R, $Out extends LocationState>
    extends ClassCopyWithBase<$R, LocationState, $Out>
    implements LocationStateCopyWith<$R, LocationState, $Out> {
  _LocationStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocationState> $mapper =
      LocationStateMapper.ensureInitialized();
  @override
  ArmorStateCopyWith<$R, ArmorState, ArmorState> get armor =>
      $value.armor.copyWith.$chain($identity, (v) => call(armor: v));
  @override
  $R call({Location? loc, ArmorState? armor, bool? fire, bool? paint}) =>
      $apply(FieldCopyWithData({
        if (loc != null) #loc: loc,
        if (armor != null) #armor: armor,
        if (fire != null) #fire: fire,
        if (paint != null) #paint: paint
      }));
  @override
  LocationState $make(CopyWithData data) => LocationState(
      loc: data.get(#loc, or: $value.loc),
      armor: data.get(#armor, or: $value.armor),
      fire: data.get(#fire, or: $value.fire),
      paint: data.get(#paint, or: $value.paint));

  @override
  LocationStateCopyWith<$R2, LocationState, $Out2>
      $chain<$R2, $Out2 extends LocationState>(
              Then<LocationState, $Out2> t, Then<$Out2, $R2> t2) =>
          _LocationStateCopyWithImpl($value, t, t2);
}

class ArmorStateMapper extends ClassMapperBase<ArmorState> {
  ArmorStateMapper._();
  static ArmorStateMapper? _instance;
  static ArmorStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArmorStateMapper._());
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'ArmorState';

  static int _$value(ArmorState v) => v.value;
  static int _$max(ArmorState v) => v.max;

  @override
  final Map<Symbol, Field<ArmorState, dynamic>> fields = const {
    #value: Field<ArmorState, int>('value', _$value),
    #max: Field<ArmorState, int>('max', _$max),
  };

  static ArmorState _instantiate(DecodingData data) {
    return ArmorState(value: data.get(#value), max: data.get(#max));
  }

  @override
  final Function instantiate = _instantiate;

  static ArmorState fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<ArmorState>(map));
  }

  static ArmorState fromJson(String json) {
    return _guard((c) => c.fromJson<ArmorState>(json));
  }
}

mixin ArmorStateMappable {
  String toJson() {
    return ArmorStateMapper._guard((c) => c.toJson(this as ArmorState));
  }

  Map<String, dynamic> toMap() {
    return ArmorStateMapper._guard((c) => c.toMap(this as ArmorState));
  }

  ArmorStateCopyWith<ArmorState, ArmorState, ArmorState> get copyWith =>
      _ArmorStateCopyWithImpl(this as ArmorState, $identity, $identity);
  @override
  String toString() {
    return ArmorStateMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ArmorStateMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return ArmorStateMapper._guard((c) => c.hash(this));
  }
}

extension ArmorStateValueCopy<$R, $Out extends ArmorState>
    on ObjectCopyWith<$R, ArmorState, $Out> {
  ArmorStateCopyWith<$R, ArmorState, $Out> get $asArmorState =>
      $base.as((v, t, t2) => _ArmorStateCopyWithImpl(v, t, t2));
}

typedef ArmorStateCopyWithBound = ArmorState;

abstract class ArmorStateCopyWith<$R, $In extends ArmorState,
    $Out extends ArmorState> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? value, int? max});
  ArmorStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends ArmorState>(
      Then<ArmorState, $Out2> t, Then<$Out2, $R2> t2);
}

class _ArmorStateCopyWithImpl<$R, $Out extends ArmorState>
    extends ClassCopyWithBase<$R, ArmorState, $Out>
    implements ArmorStateCopyWith<$R, ArmorState, $Out> {
  _ArmorStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArmorState> $mapper =
      ArmorStateMapper.ensureInitialized();
  @override
  $R call({int? value, int? max}) => $apply(FieldCopyWithData(
      {if (value != null) #value: value, if (max != null) #max: max}));
  @override
  ArmorState $make(CopyWithData data) => ArmorState(
      value: data.get(#value, or: $value.value),
      max: data.get(#max, or: $value.max));

  @override
  ArmorStateCopyWith<$R2, ArmorState, $Out2>
      $chain<$R2, $Out2 extends ArmorState>(
              Then<ArmorState, $Out2> t, Then<$Out2, $R2> t2) =>
          _ArmorStateCopyWithImpl($value, t, t2);
}
