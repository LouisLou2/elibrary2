// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/user/authed_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthedUser _$AuthedUserFromJson(Map<String, dynamic> json) => AuthedUser(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      at: json['at'] as String,
      rt: json['rt'] as String,
    );

Map<String, dynamic> _$AuthedUserToJson(AuthedUser instance) =>
    <String, dynamic>{
      'user': instance.user,
      'at': instance.at,
      'rt': instance.rt,
    };
