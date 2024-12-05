class AuthPath{
  late final String base;
  late final String loginPwd;
  late final String loginCode;
  late final String sendCode;
  late final String retrieveAt;

  AuthPath(){
    base = "/auth";
    loginPwd = "$base/login/email_pwd";
    loginCode = "$base/login/email_code";
    sendCode = "$base/send_verify_code";
    retrieveAt = "$base/token/refresh_at";
  }
}