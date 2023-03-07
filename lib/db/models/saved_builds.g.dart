// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_builds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedBuilds _$SavedBuildsFromJson(Map<String, dynamic> json) => SavedBuilds(
      (json['vehicles'] as List<dynamic>?)
              ?.map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SavedBuildsToJson(SavedBuilds instance) =>
    <String, dynamic>{
      'vehicles': instance.vehicles,
    };
