import 'package:elibapp/entity/aggregation/user_home_data.dart';
import 'package:elibapp/entity/user/user_auth_params.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable{
  const AuthState();

  static const UserNowAuthing userNowAuthing = UserNowAuthing();
  static const UserOnBoard userOnBoard = UserOnBoard();

  @override
  List<Object> get props => [];
}

class UserOnBoard extends AuthState {
  const UserOnBoard();
}

// 本地没有了用户信息记录，比如：本地本来就没有用户信息记录，或者用户主动退出登录，或者与服务器交互后发现登录过期
class UserNowAuthing extends AuthState {
  const UserNowAuthing();
}

class UserLoadedLocal extends AuthState {
  final UserAuthParams user;
  const UserLoadedLocal(this.user);
}

// 与服务器验证通过，用户登录成功
class UserLoggedInNet extends AuthState {
  final UserHomeData userHomeData;
  const UserLoggedInNet(this.userHomeData);
}