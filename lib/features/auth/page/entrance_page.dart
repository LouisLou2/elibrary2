import 'package:elibapp/helper/network/net_path_collector.dart';
import 'package:elibapp/shared/page/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../sign_in/page/auth_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) {
        print('[buildWhen]@@@@@@@@@@@@@@@@@@previous: $previous, current: $current');
        return previous != current;
      },
      builder: (context, state) {
        print('[builder]@@@@@@@@@@@@@@@@@@state: $state');
        if (state == AuthState.userLoggedOut){
          return const AuthPages();
        }
        return const ErrorPage();
      }
    );
  }
}