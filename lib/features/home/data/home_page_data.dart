import 'package:elibapp/entity/book/book_brief_reco.dart';
import 'package:elibapp/entity/req/home_data_req.dart';

import '../../../entity/aggregation/user_home_data.dart';
import '../../../entity/struct/res.dart';

abstract class HomePageData {
  Future<Res<UserHomeData>> getHomePageData(HomeDataReq params,int userId);
  Future<Res<List<BookBriefReco>>> getBookBriefReco(int pageNum, int pageSize, int userId);

  /*----------------local read------------------------------*/
  List<BookBriefReco> getBookRecoFromLocal();
  List<BookBriefReco> getBookRecoFromLocalRange(int pageNum, int pageSize);
  /*----------------local modify----------------------------*/
  Future<void> refreshBookBriefReco(List<BookBriefReco> bookBriefRecos);
}