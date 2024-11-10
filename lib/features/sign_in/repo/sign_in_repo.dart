import '../../../entity/res.dart';

abstract class SignInRepo {

  set nowEmail(String email);
  String get nowEmail;
  void noteSendEmailCodeTime(String email);
  int get secLeft;

  Future<Res<void>> verifyEmailPwdAndSaveUser(String email, String pwd);
  Future<Res<void>> sendEmailCode(String email);
  Future<Res<void>> resendEmailCode();
  Future<Res<void>> verifyEmailCodeAndSaveUser(String email, String code);
}