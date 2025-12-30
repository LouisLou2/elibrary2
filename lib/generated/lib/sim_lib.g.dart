// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/lib/sim_lib.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleLib _$SimpleLibFromJson(Map<String, dynamic> json) => SimpleLib(
      libId: (json['lib_id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SimpleLibToJson(SimpleLib instance) => <String, dynamic>{
      'lib_id': instance.libId,
      'name': instance.name,
    };
