// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_game_vehicles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedGameVehicles _$SavedGameVehiclesFromJson(Map<String, dynamic> json) =>
    SavedGameVehicles(
      (json['states'] as List<dynamic>?)
              ?.map((e) => CarState.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SavedGameVehiclesToJson(SavedGameVehicles instance) =>
    <String, dynamic>{
      'states': instance.states.map((e) => e.toJson()).toList(),
    };
