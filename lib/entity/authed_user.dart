import 'package:json_annotation/json_annotation.dart';
import 'user.dart'; // 假设 User 类在 user.dart 文件中

part '../generated/authed_user.g.dart'; // 需要在同一目录下生成 authed_user.g.dart 文件

@JsonSerializable()
class AuthedUser {
  User user;
  String at;
  String rt;

  // 默认构造函数
  AuthedUser({
    required this.user,
    required this.at,
    required this.rt,
  });

  // JSON 反序列化
  factory AuthedUser.fromJson(Map<String, dynamic> json) => _$AuthedUserFromJson(json);

  // Getters 和 Setters
  User get getUser => user;
  set setUser(User user) => this.user = user;

  String get getAt => at;
  set setAt(String at) => this.at = at;

  String get getRt => rt;
  set setRt(String rt) => this.rt = rt;
}