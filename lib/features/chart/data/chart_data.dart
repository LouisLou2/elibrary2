import '../../../entity/book/book_brief_abs.dart';
import '../../../entity/struct/res.dart';

abstract class ChartData {
  void persistChartData(List<BookBriefAbs> chartEntityList);
  List<BookBriefAbs> getChartDataLocal(int pageNum, int pageSize);
  Future<Res<List<BookBriefAbs>>> getChartDataRemote(int pageNum, int pageSize);
}