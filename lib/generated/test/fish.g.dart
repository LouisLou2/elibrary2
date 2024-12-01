// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/test/fish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fish _$FishFromJson(Map<String, dynamic> json) => Fish(
      json['wow_name'] as String,
      (json['animal_age'] as num).toInt(),
      json['water_type'] as String,
    );

Map<String, dynamic> _$FishToJson(Fish instance) => <String, dynamic>{
      'wow_name': instance.name,
      'water_type': instance.waterType,
      'animal_age': instance.age,
    };
