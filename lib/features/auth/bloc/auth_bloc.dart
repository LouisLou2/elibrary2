import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:elibapp/helper/toast/toast_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  static late AuthState _initialState;
  static set initialState(AuthState state) => _initialState = state;

  final UserStateRepo _userStateRepo = GetIt.I<UserStateRepo>();

  AuthBloc(): super(AuthBloc._initialState){

    if (state is UserLoadedLocal){
      _userStateRepo.setUser((state as UserLoadedLocal).user);
    }

    on<LoginEvent>((event, emit) {
      _userStateRepo.setAndPersistUser(event.data.userAuthParams);
      emit(UserLoggedInNet(event.data.userHomeData));
    });

    on<LogoutEvent>((event, emit) {
      // 使用toast提示用户登录状态已过期
      ToastHelper.warn(title: '登录状态已过期');
      _userStateRepo.clearUser();
      emit(AuthState.userOnBoard);
    });

    on<reqToAuthEvent>((event, emit) {
      emit(AuthState.userNowAuthing);
    });
  }


}