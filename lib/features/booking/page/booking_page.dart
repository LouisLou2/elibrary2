import 'dart:ui';
import 'package:elibapp/features/theme/bloc/theme_bloc.dart';
import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widget/spec/image_widget.dart';
import '../../../util/format_tool.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  @override
  void initState() {
    super.initState();
  }

  void _reserveTheBook() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:Stack(
        children: <Widget>[
          // 背景图片
          Positioned.fill(
            child: getCustomCachedImage(
              url: 'http://10.0.2.2:9022/elib/cate_cover/pics/10000.png'
            ),
          ),
          // 模糊效果
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: context.read<ThemeBloc>().mode == ThemeMode.light ? Colors.black.withOpacity(0.05) : Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            bottom: 70,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6, // 控制容器高度为屏幕的50%
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 150),
                  Text(
                    'Dart Apprentice',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      letterSpacing: -0.8,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'What Gatue',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      letterSpacing: -0.8,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: false ? null : ()=> _showDialog(
                          CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: 32,
                            // This sets the initial item.
                            scrollController: FixedExtentScrollController(
                              initialItem: 1,
                            ),
                            onSelectedItemChanged: (index) {

                            },
                            children: List.generate(2, (index) =>
                                Center(
                                  child: Text(
                                    'One Library',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ),
                        child: Text(
                          false?'暂无资源':'jiohj',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child:
                    Text(
                      '选择归还时间',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Flexible(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          SizedBox(
                            width: 100,
                            child: ListWheelScrollView(
                              onSelectedItemChanged: (index){},
                              itemExtent: 40,
                              diameterRatio: 1,
                              useMagnifier: true,
                              magnification: 1.5,
                              children: List.generate(3, (index) {
                                String dayStr = '';
                                if(index==0){
                                  dayStr = 'TODAY';
                                }else{
                                  dayStr = FormatTool.monthDayStr(DateTime.now());
                                }
                                return Text(dayStr,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    letterSpacing: -2,
                                  ),
                                );
                              }
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: ListWheelScrollView(
                              itemExtent: 40,
                              diameterRatio: 1,
                              useMagnifier: true,
                              magnification: 1.4,
                              onSelectedItemChanged: (index){},
                              children: List.generate(6, (index) {
                                return Text(FormatTool.hourStr(12),
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ]
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child:FilledButton(
                          style: ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
                              ),
                            ),
                            padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                              EdgeInsets.symmetric(vertical: 13),
                            ),
                          ),
                          onPressed: _reserveTheBook,
                          child: Text(
                            '预约',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 4,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 页面内容
          Positioned(
            left: 72,
            right: 72,
            top: 45,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4, // 控制容器高度为屏幕的50%
              // decoration: BoxDecoration(
              //   boxShadow: [
              //     BoxShadow(
              //       color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              //       blurRadius: 10,
              //       spreadRadius: 5,
              //     ),
              //   ],
              //   image: const DecorationImage(
              //     image: NetworkImage(
              //       'https://m.media-amazon.com/images/I/61KQ4EoU3IS._SL1360_.jpg',
              //     ),
              //     fit: BoxFit.cover,
              //   ),
              //   borderRadius: BorderRadius.circular(20),
              // ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(UiSize.border.smallBorderR),
                child: getCustomCachedImage(
                  url: 'http://10.0.2.2:9022/elib/cate_cover/pics/10000.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) =>
          Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            // The Bottom margin is provided to align the popup above the system navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom,
            ),
            // Provide a background color for the popup.
            color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: child,
            ),
          ),
    );
  }
}