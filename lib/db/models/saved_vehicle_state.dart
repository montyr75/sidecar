import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

import '../../features/record_sheet/controller/vehicle_state.dart';

part 'saved_vehicle_state.mapper.dart';

@MappableClass()
class SavedVehicleState with SavedVehicleStateMappable {
  final String uid;
  final String username;
  final VehicleState state;

  const SavedVehicleState({required this.uid, required this.username, required this.state});

  factory SavedVehicleState.fromDb(Map<String, dynamic> data) {
    data['state'] = jsonDecode(data['states']);
    return SavedVehicleState.fromMap(data);
  }

  Map<String, dynamic> toDb() {
    final map = toMap();
    map['state'] = jsonEncode(map['state']);
    return map;
  }

  static const fromMap = SavedVehicleStateMapper.fromMap;
  static const fromJson = SavedVehicleStateMapper.fromJson;
}