import 'package:elibapp/entity/book/book_info.dart';
import 'package:elibapp/features/book_view/data/book_view_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';
import '../book_view_repo.dart';

class BookViewRepoImpl extends BookViewRepo {

  final BookViewData _bookViewData = GetIt.I<BookViewData>();

  BookInfo? _bookInfo;
  @override
  BookInfo? getCurrentBookInfo() {
    return _bookInfo!;
  }

  @override
  bool trySetBookInfoFromLocal(String isbn, int relatedBookNum) {
    _bookInfo = _bookViewData.getBookInfoLocal(isbn,relatedBookNum);
    return _bookInfo != null;
  }

  @override
  Future<bool> tryResetFromNetAndPersist(String isbn, int relatedBookNum) async{
    Res<BookInfo> res = await _bookViewData.getBookInfoNet(isbn, relatedBookNum);
    if (!res.isSuccess) return false;
    _bookInfo = res.data;
    _bookViewData.persistBookInfo(res.data!);
    return true;
  }

}