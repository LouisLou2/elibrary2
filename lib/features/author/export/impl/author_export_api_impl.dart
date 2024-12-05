import 'package:elibapp/entity/book/book_brief_from_author.dart';
import 'package:elibapp/features/author/data/author_data.dart';
import 'package:get_it/get_it.dart';
import '../author_export_api.dart';

class AuthorExportApiImpl implements AuthorExportApi {

  final AuthorData _authorData = GetIt.I<AuthorData>();

  @override
  void saveBooksFromAuthor(List<BookBriefFromAuthor> books) {
    _authorData.persistBooksFromAuthor(books);
  }

  @override
  List<BookBriefFromAuthor> getBooksFromAuthorLocal(int authorId, int relatedBookNum) {
    return _authorData.getBooksFromAuthorLocal(authorId, relatedBookNum);
  }

}