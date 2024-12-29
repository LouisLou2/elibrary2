
import '../../../entity/user/authed_user_with_data1.dart';
sealed class AuthEvent {
  const AuthEvent();
  static const LogoutEvent logout = LogoutEvent();
  static const reqToAuthEvent reqToAuth = reqToAuthEvent();
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class LoginEvent extends AuthEvent {
  final AuthedUserWithData1 data;
  const LoginEvent(this.data);
}

class reqToAuthEvent extends AuthEvent {
  const reqToAuthEvent();
}