import 'package:elibapp/entity/book/book_brief_from_author.dart';

abstract class AuthorExportApi {
  void saveBooksFromAuthor(List<BookBriefFromAuthor> books);
  List<BookBriefFromAuthor> getBooksFromAuthorLocal(int authorId, int relatedBookNum);
}