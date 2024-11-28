import '../../../entity/struct/res.dart';
import '../../../entity/user/authed_user_with_data1.dart';

abstract class SignInRepo {

  set nowEmail(String email);
  String get nowEmail;
  void noteSendEmailCodeTime(String email);
  int get secLeft;

  Future<Res<AuthedUserWithData1>> verifyEmailPwd(String email, String pwd);
  Future<Res<void>> sendEmailCode(String email);
  Future<Res<void>> resendEmailCode();
  Future<Res<AuthedUserWithData1>> verifyEmailCode(String email, String code);
}