import 'package:animations/animations.dart';
import 'package:elibapp/features/auth/page/on_board_page.dart';
import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../helper/nav/navigation_helper.dart';
import '../../../helper/nav/route_generator.dart';
import '../../sign_in/page/auth_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';

class EntrancePage extends StatelessWidget {
  const EntrancePage({super.key});

  Widget getPageBySignInState(AuthState state){
    if (state is UserOnBoard) {
      return const OnBoardPage();
    }
    if (state is UserNowAuthing) {
      return const AuthPages();
    }
    assert (state is UserLoggedInNet || state is UserLoadedLocal);
    return Navigator(
      initialRoute: '/main',
      key: NavigationHelper.key,
      onGenerateRoute: RouteGenerator.generateRoute,
      observers: [NavigationHelper.observer],
    );
  }

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
            return PageTransitionSwitcher(
              transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  ) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                  child: child,
                );
              },
              child: getPageBySignInState(state),
            );
          }
        ),
      ),
    );
  }
}