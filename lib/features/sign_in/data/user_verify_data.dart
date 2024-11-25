import 'package:elibapp/entity/req/home_data_req.dart';
import 'package:elibapp/entity/user/authed_user_with_data.dart';

import '../../../entity/struct/res.dart';

abstract class UserVerifyData {
  Future<Res<AuthedUserWithData>> verifyEmailPwd(String email, String pwd, HomeDataReq homeDataReq);
  Future<Res<void>> sendEmailCode(String email);
  Future<Res<AuthedUserWithData>> verifyEmailCode(String email, String code, HomeDataReq homeDataReq);
}