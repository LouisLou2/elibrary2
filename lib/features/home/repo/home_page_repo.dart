import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/aggregation/user_home_data.dart';
import 'package:elibapp/entity/book/book_brief_reco.dart';
import 'package:elibapp/entity/book/book_brief_tb.dart';
import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:elibapp/entity/req/home_data_req.dart';

import '../../../entity/book/book_brief_hr.dart';

// beware: 这个类会注册到GetIt中，不要再次实例化了
abstract class HomePageRepo {

  void setAndPersistData(UserHomeData data);
  void loadLocalDataSync();

  List<BookBriefReco> getCurrentReco();
  List<BookViewingHistory> getCurrentViewed();
  List<BookBriefTB> getCurrentTB();
  List<BookBriefHR> getCurrentHR();

  Future<List<BookBriefReco>> retriveNewRecoAndSave();
  Future<ResCodeEnum> retrieveAndSaveHomeData(HomeDataReq params);
}