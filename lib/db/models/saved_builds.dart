import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';

import '../../models/vehicle.dart';

part 'saved_builds.mapper.dart';

@MappableClass()
class SavedBuilds with SavedBuildsMappable {
  final List<Vehicle> vehicles;

  const SavedBuilds([this.vehicles = const []]);

  factory SavedBuilds.fromDbFormat(Map<String, dynamic> data) {
    data['vehicles'] = (data['vehicles'] as List).map((value) => jsonDecode(value)).toList();
    return SavedBuilds.fromMap(data);
  }

  Map<String, dynamic> toDbFormat() {
    final map = toMap();
    map['vehicles'] = (map['vehicles'] as List).map((value) => jsonEncode(value)).toList();
    return map;
  }

  bool exists(String name, int division) => vehicles.any((value) => value.name == name.trim() && value.division == division);
  Vehicle? getVehicleByNameAndDivision(String name, int division) => vehicles.firstWhereOrNull((value) => value.name == name.trim() && value.division == division);

  static const fromMap = SavedBuildsMapper.fromMap;
  static const fromJson = SavedBuildsMapper.fromJson;
}