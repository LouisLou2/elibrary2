// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/lib/lib_time_span.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibTimeSpan _$LibTimeSpanFromJson(Map<String, dynamic> json) => LibTimeSpan(
      libId: (json['lib_id'] as num).toInt(),
      libName: json['lib_name'] as String,
      timeSpans: (json['time_spans'] as List<dynamic>)
          .map((e) => TimeSpan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LibTimeSpanToJson(LibTimeSpan instance) =>
    <String, dynamic>{
      'lib_id': instance.libId,
      'lib_name': instance.libName,
      'time_spans': instance.timeSpans,
    };
