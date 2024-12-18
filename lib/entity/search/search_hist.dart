import 'package:isar/isar.dart';

part '../../generated/search/search_hist.g.dart';

@collection
class SearchHist {
  Id id = Isar.autoIncrement;

  @Index(composite:[CompositeIndex('time')])
  @Index(composite:[CompositeIndex('keyword')], unique: true, replace: true)
  int userId;

  String keyword;

  DateTime time;

  SearchHist(this.userId, this.keyword, this.time);
}