import 'package:elibapp/entity/user_auth_params.dart';

import '../../../entity/res.dart';

abstract class UserVerifyData {
  Future<Res<UserAuthParams>> verifyEmailPwd(String email, String pwd);
  Future<Res<void>> sendEmailCode(String email);
  Future<Res<UserAuthParams>> verifyEmailCode(String email, String code);
}