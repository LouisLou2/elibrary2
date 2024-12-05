import 'package:elibapp/features/announ/page/announce_list_page.dart';
import 'package:elibapp/features/announ_content/page/announ_content_page.dart';
import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:elibapp/features/book_view/page/book_view_loading.dart';
import 'package:elibapp/features/book_view/page/book_view_page.dart';
import 'package:elibapp/features/browse/page/browse_page.dart';
import 'package:elibapp/features/chart/page/chart_page.dart';
import 'package:elibapp/features/home/page/home_page.dart';
import 'package:elibapp/features/main_tab/page/main_tab_page.dart';
import 'package:elibapp/shared/page/try_reload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../helper/nav/navigation_helper.dart';
import '../../../helper/nav/route_generator.dart';
import '../../home/bloc/home_page_bloc.dart';
import '../../home/bloc/home_page_state.dart';
import '../../sign_in/page/auth_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('@@@@@@@@@@@@entrance page build');
    return RepositoryProvider.value(
      value: GetIt.I<UserStateRepo>(),
      child: BlocProvider.value(
        value: GetIt.I<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            print('@@@@@@@@@@@@auh bloc builder: $state');
            if (state == AuthState.userLoggedOut){
              return const AuthPages();
            }
            assert (state is UserLoggedInNet || state is UserLoadedLocal);
            return Navigator(
              initialRoute: '/main',
              key: NavigationHelper.key,
              onGenerateRoute: RouteGenerator.generateRoute,
              observers: [NavigationHelper.observer],
            );
            // return const ErrorPage();
          }
        ),
      ),
    );
  }
}