import '../../../entity/book/book_viewing_history.dart';

abstract class ViewingHistoryData {
  void saveViewingHistory(List<BookViewingHistory> hisList);
  List<BookViewingHistory> getViewingHistoryLocal(int pageNum, int pageSize, int userId);
}