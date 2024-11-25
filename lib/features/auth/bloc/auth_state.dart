import 'package:elibapp/entity/aggregation/user_home_data.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable{
  static const UserLoggedOut userLoggedOut = UserLoggedOut();
  static const UserLoadedLocal userLoadedLocal = UserLoadedLocal();

  const AuthState();

  @override
  List<Object> get props => [];
}


// 本地没有了用户信息记录，比如：本地本来就没有用户信息记录，或者用户主动退出登录，或者与服务器交互后发现登录过期
class UserLoggedOut extends AuthState {
  const UserLoggedOut();
}

class UserLoadedLocal extends AuthState {
  const UserLoadedLocal();
}

// 与服务器验证通过，用户登录成功
class UserLoggedInNet extends AuthState {
  final UserHomeData userHomeData;
  const UserLoggedInNet(this.userHomeData);
}