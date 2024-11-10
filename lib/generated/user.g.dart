// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../entity/user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: (json['user_id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      role: json['role'] as bool,
      location: (json['location'] as num).toInt(),
      gender: json['gender'] as bool,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'location': instance.location,
      'gender': instance.gender,
      'password': instance.password,
    };
