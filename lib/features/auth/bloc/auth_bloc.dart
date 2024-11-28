import 'package:elibapp/features/auth/repo/user_state_repo.dart';
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
      _userStateRepo.clearUser();
      emit(AuthState.userLoggedOut);
    });

  }


}