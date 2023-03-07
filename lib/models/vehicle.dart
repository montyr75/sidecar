import 'package:json_annotation/json_annotation.dart';

import 'enums.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle implements Comparable<Vehicle> {
  final String version;
  final String? id;
  final String name;
  final VehicleType vehicleType;
  final Chassis chassis;
  final int division;
  final Map<Location, List<String>> locs;

  const Vehicle({
    required this.version,
    this.id,
    required this.name,
    this.vehicleType = VehicleType.car,
    required this.chassis,
    required this.division,
    required this.locs,
  });

  int get ap => division;
  int get bp => division * 4;
  int get cp => division;

  @override
  String toString() => "$chassis (Division $division)";

  @override
  int compareTo(Vehicle other) => name.compareTo(other.name);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}

enum VehicleType {
  car,
}