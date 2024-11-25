// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/user/authed_user_with_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthedUserWithData _$AuthedUserWithDataFromJson(Map<String, dynamic> json) =>
    AuthedUserWithData(
      user: AuthedUser.fromJson(json['user'] as Map<String, dynamic>),
      userHomeData:
          UserHomeData.fromJson(json['extra_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthedUserWithDataToJson(AuthedUserWithData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'extra_data': instance.userHomeData,
    };
