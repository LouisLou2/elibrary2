import '../../../entity/book/book_viewing_history.dart';

abstract class ViewingHistoryExportApi {
  void persistHistory(List<BookViewingHistory> lis);
  List<BookViewingHistory> getViewingHistoryLocal(int pageNum, int pageSize, int userId);
}