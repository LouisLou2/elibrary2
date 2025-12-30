// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/struct/time_span.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSpan _$TimeSpanFromJson(Map<String, dynamic> json) => TimeSpan(
      date: DateTime.parse(json['date'] as String),
      hourBegin: (json['hour_begin'] as num).toInt(),
      hourEnd: (json['hour_end'] as num).toInt(),
    );

Map<String, dynamic> _$TimeSpanToJson(TimeSpan instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'hour_begin': instance.hourBegin,
      'hour_end': instance.hourEnd,
    };
