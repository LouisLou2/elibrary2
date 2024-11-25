import 'package:elibapp/common/res_enum.dart';

import '../../../entity/user/user_auth_params.dart';

abstract class UserStateRepo {
  void setAndPersistUser(UserAuthParams userAuthParams);
  bool get isLogin;
  int get userId;
  // void setUserAt(String at);
  String getUserAt();
  Future<bool> retrieveAndSetAt();
  void clearUser();
}