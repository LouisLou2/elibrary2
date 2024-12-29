import 'package:elibapp/common/rb_record_type.dart';
import 'package:elibapp/entity/book/book_info.dart';
import 'package:elibapp/entity/book/book_signal.dart';
import 'package:elibapp/entity/struct/rb_detail_signal.dart';
import 'package:elibapp/features/chart/const/chart_type.dart';
import 'package:elibapp/helper/nav/route_generator.dart';
import 'package:flutter/material.dart';

import '../../entity/reserve_borrow/rb_detail.dart';
import '../../entity/struct/sub_cate_book_signal.dart';
import 'navigation_observer.dart';

class NavigationHelper{
  const NavigationHelper._();
  // 此类不应该被实例化
  static final _key = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> get key =>_key;
  static final observer = MyObserver();

  static bool _setted = false;
  static late String mainPageNav;

  static late String authPageNav;

  static late String announListPageNav;
  static late String announDetailNav;

  static late String bookViewPageNav;
  static late String bookPreviewPageNav;
  static late String bookChartPageNav;

  static late String categoryPageNav;

  static late String rbRecordPageNav;
  static late String rbDetailPageNav;

  static late String bookingPageNav;

  static late String subCateBooksPageNav;

  static late String searchPageNav;

  static late String authorInfoPageNav;

  static late String pubInfoPageNav;

  static late String bookViewingHistoryPageNav;

  static late String hitCateDetailPageNav;

  static late String settingPageNav;


  static late Map<String, WidgetBuilder> _routes;

  static void init({
    required String mainPageNav,
    required WidgetBuilder mainPageBuilder,

    required String authPageNav,
    required WidgetBuilder authPageBuilder,

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

    required String bookingPageNav,
    required WidgetBuilder bookingPageBuilder,

    required String bookPreviewPageNav,
    required WidgetBuilder bookPreviewPageBuilder,

    required String subCateBooksPageNav,
    required WidgetBuilder subCateBooksPageBuilder,

    required String searchPageNav,
    required WidgetBuilder searchPageBuilder,

    required String authorInfoPageNav,
    required WidgetBuilder authorInfoPageBuilder,

    required String pubInfoPageNav,
    required WidgetBuilder pubInfoPageBuilder,

    required String bookViewingHistoryPageNav,
    required WidgetBuilder bookViewingHistoryPageBuilder,

    required String hitCateDetailPageNav,
    required WidgetBuilder hitCateDetailPageBuilder,

    required String settingPageNav,
    required WidgetBuilder settingPageBuilder,
  }) {
    assert(!_setted);
    NavigationHelper.mainPageNav = mainPageNav;
    NavigationHelper.authPageNav = authPageNav;
    NavigationHelper.announListPageNav = announListPageNav;
    NavigationHelper.bookViewPageNav = bookViewPageNav;
    NavigationHelper.announDetailNav = announDetailNav;
    NavigationHelper.bookChartPageNav = bookChartPageNav;
    NavigationHelper.categoryPageNav = categoryPage;
    NavigationHelper.rbRecordPageNav = rbRecordPageNav;
    NavigationHelper.rbDetailPageNav = rbDetailPageNav;
    NavigationHelper.bookingPageNav = bookingPageNav;
    NavigationHelper.bookPreviewPageNav = bookPreviewPageNav;
    NavigationHelper.subCateBooksPageNav = subCateBooksPageNav;
    NavigationHelper.searchPageNav = searchPageNav;
    NavigationHelper.authorInfoPageNav = authorInfoPageNav;
    NavigationHelper.pubInfoPageNav = pubInfoPageNav;
    NavigationHelper.bookViewingHistoryPageNav = bookViewingHistoryPageNav;
    NavigationHelper.hitCateDetailPageNav = hitCateDetailPageNav;
    NavigationHelper.settingPageNav = settingPageNav;
    _routes = {
      mainPageNav: mainPageBuilder,

      authPageNav: authPageBuilder,

      announListPageNav: announListPageBuilder,
      announDetailNav: announDetailBuilder,

      bookViewPageNav: bookViewPageBuilder,

      bookChartPageNav: bookChartPageBuilder,
      categoryPage: categoryPageBuilder,

      rbRecordPageNav: rbRecordPageBuilder,
      rbDetailPageNav: rbDetailPageBuilder,

      bookingPageNav: bookingPageBuilder,
      bookPreviewPageNav: bookPreviewPageBuilder,

      subCateBooksPageNav: subCateBooksPageBuilder,

      searchPageNav: searchPageBuilder,

      authorInfoPageNav: authorInfoPageBuilder,

      pubInfoPageNav: pubInfoPageBuilder,

      bookViewingHistoryPageNav: bookViewingHistoryPageBuilder,

      hitCateDetailPageNav: hitCateDetailPageBuilder,

      settingPageNav: settingPageBuilder,
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

  static Future<Object?>? toAuthPage(){
    return pushNamed(authPageNav);
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
    return pushNamed(rbDetailPageNav, arguments: RBDetailSignal(reserveId));
  }

  static Future<Object?>? replaceToRBDetailPage(RBDetail detail){
    return pushReplacementNamed(rbDetailPageNav, arguments: RBDetailSignal.useDetail(detail));
  }

  static Future<Object?>? toRBRecordPage(RBRecordType type){
    return pushNamed(rbRecordPageNav, arguments: type);
  }
  static Future<Object?>? toBookingPage(BookInfo info){
    return pushNamed(bookingPageNav, arguments: info);
  }

  static Future<Object?>? toBookPreviewPage(String ebookUrl){
    return pushNamed(bookPreviewPageNav, arguments: ebookUrl);
  }

  static Future<Object?>? toSubCateBooksPage(SubCateBookSignal signal){
    return pushNamed(subCateBooksPageNav, arguments: signal);
  }

  static Future<Object?>? toSearchPage(){
    return pushNamed(searchPageNav);
  }

  static Future<Object?>? toAuthorInfoPage(int authorId){
    return pushNamed(authorInfoPageNav, arguments: authorId);
  }

  static Future<Object?>? toPubInfoPage(int pubId){
    return pushNamed(pubInfoPageNav, arguments: pubId);
  }

  static Future<Object?>? toBookViewingHistoryPage(){
    return pushNamed(bookViewingHistoryPageNav);
  }

  static Future<Object?>? toHitCateDetailPage(int cateId){
    return pushNamed(hitCateDetailPageNav, arguments: cateId);
  }

  static Future<Object?>? toSettingPage(){
    return pushNamed(settingPageNav);
  }
}