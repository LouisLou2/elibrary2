import 'package:equatable/equatable.dart';

sealed class SignInState extends Equatable{

  // 直接使用static持久的对象，不每次都new instance的前提是，保证不会连续发出两个一样的状态
  // 如果在之后的开发中不满足了，就需要改为每次new instance
  static const TypingEmailPwd typingEmailPwd = TypingEmailPwd();
  static const TypingEmail typingEmail = TypingEmail();
  static const TypingEmailCode waitingResend = TypingEmailCode(0);

  final int timeLeft;
  const SignInState({this.timeLeft=0});
  @override
  List<Object?> get props => [timeLeft]; // 生成的==形式是：identical(this, other) || other is SignInState && runtimeType == other.runtimeType;
}

// 用户正在尝试使用邮箱+密码的方式登录
class TypingEmailPwd extends SignInState{
  const TypingEmailPwd();
}

// 用户正在位于输入邮箱的界面
class TypingEmail extends SignInState{
  const TypingEmail();
}

// 用户正在等待验证码并输入
class TypingEmailCode extends SignInState{
  const TypingEmailCode(int timeLef): super(timeLeft:timeLef);
}