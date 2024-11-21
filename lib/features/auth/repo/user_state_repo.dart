import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/user_auth_params.dart';

abstract class UserStateRepo {
  set user(UserAuthParams userAuthParams);
  bool get isLogin;
  // void setUserAt(String at);
  String getUserAt();
  Future<ResCodeEnum> retriveAndSetAt();
}