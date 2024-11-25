import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:elibapp/features/home/page/home_page.dart';
import 'package:elibapp/helper/network/net_path_collector.dart';
import 'package:elibapp/shared/page/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../home/bloc/home_page_bloc.dart';
import '../../home/bloc/home_page_state.dart';
import '../../sign_in/page/auth_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: GetIt.I<UserStateRepo>(),
      child: BlocProvider.value(
        value: GetIt.I<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            if (state == AuthState.userLoggedOut){
              return const AuthPages();
            }
            assert (state is UserLoggedInNet || state is UserLoadedLocal);
            return BlocProvider<HomePageBloc>(
              lazy: false, // 注意，这里一定要在child之前就把bloc创建好，其他大部分情况都是lazy的
              create: (context) => HomePageBloc(
                state is UserLoadedLocal ? HomePageState.homePageRefreshedLocal : HomePageInit((state as UserLoggedInNet).userHomeData),
              ),
              child: const HomePage(),
            );
            // return const ErrorPage();
          }
        ),
      ),
    );
  }
}