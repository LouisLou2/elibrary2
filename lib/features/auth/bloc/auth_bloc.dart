import 'package:elibapp/features/auth/datasource/auth_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  static late AuthState _initialState;
  static set initialState(AuthState state) => _initialState = state;

  final AuthDataSource _authds = GetIt.I.get<AuthDataSource>();

  AuthBloc(): super(AuthBloc._initialState){

    on<AuthEvent>((event, emit) {

    });

  }
}