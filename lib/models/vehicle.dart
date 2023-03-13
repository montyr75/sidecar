import 'package:dart_mappable/dart_mappable.dart';

import 'enums.dart';

part 'vehicle.mapper.dart';

@MappableClass()
class Vehicle with VehicleMappable implements Comparable<Vehicle> {
  final String version;
  final String id;
  final String name;
  final VehicleType vehicleType;
  final Chassis chassis;
  final int division;
  final Map<Location, List<String>> locs;

  const Vehicle({
    required this.version,
    this.id = '',
    required this.name,
    this.vehicleType = VehicleType.car,
    required this.chassis,
    required this.division,
    required this.locs,
  });

  @override
  int compareTo(Vehicle other) => name.compareTo(other.name);

  static const fromMap = VehicleMapper.fromMap;
  static const fromJson = VehicleMapper.fromJson;
}

@MappableEnum()
enum VehicleType {
  car,
}