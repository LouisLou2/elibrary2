import '../../../entity/user/user_auth_params.dart';

abstract class UserStateRepo {
  void setAndPersistUser(UserAuthParams params);
  void setUser(UserAuthParams params);
  bool get isLogin;
  int get userId;
  // void setUserAt(String at);
  String getUserAt();
  Future<bool> retrieveAndSetAt();
  void clearUser();
}