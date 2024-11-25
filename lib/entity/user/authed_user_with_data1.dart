import 'package:elibapp/entity/user/user_auth_params.dart';
import '../aggregation/user_home_data.dart';
import 'authed_user_with_data.dart';

class AuthedUserWithData1 {

  final UserAuthParams userAuthParams;

  final UserHomeData userHomeData;

  AuthedUserWithData1({
    required this.userAuthParams,
    required this.userHomeData,
  });

  factory AuthedUserWithData1.from(AuthedUserWithData data, int userId) {
    data.userHomeData.setUserIdAndOrder(userId);
    return AuthedUserWithData1(
      userAuthParams: UserAuthParams.fromAuthedUser(data.user),
      userHomeData: data.userHomeData,
    );
  }
}
