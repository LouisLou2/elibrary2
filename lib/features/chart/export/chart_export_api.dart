import 'package:elibapp/entity/book/book_brief_tb.dart';

import '../../../entity/book/book_brief_abs.dart';
import '../../../entity/book/book_brief_hr.dart';

abstract class ChartExportApi {
  void persistTBChartData(List<BookBriefTB> chartEntityList);
  List<BookBriefTB> getTBChartDataLocal(int pageNum, int pageSize);
  void persistHRChartData(List<BookBriefHR> chartEntityList);
  List<BookBriefHR> getHRChartDataLocal(int pageNum, int pageSize);
}