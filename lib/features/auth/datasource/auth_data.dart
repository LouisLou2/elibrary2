import '../../../entity/struct/res.dart';
import '../../../entity/user/user_auth_params.dart';

abstract class AuthDataSource {
  UserAuthParams? get userAuthParams;
  Future<void> saveUserAuthParams(UserAuthParams userAuthParams);
  Future<Res<String>> getAccessToken(String rt);
  void clearPersistedUser(int userId);
}