sealed class AuthState {
  static const UserLogUnknown userLogUnknown = UserLogUnknown();
  static const UserDataLoaded userDataLoaded = UserDataLoaded();
  static const UserLoggedOut userLoggedOut = UserLoggedOut();
  static const UserLoggedIn userLoggedIn = UserLoggedIn();
  
  
  const AuthState();
  // ==
  @override
  bool operator ==(Object other) =>
      other is AuthState && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}

// 从本地读取到了用户数据，但是还未与服务器验证
class UserDataLoaded extends AuthState {
  const UserDataLoaded();
}
// 本地确实有用户信息记录，但是无法连接到服务器，不知道用户是否登录
class UserLogUnknown extends AuthState {
  const UserLogUnknown();
}

// 本地没有了用户信息记录，比如：本地本来就没有用户信息记录，或者用户主动退出登录，或者与服务器交互后发现登录过期
class UserLoggedOut extends AuthState {
  const UserLoggedOut();
}
// 与服务器验证通过，用户登录成功
class UserLoggedIn extends AuthState {
  const UserLoggedIn();
}