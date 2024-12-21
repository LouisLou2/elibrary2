import '../../../entity/book/book_viewing_history.dart';
import '../../../entity/struct/res.dart';

abstract class ViewingHistoryData {
  void saveViewingHistory(List<BookViewingHistory> hisList);
  List<BookViewingHistory> getViewingHistoryLocal(int pageNum, int pageSize, int userId);
  Future<Res<List<BookViewingHistory>>> getVBHistNetByKeyword(String keyword, int pageNum, int pageSize);
}