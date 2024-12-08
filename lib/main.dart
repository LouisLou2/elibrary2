import 'package:elibapp/features/auth/page/entrance_page.dart';
import 'package:elibapp/init/init_affairs.dart';
import 'package:elibapp/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:toastification/toastification.dart';
import 'features/theme/bloc/theme_bloc.dart';
import 'features/theme/bloc/theme_state.dart';
import 'helper/nav/navigation_helper.dart';


void main() async{
  await initBeforeRunApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    print('@@@@@@@@@@app build');
    return ToastificationWrapper(
      child: BlocProvider(
        create: (context) => ThemeBloc(const LightThemeState()),
        lazy: false,
        child: BlocBuilder<ThemeBloc, ThemeState>(
          buildWhen: (previous, current) {
            print('@@@@@@@@@ThemeBloc buildWhen: $previous, $current');
            return previous != current;
          },
          builder: (context, state) {
            print('@@@@@@@@@ThemeState: $state');
            ThemeMode mode = state.getThemeMode();
            SystemChrome.setSystemUIOverlayStyle(
              AppTheme.getSystemUiOverlayStyle(mode, mode == ThemeMode.dark? AppTheme.dark : AppTheme.light),
            );
            return MaterialApp(
              // base appearance
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              // theme
              themeMode: mode,
              darkTheme: AppTheme.dark,
              theme: AppTheme.light,
              // initial page
              home: const EntrancePage(),
              // ui tools:
              builder: (context, child) {
                print('@@@@@@@@@MaterialApp builder');
                TransitionBuilder loadingWrapper = EasyLoading.init();
                var toastProv = ToastificationConfigProvider(
                  config: const ToastificationConfig(
                    alignment: Alignment.center,
                    itemWidth: 440,
                    animationDuration: Duration(milliseconds: 300),
                  ),
                  child: child!,
                );
                return loadingWrapper(context, toastProv);
              },
            );
          },
        ),
      ),
    );
  }
}