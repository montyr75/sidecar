import 'package:json_annotation/json_annotation.dart';

import '../../models/vehicle.dart';

part 'saved_builds.g.dart';

@JsonSerializable()
class SavedBuilds {
  final List<Vehicle> vehicles;

  const SavedBuilds([this.vehicles = const []]);

  factory SavedBuilds.fromJson(Map<String, dynamic> json) => _$SavedBuildsFromJson(json);
  Map<String, dynamic> toJson() => _$SavedBuildsToJson(this);
}