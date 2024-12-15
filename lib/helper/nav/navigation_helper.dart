import 'package:elibapp/common/rb_record_type.dart';
import 'package:elibapp/entity/book/book_signal.dart';
import 'package:elibapp/features/chart/const/chart_type.dart';
import 'package:elibapp/helper/nav/route_generator.dart';
import 'package:flutter/material.dart';

import 'navigation_observer.dart';

class NavigationHelper{
  const NavigationHelper._();
  // 此类不应该被实例化
  static final _key = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get key =>_key;
  static final observer = MyObserver();



  static bool _setted = false;
  static late String mainPageNav;

  static late String announListPageNav;
  static late String announDetailNav;

  static late String bookViewPageNav;
  static late String bookChartPageNav;

  static late String categoryPageNav;

  static late String rbRecordPageNav;
  static late String rbDetailPageNav;

  static late Map<String, WidgetBuilder> _routes;

  static void init({
    required String mainPageNav,
    required WidgetBuilder mainPageBuilder,

    required String announListPageNav,
    required WidgetBuilder announListPageBuilder,

    required String bookViewPageNav,
    required WidgetBuilder bookViewPageBuilder,

    required String announDetailNav,
    required WidgetBuilder announDetailBuilder,

    required String bookChartPageNav,
    required WidgetBuilder bookChartPageBuilder,

    required String categoryPage,
    required WidgetBuilder categoryPageBuilder,

    required String rbRecordPageNav,
    required WidgetBuilder rbRecordPageBuilder,

    required String rbDetailPageNav,
    required WidgetBuilder rbDetailPageBuilder,
  }) {
    assert(!_setted);
    NavigationHelper.mainPageNav = mainPageNav;
    NavigationHelper.announListPageNav = announListPageNav;
    NavigationHelper.bookViewPageNav = bookViewPageNav;
    NavigationHelper.announDetailNav = announDetailNav;
    NavigationHelper.bookChartPageNav = bookChartPageNav;
    NavigationHelper.categoryPageNav = categoryPage;
    NavigationHelper.rbRecordPageNav = rbRecordPageNav;
    NavigationHelper.rbDetailPageNav = rbDetailPageNav;
    _routes = {
      mainPageNav: mainPageBuilder,

      announListPageNav: announListPageBuilder,
      announDetailNav: announDetailBuilder,

      bookViewPageNav: bookViewPageBuilder,

      bookChartPageNav: bookChartPageBuilder,
      categoryPage: categoryPageBuilder,

      rbRecordPageNav: rbRecordPageBuilder,
      rbDetailPageNav: rbDetailPageBuilder,
    };
    _setted = true;
    RouteGenerator.init(_routes);
  }

  static Future<T?>? pushNamed<T extends Object>(String routeName,{Object? arguments,}){
    return _key.currentState?.pushNamed<T?>(
      routeName,
      arguments: arguments,
    );
  }
  static Future<T?>? pushReplacementNamed<T extends Object>(String routeName,{Object? arguments,}){
    return _key.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }
  static void pop<T extends Object?>([T? result]){
    return _key.currentState?.pop(result);
  }
  static Future<Object?>? popAllAndPushNamed(String routeName){
    return _key.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  static Future<Object?>? toAnnounList(){
    return pushNamed(announListPageNav);
  }

  static Future<Object?>? toAnnounDetail({
    required int id,
  }){
    return pushNamed(announDetailNav, arguments: id);
  }

  static Future<Object?>? toBookView({
    required String isbn,
    String? coverUrl,
  }){
    return pushNamed(bookViewPageNav, arguments: BookSignal(isbn: isbn, coverUrl: coverUrl));
  }

  static Future<Object?>? toBookChart(ChartType type){
    return pushNamed(bookChartPageNav, arguments: type);
  }

  static Future<Object?>? toCategoryPage(){
    return pushNamed(categoryPageNav);
  }

  static Future<Object?>? toRBDetailPage(int reserveId){
    return pushNamed(rbDetailPageNav, arguments: reserveId);
  }

  static Future<Object?>? toRBRecordPage(RBRecordType type){
    return pushNamed(rbRecordPageNav, arguments: type);
  }
}