import 'dart:ui';
import 'package:elibapp/entity/book/book_info.dart';
import 'package:elibapp/entity/struct/time_span.dart';
import 'package:elibapp/features/booking/bloc/booking_bloc.dart';
import 'package:elibapp/features/booking/bloc/booking_event.dart';
import 'package:elibapp/features/theme/bloc/theme_bloc.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/style/ui_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../common/app_strings.dart';
import '../../../entity/lib/lib_time_span.dart';
import '../../../shared/widget/error/reload_widget.dart';
import '../../../shared/widget/spec/image_widget.dart';
import '../../../util/format_tool.dart';
import '../bloc/booking_state.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  ValueNotifier<int> _selectedLibNotifier = ValueNotifier<int>(0);
  ValueNotifier<int> _selectedDateNotifier = ValueNotifier<int>(0);
  int _selectedTimeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _reserveTheBook() {

  }

  @override
  Widget build(BuildContext context) {

    BookInfo info = ModalRoute.of(context)!.settings.arguments as BookInfo;

    return Scaffold(
      appBar: null,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => NavigationHelper.pop(),
        child: const Icon(Icons.arrow_back_ios_rounded),
      ),
      body: BlocProvider(
        create: (context) => BookingBloc(info.isbn),
        child: BlocConsumer<BookingBloc, BookingState>(
          listenWhen: (previous, current) {
            return current is BookingSuccess
                || current is BookingFailed
                || current is BookingWaitForRes;
          },
          buildWhen: (previous, current) {
            return current is BookingLoadingNowNoData ||
                current is BookingRetry ||
                current is BookingLoadedBasicData;
          },
          listener: (context, state) {
            if (state is BookingWaitForRes) {
              EasyLoading.show();
              return;
            }
            if (state is BookingSuccess) {
              EasyLoading.dismiss();
              NavigationHelper.replaceToRBDetailPage(state.detail);
              return;
            }
            if (state is BookingFailed) {
              EasyLoading.dismiss();
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text(state.msg),
                  content: Text(state.msg),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is BookingLoadingNowNoData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is BookingRetry){
              return Center(
                child: ReloadWidget(
                  tile: AppStrs.youOffline,
                  subtitle: AppStrs.tryReconnect,
                  onReload: () {
                    context.read<BookingBloc?>()?.add(BookingEvent.reqReloadBasicsNowNoData);
                  }),
              );
            }
            List<LibTimeSpan> libTimeSpanList = context.read<BookingBloc>().libTimeSpanList!;
            return Stack(
              children: <Widget>[
                // 背景图片
                Positioned.fill(
                  child: getCustomCachedImage(
                    url: info.coverMUrl,
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
                          info.title,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            letterSpacing: -0.8,
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          info.authorNames[0],
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
                              onPressed: () => _showDialog(
                                CupertinoPicker(
                                  magnification: 1.22,
                                  squeeze: 1.2,
                                  useMagnifier: true,
                                  itemExtent: 32,
                                  // This sets the initial item.
                                  scrollController: FixedExtentScrollController(
                                    initialItem: 0,
                                  ),
                                  onSelectedItemChanged: (index) {
                                    _selectedLibNotifier.value = index;
                                  },
                                  children: List.generate(libTimeSpanList.length, (i) =>
                                    Center(
                                      child: Text(
                                        libTimeSpanList[i].libName,
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: Theme.of(context).colorScheme.primary,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              child: ValueListenableBuilder<int>(
                                valueListenable: _selectedLibNotifier,
                                builder: (context, value, child) {
                                  return Text(
                                    libTimeSpanList[value].libName,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 16,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        Center(
                          child:
                          Text(
                            '选择取书时间',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Flexible(
                          child: ValueListenableBuilder<int>(
                            valueListenable: _selectedLibNotifier,
                            builder: (context, value, child) {
                              LibTimeSpan libTimeSpan = libTimeSpanList[value];
                              List<TimeSpan> timeSpanList = libTimeSpan.timeSpans;
                              _selectedDateNotifier.value = 0;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children:[
                                  SizedBox(
                                    width: 100,
                                    child: ListWheelScrollView(
                                      itemExtent: 40,
                                      diameterRatio: 1,
                                      useMagnifier: true,
                                      magnification: 1.5,
                                      children: List.generate(timeSpanList.length, (index) {
                                        String dayStr = FormatTool.monthDayStr(timeSpanList[index].date);
                                        return Text(dayStr,
                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            letterSpacing: -2,
                                          ),
                                        );
                                       }
                                      ),
                                      onSelectedItemChanged: (index){
                                        _selectedDateNotifier.value = index;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: ValueListenableBuilder<int>(
                                      valueListenable: _selectedDateNotifier,
                                      builder: (context, value, child) {
                                        TimeSpan timeSpan = timeSpanList[value];
                                        return ListWheelScrollView(
                                          itemExtent: 40,
                                          diameterRatio: 1,
                                          useMagnifier: true,
                                          magnification: 1.4,
                                          onSelectedItemChanged: (index){
                                            _selectedTimeIndex = index;
                                          },
                                          children: List.generate(timeSpan.hourEnd-timeSpan.hourBegin+1,
                                           (index) {
                                            return Text(FormatTool.hourStr(timeSpan.hourBegin+index),
                                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
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
                                onPressed: ()=>context.read<BookingBloc?>()?.add(
                                  ReqBooking(
                                    _selectedLibNotifier.value,
                                    _selectedDateNotifier.value,
                                    _selectedTimeIndex,
                                  ),
                                ),
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
                        url: info.coverMUrl,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
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