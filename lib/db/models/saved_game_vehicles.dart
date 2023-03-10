import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../features/car_record_sheet/controller/car_state.dart';

part 'saved_game_vehicles.g.dart';

@JsonSerializable()
class SavedGameVehicles {
  final List<CarState> states;

  const SavedGameVehicles([this.states = const []]);

  factory SavedGameVehicles.fromJson(Map<String, dynamic> json) => _$SavedGameVehiclesFromJson(json);
  Map<String, dynamic> toJson() => _$SavedGameVehiclesToJson(this);

  factory SavedGameVehicles.fromDbFormat(Map<String, dynamic> data) {
    data['states'] = (data['states'] as List).map((value) => jsonDecode(value)).toList();
    return SavedGameVehicles.fromJson(data);
  }

  Map<String, dynamic> toDbFormat() {
    final map = toJson();
    map['states'] = (map['states'] as List<Map<String, dynamic>>).map((value) => jsonEncode(value)).toList();
    return map;
  }

  bool exists(String saveName) => states.any((value) => value.saveName == saveName.trim());
}