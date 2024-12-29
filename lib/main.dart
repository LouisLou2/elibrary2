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
              showPerformanceOverlay: false,
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
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Multi-Select GridView',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MultiSelectGridView(),
//     );
//   }
// }
//
// class MultiSelectGridView extends StatefulWidget {
//   @override
//   _MultiSelectGridViewState createState() => _MultiSelectGridViewState();
// }
//
// class _MultiSelectGridViewState extends State<MultiSelectGridView> {
//   bool isSelecting = false;
//   List<bool> selectedItems = List.generate(20, (index) => false); // 初始每个项都未选中
//
//   void toggleSelection(int index) {
//     setState(() {
//       selectedItems[index] = !selectedItems[index];
//     });
//   }
//
//   void enterMultiSelectMode() {
//     setState(() {
//       isSelecting = true;
//     });
//   }
//
//   void exitMultiSelectMode() {
//     setState(() {
//       isSelecting = false;
//       selectedItems = List.generate(20, (index) => false); // 清除所有选中状态
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Multi-Select GridView'),
//         actions: [
//           if (isSelecting)
//             IconButton(
//               icon: Icon(Icons.check),
//               onPressed: exitMultiSelectMode,
//             ),
//         ],
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           childAspectRatio: 1,
//         ),
//         itemCount: 20, // 这里假设有20个项
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onLongPress: enterMultiSelectMode,
//             onTap: isSelecting ? () => toggleSelection(index) : null,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 // 使用 ColorFiltered 添加灰色滤镜
//                 ColorFiltered(
//                   colorFilter: ColorFilter.mode(
//                     selectedItems[index] ? Colors.black38 : Colors.transparent,
//                     BlendMode.darken
//                   ),
//                   child: Positioned.fill(
//                     child: Image.network('https://cdn.pixabay.com/photo/2024/09/19/07/30/wild-horse-9057944_1280.jpg', fit: BoxFit.cover,)
//                   ),
//                 ),
//                 if (selectedItems[index])
//                   const Positioned(
//                     bottom: 1,
//                     right: 8,
//                     child: Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                       size: 32,
//                     ),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }