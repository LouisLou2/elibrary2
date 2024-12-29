import 'package:elibapp/features/announ/page/announce_list_page.dart';
import 'package:elibapp/features/announ_content/page/announ_content_page.dart';
import 'package:elibapp/features/auth/bloc/auth_bloc.dart';
import 'package:elibapp/features/book_preview/page/book_viewer.dart';
import 'package:elibapp/features/book_view/page/book_view_page.dart';
import 'package:elibapp/features/categories/page/cate_page.dart';
import 'package:elibapp/features/chart/page/chart_page.dart';
import 'package:elibapp/features/main_tab/page/main_tab_page.dart';
import 'package:elibapp/features/publisher_info/page/pub_info_page.dart';
import 'package:elibapp/features/rb_detail/page/rb_detail_page.dart';
import 'package:elibapp/features/reserve_borrow_record/page/rb_record_page.dart';
import 'package:elibapp/features/setting/page/setting_page.dart';
import 'package:elibapp/features/viewing_history/page/viewing_history_page.dart';
import 'package:elibapp/helper/nav/navigation_helper.dart';
import 'package:elibapp/init/injection_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../base_manager/db_manager.dart';
import '../base_manager/path_manager.dart';
import '../features/auth/bloc/auth_state.dart';
import '../features/auth/datasource/auth_data.dart';
import '../features/author_info/page/author_info_page.dart';
import '../features/booking/page/booking_page.dart';
import '../features/hit_cate_detail/page/hit_cate_detail_page.dart';
import '../features/search/page/search_page.dart';
import '../features/sign_in/page/auth_page.dart';
import '../features/sub_cate_book/page/sub_cate_book_page.dart';

GetIt getIt = GetIt.I;

Future<void> initBeforeRunApp() async {
  // route_collector
  setRouteCollection();
  WidgetsFlutterBinding.ensureInitialized();
  // path_manager
  await PathManager.init();
  // db_manager
  await DBManager.init();
  // singleton
  InjectionManager.inject();
  // detectUserLocal
  detectUserLocal();
}

void setRouteCollection() {
  NavigationHelper.init(
      mainPageNav: '/main',
      mainPageBuilder: (context) => const MainTabPage(),

      authPageNav: '/auth',
      authPageBuilder: (context) => const AuthPages(),

      announListPageNav: '/announ/list',
      announListPageBuilder: (context) => const AnnounListPage(),
      announDetailNav: '/announ/detail',
      announDetailBuilder: (context) => const AnnounContentPage(),

      bookViewPageNav: '/book/detail',
      bookViewPageBuilder: (context) => const BookViewPage(),
      bookChartPageNav: '/chart/list',
      bookChartPageBuilder: (context) => const ChartPage(),

      categoryPage: '/category',
      categoryPageBuilder: (context) => const CategoryPage(),

      rbRecordPageNav: '/rb/record',
      rbRecordPageBuilder: (context) => const RBRecordPage(),
      rbDetailPageNav: '/rb/detail',
      rbDetailPageBuilder: (context) => const RBDetailPage(),

      bookingPageNav: '/booking',
      bookingPageBuilder: (context) => const BookingPage(),

      bookPreviewPageNav: '/book/preview',
      bookPreviewPageBuilder: (context) => const EbookPreviewPage(),

      subCateBooksPageNav: '/cates/sub_cate_books',
      subCateBooksPageBuilder: (context) => const SubCateBooksPage(),

      searchPageNav: '/search',
      searchPageBuilder: (context) => const SearchPage(),

      authorInfoPageNav: '/author/info',
      authorInfoPageBuilder: (context) => const AuthorInfoPage(),

      pubInfoPageNav: '/pub/info',
      pubInfoPageBuilder: (context) => const PubInfoPage(),

      bookViewingHistoryPageNav: '/viewing/history',
      bookViewingHistoryPageBuilder: (context) => const ViewingHistoryPage(),

      hitCateDetailPageNav: '/cates/hit_cate_detail',
      hitCateDetailPageBuilder: (context) => const HitCateDetail(),

      settingPageNav: '/setting',
      settingPageBuilder: (context) => const SettingPage(),
  );
}

void detectUserLocal(){
  final userAuthParams = getIt<AuthDataSource>().userAuthParams;
  if (userAuthParams != null) {
    AuthBloc.initialState = UserLoadedLocal(userAuthParams);
  } else {
    AuthBloc.initialState = AuthState.userOnBoard;
  }
}
