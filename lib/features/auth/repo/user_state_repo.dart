import 'package:elibapp/entity/user_auth_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStateRepo {
  UserAuthParams? userAuthParams;

  bool get isLogin => userAuthParams != null;
}