
import 'package:elibapp/features/theme/bloc/theme_event.dart';
import 'package:elibapp/features/theme/bloc/theme_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(super.initialState){
    on<ToggleThemeEvent>((event, emit) {
      if (kDebugMode) {
        print('[ThemeBloc on]@@@@@@@@@@@@@@@@@@event: $event');
      }
      emit(state is LightThemeState ? ThemeState.dark : ThemeState.light);
    });
  }
}