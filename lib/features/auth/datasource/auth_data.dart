import 'package:elibapp/entity/user_auth_params.dart';

import '../../../entity/res.dart';

abstract class AuthDataSource {
  UserAuthParams? get userAuthParams;
  Future<void> saveUserAuthParams(UserAuthParams userAuthParams);
  Future<Res<String>> getAccessToken();
}