import '../../../entity/book/book_brief_abs.dart';

abstract class ChartData {
  void persistChartData(List<BookBriefAbs> chartEntityList);
  List<BookBriefAbs> getChartDataLocal(int pageNum, int pageSize);
}