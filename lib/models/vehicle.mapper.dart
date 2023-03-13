// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'vehicle.dart';

class VehicleMapper extends ClassMapperBase<Vehicle> {
  VehicleMapper._();
  static VehicleMapper? _instance;
  static VehicleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VehicleMapper._());
      VehicleTypeMapper.ensureInitialized();
      ChassisMapper.ensureInitialized();
      LocationMapper.ensureInitialized();
    }
    return _instance!;
  }

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
  }

  @override
  final String id = 'Vehicle';

  static String _$version(Vehicle v) => v.version;
  static String _$id(Vehicle v) => v.id;
  static String _$name(Vehicle v) => v.name;
  static VehicleType _$vehicleType(Vehicle v) => v.vehicleType;
  static Chassis _$chassis(Vehicle v) => v.chassis;
  static int _$division(Vehicle v) => v.division;
  static Map<Location, List<String>> _$locs(Vehicle v) => v.locs;

  @override
  final Map<Symbol, Field<Vehicle, dynamic>> fields = const {
    #version: Field<Vehicle, String>('version', _$version),
    #id: Field<Vehicle, String>('id', _$id, opt: true, def: ''),
    #name: Field<Vehicle, String>('name', _$name),
    #vehicleType: Field<Vehicle, VehicleType>('vehicleType', _$vehicleType,
        opt: true, def: VehicleType.car),
    #chassis: Field<Vehicle, Chassis>('chassis', _$chassis),
    #division: Field<Vehicle, int>('division', _$division),
    #locs: Field<Vehicle, Map<Location, List<String>>>('locs', _$locs),
  };

  static Vehicle _instantiate(DecodingData data) {
    return Vehicle(
        version: data.get(#version),
        id: data.get(#id),
        name: data.get(#name),
        vehicleType: data.get(#vehicleType),
        chassis: data.get(#chassis),
        division: data.get(#division),
        locs: data.get(#locs));
  }

  @override
  final Function instantiate = _instantiate;

  static Vehicle fromMap(Map<String, dynamic> map) {
    return _guard((c) => c.fromMap<Vehicle>(map));
  }

  static Vehicle fromJson(String json) {
    return _guard((c) => c.fromJson<Vehicle>(json));
  }
}

mixin VehicleMappable {
  String toJson() {
    return VehicleMapper._guard((c) => c.toJson(this as Vehicle));
  }

  Map<String, dynamic> toMap() {
    return VehicleMapper._guard((c) => c.toMap(this as Vehicle));
  }

  VehicleCopyWith<Vehicle, Vehicle, Vehicle> get copyWith =>
      _VehicleCopyWithImpl(this as Vehicle, $identity, $identity);
  @override
  String toString() {
    return VehicleMapper._guard((c) => c.asString(this));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            VehicleMapper._guard((c) => c.isEqual(this, other)));
  }

  @override
  int get hashCode {
    return VehicleMapper._guard((c) => c.hash(this));
  }
}

extension VehicleValueCopy<$R, $Out extends Vehicle>
    on ObjectCopyWith<$R, Vehicle, $Out> {
  VehicleCopyWith<$R, Vehicle, $Out> get $asVehicle =>
      $base.as((v, t, t2) => _VehicleCopyWithImpl(v, t, t2));
}

typedef VehicleCopyWithBound = Vehicle;

abstract class VehicleCopyWith<$R, $In extends Vehicle, $Out extends Vehicle>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, Location, List<String>,
      ObjectCopyWith<$R, List<String>, List<String>>> get locs;
  $R call(
      {String? version,
      String? id,
      String? name,
      VehicleType? vehicleType,
      Chassis? chassis,
      int? division,
      Map<Location, List<String>>? locs});
  VehicleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2 extends Vehicle>(
      Then<Vehicle, $Out2> t, Then<$Out2, $R2> t2);
}

class _VehicleCopyWithImpl<$R, $Out extends Vehicle>
    extends ClassCopyWithBase<$R, Vehicle, $Out>
    implements VehicleCopyWith<$R, Vehicle, $Out> {
  _VehicleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Vehicle> $mapper =
      VehicleMapper.ensureInitialized();
  @override
  MapCopyWith<$R, Location, List<String>,
          ObjectCopyWith<$R, List<String>, List<String>>>
      get locs => MapCopyWith($value.locs,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(locs: v));
  @override
  $R call(
          {String? version,
          String? id,
          String? name,
          VehicleType? vehicleType,
          Chassis? chassis,
          int? division,
          Map<Location, List<String>>? locs}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (vehicleType != null) #vehicleType: vehicleType,
        if (chassis != null) #chassis: chassis,
        if (division != null) #division: division,
        if (locs != null) #locs: locs
      }));
  @override
  Vehicle $make(CopyWithData data) => Vehicle(
      version: data.get(#version, or: $value.version),
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      vehicleType: data.get(#vehicleType, or: $value.vehicleType),
      chassis: data.get(#chassis, or: $value.chassis),
      division: data.get(#division, or: $value.division),
      locs: data.get(#locs, or: $value.locs));

  @override
  VehicleCopyWith<$R2, Vehicle, $Out2> $chain<$R2, $Out2 extends Vehicle>(
          Then<Vehicle, $Out2> t, Then<$Out2, $R2> t2) =>
      _VehicleCopyWithImpl($value, t, t2);
}

class VehicleTypeMapper extends EnumMapper<VehicleType> {
  VehicleTypeMapper._();
  static VehicleTypeMapper? _instance;
  static VehicleTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VehicleTypeMapper._());
    }
    return _instance!;
  }

  static VehicleType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  VehicleType decode(dynamic value) {
    switch (value) {
      case 'car':
        return VehicleType.car;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(VehicleType self) {
    switch (self) {
      case VehicleType.car:
        return 'car';
    }
  }
}

extension VehicleTypeMapperExtension on VehicleType {
  String toValue() {
    VehicleTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue(this) as String;
  }
}
