import 'package:elibapp/entity/user/authed_user_with_data1.dart';

sealed class SignInEvent{
  static const UsePwd usePwd = UsePwd();
  static const UseEmailCode useEmailCode = UseEmailCode();
  static const SendCodeSuccess sendCodeSuccess = SendCodeSuccess();
  static const CountSecond countSecond = CountSecond();


  const SignInEvent();
}

// 要求使用邮箱+密码的方式登录
class UsePwd extends SignInEvent{
  const UsePwd();
}

// 要求使用邮箱+验证码的方式登录
class UseEmailCode extends SignInEvent{
  const UseEmailCode();
}


// 给出邮箱和密码
class GiveEmailPwd extends SignInEvent{
  final String email;
  final String pwd;
  const GiveEmailPwd(this.email, this.pwd);
}

// 给出验证码
class GiveEmailCode extends SignInEvent{
  final String code;
  const GiveEmailCode(this.code);
}



// 要求发送邮箱验证码
class ReqCode extends SignInEvent{
  final String? email;
  const ReqCode(this.email);
}

class CountSecond extends SignInEvent{
  const CountSecond();
}

class SendCodeSuccess extends SignInEvent{
  const SendCodeSuccess();
}

class VerifySuccess extends SignInEvent{
  final AuthedUserWithData1 data;
  const VerifySuccess(this.data);
}
