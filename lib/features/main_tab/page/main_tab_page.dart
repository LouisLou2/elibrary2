import 'package:elibapp/features/auth/bloc/auth_bloc.dart';
import 'package:elibapp/features/browse/page/browse_page.dart';
import 'package:elibapp/features/home/page/home_page.dart';
import 'package:elibapp/features/shelf/page/shelf_page.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/bloc/auth_state.dart';
import '../../home/bloc/home_page_bloc.dart';
import '../../home/bloc/home_page_state.dart';

class MainTabPage extends StatefulWidget {

  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController();


  void _onReqChange(int index){
    assert (index >= 0 && index < 4);
    _currentIndex.value = index;
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: PageView.builder(
        itemBuilder: (context, index){
          switch(index){
            case 0:
              AuthBloc authbloc = context.read<AuthBloc>();
              return BlocProvider<HomePageBloc>(
                lazy: false, // 注意，这里一定要在child之前就把bloc创建好，其他大部分情况都是lazy的
                create: (context) => HomePageBloc(
                  authbloc.state is UserLoadedLocal ? HomePageState.homePageRefreshedLocal : HomePageInit((authbloc.state as UserLoggedInNet).userHomeData),
                ),
                child: const HomePage(),
              );
            case 1:
              return const BrowsePage();
            case 2:
              return const ShelfPage();
            case 3:
              return const Center(
                child: Text(
                    'WAITING'
                ),
              );
            default:
              return const Center(
                child: Text(
                  'Logistic Error',
                ),
              );
          }
        },
        itemCount: 4,
        controller: _pageController,
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _currentIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: _onReqChange,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Browse',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Shelf',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}