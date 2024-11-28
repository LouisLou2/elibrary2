import 'package:json_annotation/json_annotation.dart';
import '../aggregation/user_home_data.dart';
import 'authed_user.dart'; // 假设 AuthedUser 类已存在

part '../../generated/user/authed_user_with_data.g.dart'; // 生成代码的位置

@JsonSerializable()
class AuthedUserWithData {
  @JsonKey(name: 'user')
  final AuthedUser user;

  @JsonKey(name: 'extra_data')
  final UserHomeData userHomeData;

  AuthedUserWithData({
    required this.user,
    required this.userHomeData,
  });

  factory AuthedUserWithData.fromJson(Map<String, dynamic> json) =>
      _$AuthedUserWithDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthedUserWithDataToJson(this);
}
