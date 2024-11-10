import 'package:elibapp/entity/user_auth_params.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class TryUsingPwdEvent extends AuthEvent {
  TryUsingPwdEvent();
}

class TryUsingEmailCodeEvent extends AuthEvent {
  TryUsingEmailCodeEvent();
}

class LoginEvent extends AuthEvent {
  final UserAuthParams userAuthParams;

  const LoginEvent(this.userAuthParams);
}