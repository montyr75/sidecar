// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

part of 'vehicle.dart';

class VehicleMapper extends MapperBase<Vehicle> {
  static MapperContainer container = MapperContainer(
    mappers: {VehicleMapper()},
  )..linkAll({
      VehicleTypeMapper.container,
      ChassisMapper.container,
      LocationMapper.container,
    });

  @override
  VehicleMapperElement createElement(MapperContainer container) {
    return VehicleMapperElement._(this, container);
  }

  @override
  String get id => 'Vehicle';

  static final fromMap = container.fromMap<Vehicle>;
  static final fromJson = container.fromJson<Vehicle>;
}

class VehicleMapperElement extends MapperElementBase<Vehicle> {
  VehicleMapperElement._(super.mapper, super.container);

  @override
  Function get decoder => decode;
  Vehicle decode(dynamic v) =>
      checkedType(v, (Map<String, dynamic> map) => fromMap(map));
  Vehicle fromMap(Map<String, dynamic> map) => Vehicle(
      version: container.$get(map, 'version'),
      id: container.$getOpt(map, 'id') ?? '',
      name: container.$get(map, 'name'),
      vehicleType: container.$getOpt(map, 'vehicleType') ?? VehicleType.car,
      chassis: container.$get(map, 'chassis'),
      division: container.$get(map, 'division'),
      locs: container.$get(map, 'locs'));

  @override
  Function get encoder => encode;
  dynamic encode(Vehicle v) => toMap(v);
  Map<String, dynamic> toMap(Vehicle v) => {
        'version': container.$enc(v.version, 'version'),
        'id': container.$enc(v.id, 'id'),
        'name': container.$enc(v.name, 'name'),
        'vehicleType': container.$enc(v.vehicleType, 'vehicleType'),
        'chassis': container.$enc(v.chassis, 'chassis'),
        'division': container.$enc(v.division, 'division'),
        'locs': container.$enc(v.locs, 'locs')
      };

  @override
  String stringify(Vehicle self) =>
      'Vehicle(version: ${container.asString(self.version)}, id: ${container.asString(self.id)}, name: ${container.asString(self.name)}, vehicleType: ${container.asString(self.vehicleType)}, chassis: ${container.asString(self.chassis)}, division: ${container.asString(self.division)}, locs: ${container.asString(self.locs)})';
  @override
  int hash(Vehicle self) =>
      container.hash(self.version) ^
      container.hash(self.id) ^
      container.hash(self.name) ^
      container.hash(self.vehicleType) ^
      container.hash(self.chassis) ^
      container.hash(self.division) ^
      container.hash(self.locs);
  @override
  bool equals(Vehicle self, Vehicle other) =>
      container.isEqual(self.version, other.version) &&
      container.isEqual(self.id, other.id) &&
      container.isEqual(self.name, other.name) &&
      container.isEqual(self.vehicleType, other.vehicleType) &&
      container.isEqual(self.chassis, other.chassis) &&
      container.isEqual(self.division, other.division) &&
      container.isEqual(self.locs, other.locs);
}

mixin VehicleMappable {
  String toJson() => VehicleMapper.container.toJson(this as Vehicle);
  Map<String, dynamic> toMap() =>
      VehicleMapper.container.toMap(this as Vehicle);
  VehicleCopyWith<Vehicle, Vehicle, Vehicle> get copyWith =>
      _VehicleCopyWithImpl(this as Vehicle, $identity, $identity);
  @override
  String toString() => VehicleMapper.container.asString(this);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (runtimeType == other.runtimeType &&
          VehicleMapper.container.isEqual(this, other));
  @override
  int get hashCode => VehicleMapper.container.hash(this);
}

extension VehicleValueCopy<$R, $Out extends Vehicle>
    on ObjectCopyWith<$R, Vehicle, $Out> {
  VehicleCopyWith<$R, Vehicle, $Out> get asVehicle =>
      base.as((v, t, t2) => _VehicleCopyWithImpl(v, t, t2));
}

typedef VehicleCopyWithBound = Vehicle;

abstract class VehicleCopyWith<$R, $In extends Vehicle, $Out extends Vehicle>
    implements ObjectCopyWith<$R, $In, $Out> {
  VehicleCopyWith<$R2, $In, $Out2> chain<$R2, $Out2 extends Vehicle>(
      Then<Vehicle, $Out2> t, Then<$Out2, $R2> t2);
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
}

class _VehicleCopyWithImpl<$R, $Out extends Vehicle>
    extends CopyWithBase<$R, Vehicle, $Out>
    implements VehicleCopyWith<$R, Vehicle, $Out> {
  _VehicleCopyWithImpl(super.value, super.then, super.then2);
  @override
  VehicleCopyWith<$R2, Vehicle, $Out2> chain<$R2, $Out2 extends Vehicle>(
          Then<Vehicle, $Out2> t, Then<$Out2, $R2> t2) =>
      _VehicleCopyWithImpl($value, t, t2);

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
      $then(Vehicle(
          version: version ?? $value.version,
          id: id ?? $value.id,
          name: name ?? $value.name,
          vehicleType: vehicleType ?? $value.vehicleType,
          chassis: chassis ?? $value.chassis,
          division: division ?? $value.division,
          locs: locs ?? $value.locs));
}

class VehicleTypeMapper extends EnumMapper<VehicleType> {
  static MapperContainer container = MapperContainer(
    mappers: {VehicleTypeMapper()},
  );

  static final fromValue = container.fromValue<VehicleType>;

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
  String toValue() => VehicleTypeMapper.container.toValue(this) as String;
}
