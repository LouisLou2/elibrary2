import 'dart:async';
import 'package:elibapp/features/viewing_history/bloc/control/vb_hist_control_bloc.dart';
import 'package:elibapp/features/viewing_history/page/viewing_hist_kw.dart';
import 'package:elibapp/features/viewing_history/page/viewing_hist_time.dart';
import 'package:elibapp/shared/widget/util_widget/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helper/nav/navigation_helper.dart';
import '../bloc/control/vb_hist_control_event.dart';
import '../bloc/control/vb_hist_control_state.dart';

class ViewingHistoryPage extends StatefulWidget{
  const ViewingHistoryPage({super.key});

  @override
  State<StatefulWidget> createState()=>_PubPageState();
}

class _PubPageState extends State<ViewingHistoryPage>{

  Timer? _searchThrottleTimer;
  ValueNotifier<bool> byTime = ValueNotifier(true);
  PageController _pageController = PageController();
  
  @override
  void dispose(){
    _searchThrottleTimer?.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    // 从路由中获取参数
    return BlocProvider(
      create: (context) => VbHistControlBloc(),
      child: BlocBuilder<VbHistControlBloc, VbHistControlState>(
        builder: (context, state){
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              centerTitle: true,
              toolbarHeight: 45,
              title: const Text(
                "浏览记录",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => NavigationHelper.pop(context),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 10),
                  child: SearchBar(
                    hintText: '搜索浏览记录',
                    hintStyle: WidgetStateProperty.all(
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    constraints: const BoxConstraints(
                      maxHeight: 50,
                      minHeight: 40,
                    ),
                    backgroundColor: WidgetStateProperty.all(Theme.of(context).hoverColor),
                    elevation: WidgetStateProperty.all(0),
                    onTap: (){},
                    onChanged: (value)=> _searchThrottle(context, value),
                    onSubmitted: (value){},
                  ),
                ),
                Expanded(
                  child: BlocListener<VbHistControlBloc, VbHistControlState>(
                    listener: (context, state){
                      if (state == VbHistControlState.byTime){
                        _pageController.jumpToPage(0);
                      }else{
                        _pageController.jumpToPage(1);
                      }
                    },
                    child: PageView(
                      controller: _pageController,
                      children: [
                        const KeepAliveWrapper(
                          child: ViewingHistTime(),
                        ),
                        BlocBuilder<VbHistControlBloc, VbHistControlState>(
                          buildWhen: (previous, current) => current == VbHistControlState is VbHistByKeyword,
                          builder: (context, state){
                            if (state is VbHistByKeyword){
                              return ViewingHistKw(state.keyword,);
                            }
                            throw Exception('Unexpected state: $state');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _searchThrottle(BuildContext con, String keyword){
    _searchThrottleTimer?.cancel();
    _searchThrottleTimer = Timer(const Duration(milliseconds: 400),
      () => con.read<VbHistControlBloc?>()?.add(VbHistReportKeyword(keyword)),
    );
  }
}