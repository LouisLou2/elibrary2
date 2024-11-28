import 'package:json_annotation/json_annotation.dart';

import '../book/book_brief_hr.dart';
import '../book/book_brief_reco.dart';
import '../book/book_brief_tb.dart';
import '../book/book_viewing_history.dart';

part '../../generated/aggregation/user_home_data.g.dart';

@JsonSerializable()
class UserHomeData {

  @JsonKey(name: 'has_new_announ')
  bool hasNewAnnoun;

  @JsonKey(name: 'viewing_history')
  List<BookViewingHistory> viewingHistory;

  @JsonKey(name: 'reco_books')
  List<BookBriefReco> recoBooks;

  @JsonKey(name: 'trending_books')
  List<BookBriefTB> trendingBooks;

  @JsonKey(name: 'highly_rated_books')
  List<BookBriefHR> highlyRatedBooks;

  UserHomeData({
    required this.hasNewAnnoun,
    required this.viewingHistory,
    required this.recoBooks,
    required this.trendingBooks,
    required this.highlyRatedBooks,
  });

  void setUserIdAndOrder(int userId) {
    BookBriefReco.setUserIdAndOrderList(recoBooks, userId, 0);
    BookBriefTB.setOrderForList(trendingBooks, 0);
    BookBriefHR.setOrderForList(highlyRatedBooks, 0);
  }

  factory UserHomeData.fromJson(Map<String, dynamic> json) =>
      _$UserHomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserHomeDataToJson(this);
}
