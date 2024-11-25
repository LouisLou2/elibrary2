
import '../../../entity/user/authed_user_with_data1.dart';
import '../../../entity/user/user_auth_params.dart';

sealed class AuthEvent {
  const AuthEvent();
  static const LogoutEvent logout = LogoutEvent();
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

class LoginEvent extends AuthEvent {
  final AuthedUserWithData1 data;
  const LoginEvent(this.data);
}