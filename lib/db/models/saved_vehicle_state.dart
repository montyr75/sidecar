import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

import '../../features/record_sheet/controller/vehicle_state.dart';

part 'saved_vehicle_state.mapper.dart';

@MappableClass()
class SavedVehicleState with SavedVehicleStateMappable implements Comparable {
  final String id;
  final String uid;
  final String username;
  final String name;
  final int timestamp;      // saved at (milliseconds since Epoch)
  final VehicleState state;

  const SavedVehicleState({
    required this.id,
    required this.uid,
    required this.username,
    required this.name,
    required this.timestamp,
    required this.state,
  });

  factory SavedVehicleState.fromDb(Map<String, dynamic> data) {
    data['state'] = jsonDecode(data['state']);
    return SavedVehicleState.fromMap(data);
  }

  Map<String, dynamic> toDb() {
    final map = toMap();
    map['state'] = jsonEncode(map['state']);
    return map;
  }

  static const fromMap = SavedVehicleStateMapper.fromMap;
  static const fromJson = SavedVehicleStateMapper.fromJson;

  @override
  int compareTo(other) => timestamp.compareTo(other);
}
