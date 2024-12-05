import 'package:elibapp/entity/book/book_info.dart';

abstract class BookViewRepo {
  bool trySetBookInfoFromLocal (String isbn, int relatedBookNum);
  BookInfo? getCurrentBookInfo();
  Future<bool> tryResetFromNetAndPersist(String isbn, int relatedBookNum);
}