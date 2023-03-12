import 'dart:convert';

import '../../features/car_record_sheet/controller/car_state.dart';

class SavedGameVehicles {
  final List<CarState> states;

  const SavedGameVehicles([this.states = const []]);

  // factory SavedGameVehicles.fromJson(Map<String, dynamic> json) => _$SavedGameVehiclesFromJson(json);
  // Map<String, dynamic> toJson() => _$SavedGameVehiclesToJson(this);

  factory SavedGameVehicles.fromDbFormat(Map<String, dynamic> data) {
    data['states'] = (data['states'] as List).map((value) => jsonDecode(value)).toList();
    return const SavedGameVehicles();
    // return SavedGameVehicles.fromJson(data);
  }

  Map<String, dynamic> toDbFormat() {
    final map = <String, dynamic>{};
    // final map = toJson();
    map['states'] = (map['states'] as List<Map<String, dynamic>>).map((value) => jsonEncode(value)).toList();
    return map;
  }

  bool exists(String saveName) => states.any((value) => value.saveName == saveName.trim());
}