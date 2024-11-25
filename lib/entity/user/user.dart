import 'package:json_annotation/json_annotation.dart';

part '../../generated/user/user.g.dart'; // 需要在同一目录下生成 user.g.dart 文件

@JsonSerializable()
class User {
  @JsonKey(name: 'user_id')
  int userId;

  String email;
  String name;

  // true: teacher, false: student
  bool role;

  // 校区代号
  int location; // Dart 中没有 byte 类型，使用 int 替代

  bool gender;
  String? password;

  // 默认构造函数
  User({
    required this.userId,
    required this.email,
    required this.name,
    required this.role,
    required this.location,
    required this.gender,
    this.password,
  });

  // JSON 反序列化
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Getters 和 Setters
  int get getUserId => userId;
  set setUserId(int id) => userId = id;

  String get getEmail => email;
  set setEmail(String email) => this.email = email;

  String get getName => name;
  set setName(String name) => this.name = name;

  bool get getRole => role;
  set setRole(bool role) => this.role = role;

  int get getLocation => location;
  set setLocation(int location) => this.location = location;

  bool get getGender => gender;
  set setGender(bool gender) => this.gender = gender;

  String? get getPassword => password;
  set setPassword(String password) => this.password = password;
}