import 'package:elibapp/entity/book/book_brief_from_author.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../author_data.dart';

class AuthorDataImpl extends AuthorData {
  @override
  void persistBooksFromAuthor(List<BookBriefFromAuthor> books) {
    DBManager.db.writeTxn(
      () async {
        DBManager.db.bookBriefFromAuthors.putAll(books);
      },
    );
  }

  @override
  List<BookBriefFromAuthor> getBooksFromAuthorLocal(int authorId, int relatedBookNum) {
    return DBManager.db
        .bookBriefFromAuthors
        .where()
        .authorIdEqualTo(authorId)
        .sortByOrder()
        .limit(relatedBookNum)
        .findAllSync();
  }

}