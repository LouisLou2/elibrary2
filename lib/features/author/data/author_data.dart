import 'package:elibapp/entity/book/book_brief_from_author.dart';

abstract class AuthorData {
  void persistBooksFromAuthor(List<BookBriefFromAuthor> books);
  List<BookBriefFromAuthor> getBooksFromAuthorLocal(int authorId, int relatedBookNum);
}