// 这些route是需要持久化保存的，以应对后端api的变化,但是目前先不做这些了
import 'package:elibapp/helper/network/path_collect/aggregated_path.dart';
import 'package:elibapp/helper/network/path_collect/announ_path.dart';
import 'package:elibapp/helper/network/path_collect/auth_path.dart';
import 'package:elibapp/helper/network/path_collect/author_info_path.dart';
import 'package:elibapp/helper/network/path_collect/book_cate_path.dart';
import 'package:elibapp/helper/network/path_collect/book_chart_path.dart';
import 'package:elibapp/helper/network/path_collect/book_info_path.dart';
import 'package:elibapp/helper/network/path_collect/book_reco_path.dart';
import 'package:elibapp/helper/network/path_collect/book_shelf.dart';
import 'package:elibapp/helper/network/path_collect/hist_path.dart';
import 'package:elibapp/helper/network/path_collect/pub_info_path.dart';
import 'package:elibapp/helper/network/path_collect/rb_path.dart';
import 'package:elibapp/helper/network/path_collect/search_path.dart';

import '../../config/network_config.dart';

class NetworkPathCollector {
  static const String host = Configs.HOST;// server host
  static const String userApi = "$host/api/user";// dio的baseUrl，客户端一切请求都是基于这个baseUrl的

  static final AuthPath auth = AuthPath();
  static final BookRecoPath bookReco = BookRecoPath();
  static final AggregatedPath aggregated = AggregatedPath();
  static final BookChartPath bookChart = BookChartPath();
  static final BookInfoPath bookInfo = BookInfoPath();
  static final AnnounPath announce = AnnounPath();
  static final BookCatePath bookCate = BookCatePath();
  static final BookShelfPath bookShelf = BookShelfPath();
  static final RBPath rb = RBPath();
  static final SearchPath search = SearchPath();
  static final AuthorInfoPath author = AuthorInfoPath();
  static final PubInfoPath pub = PubInfoPath();
  static final HistPath hist = HistPath();
}