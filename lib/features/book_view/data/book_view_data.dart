import 'package:elibapp/entity/book/book_info.dart';

import '../../../entity/struct/res.dart';

abstract class BookViewData {
  Future<Res<BookInfo>> getBookInfoNet(String isbn, int relatedBookNum);
  BookInfo? getBookInfoLocal(String isbn, int relatedBookNum);
  void persistBookInfo(BookInfo bookInfo);
}