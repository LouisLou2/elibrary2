import 'package:elibapp/entity/aggregation/user_home_data.dart';
import 'package:elibapp/entity/book/book_brief_reco.dart';
import 'package:elibapp/entity/req/home_data_req.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:elibapp/helper/network/net_path_collector.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../base_manager/db_manager.dart';
import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../service/req/requester.dart';
import '../home_page_data.dart';

class HomePageDataImpl implements HomePageData {
  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<List<BookBriefReco>>> getBookBriefReco(int pageNum, int pageSize, int userId) async {
    Res<Resp?> res = await _requester.req(
      path: NetworkPathCollector.bookReco.getRecommend,
      method: HttpMethod.GET,
      data:{
        'pageNum': pageNum,
        'pageSize': pageSize,
      }
    );
    if (!res.isSuccess) return res.to<List<BookBriefReco>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<BookBriefReco> lis = (resp.data as List<dynamic>).map((e) => BookBriefReco.fromJson(e)).toList();
      BookBriefReco.setUserIdAndOrderList(lis, userId, 0); // 注意，这里故意设置为0，因为每次的推荐覆盖之前的推荐
      return Res.successWithData(lis);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

  @override
  Future<void> refreshBookBriefReco(List<BookBriefReco> bookBriefRecos) async{
    DBManager.db.writeTxn(
      () async {
        // 清除现有数据
        await DBManager.db.bookBriefRecos.clear();
        // 然后执行 putAll 来插入新的数据
        await DBManager.db.bookBriefRecos.putAll(bookBriefRecos);
      },
    );
  }

  @override
  List<BookBriefReco> getBookRecoFromLocal() {
    return DBManager.db.bookBriefRecos.where().findAllSync();
  }

  @override
  List<BookBriefReco> getBookRecoFromLocalRange(int pageNum, int pageSize) {
    return DBManager.db
        .bookBriefRecos
        .where()
        .offset(pageNum*pageSize)
        .limit(pageSize)
        .findAllSync();
  }

  @override
  Future<Res<UserHomeData>> getHomePageData(HomeDataReq params,int userId) async {
    Res<Resp?> res = await _requester.req(
      path: NetworkPathCollector.aggregated.getHomeData,
      method: HttpMethod.POST,
      data: params.toJson(),
    );
    if (!res.isSuccess) return res.to<UserHomeData>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      UserHomeData data = UserHomeData.fromJson(resp.data);
      data.setUserIdAndOrder(userId);
      return Res.successWithData(data);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }
}