import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/entity/struct/load_signal.dart';

import '../const/chart_type.dart';

abstract class ChartRepo {

  // 此函数用于将数据第一次加载到本地，如果本地已经有了数据，就不用再加载了
  void initRepoWithLocalData(ChartType type);
  Future<ResCodeEnum> refreshListWithNet(ChartType type);
  // 表示这个chart type的数据是否已经从网络加载过了
  bool isListLoadedWithNet(ChartType type);
  Future<LoadSignal> loadMoreListWithNet(ChartType type);
  int lengthInMemCount(ChartType type);
  BookBriefAbs? getBookByIndexMem(ChartType type, int index);
}