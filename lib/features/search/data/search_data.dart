import 'package:elibapp/entity/search/searched_book.dart';

import '../../../entity/search/searched_author.dart';
import '../../../entity/search/searched_publisher.dart';
import '../../../entity/struct/res.dart';

abstract class SearchData {
  Future<Res<List<SearchedBook>>> searchInBooks(String keyword,int pageNum, int pageSize);
  Future<Res<List<SearchedAuthor>>> searchInAuthors(String keyword,int pageNum, int pageSize);
  Future<Res<List<SearchedPublisher>>> searchInPublishers(String keyword,int pageNum, int pageSize);
}