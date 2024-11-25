import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'authed_user.dart';

part '../../generated/user/user_auth_params.g.dart';

@collection
class UserAuthParams {

  @JsonKey(includeFromJson: false, includeToJson: false)
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  int userId;

  String email;
  String name;

  // true: teacher, false: student
  bool role;

  // 校区代号
  int location; // Dart 中没有 byte 类型，使用 int 替代

  bool gender;
  String? password;

  String at;
  String rt;

  UserAuthParams({
    required this.userId,
    required this.email,
    required this.name,
    required this.role,
    required this.location,
    required this.gender,
    this.password,
    required this.at,
    required this.rt,
  });

  factory UserAuthParams.fromAuthedUser(AuthedUser authedUser) {
    return UserAuthParams(
      userId: authedUser.user.userId,
      email: authedUser.user.email,
      name: authedUser.user.name,
      role: authedUser.user.role,
      location: authedUser.user.location,
      gender: authedUser.user.gender,
      password: authedUser.user.password,
      at: authedUser.at,
      rt: authedUser.rt,
    );
  }

}