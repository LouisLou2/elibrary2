import 'package:animations/animations.dart';
import 'package:elibapp/features/sign_in/repo/sign_in_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../bloc/sign_in_bloc.dart';
import '../bloc/sign_in_state.dart';
import 'check_code_page.dart';
import 'email_pwd_sign_page.dart';
import 'enter_email_page.dart';

class AuthPages extends StatefulWidget{
  const AuthPages({super.key});

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {
  //使用它，可以在表单组件的外部使用表单状态

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget getPageBySignInState(SignInState state){
    if (state is TypingEmailPwd) {
      return const SignInPage();
    } else if (state is TypingEmail) {
      return const EnterEmailPage();
    } else if (state is TypingEmailCode) {
      return const EnterVeriCodePage();
    } else {
      throw Exception('Unknown state: $state');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: RepositoryProvider.value(
        value: GetIt.I<SignInRepo>(),
        child: BlocProvider(
          create: (context) => SignInBloc(),
          child: BlocBuilder<SignInBloc, SignInState>(
            buildWhen: (previous, current){
              // 这里应该是，二者的runtimeType不同
              return previous.runtimeType != current.runtimeType;
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
            },
          ),
        ),
      )
    );
  }
}