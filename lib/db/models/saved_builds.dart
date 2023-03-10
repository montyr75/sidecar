import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../models/vehicle.dart';

part 'saved_builds.g.dart';

@JsonSerializable()
class SavedBuilds {
  final List<Vehicle> vehicles;

  const SavedBuilds([this.vehicles = const []]);

  factory SavedBuilds.fromJson(Map<String, dynamic> json) => _$SavedBuildsFromJson(json);
  Map<String, dynamic> toJson() => _$SavedBuildsToJson(this);

  factory SavedBuilds.fromDbFormat(Map<String, dynamic> data) {
    data['vehicles'] = (data['vehicles'] as List).map((value) => jsonDecode(value)).toList();
    return SavedBuilds.fromJson(data);
  }

  Map<String, dynamic> toDbFormat() {
    final map = toJson();
    map['vehicles'] = (map['vehicles'] as List<Map<String, dynamic>>).map((value) => jsonEncode(value)).toList();
    return map;
  }

  bool exists(String name, int division) => vehicles.any((value) => value.name == name.trim() && value.division == division);
  Vehicle? getVehicleByNameAndDivision(String name, int division) => vehicles.firstWhereOrNull((value) => value.name == name.trim() && value.division == division);
}