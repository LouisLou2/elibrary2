import 'package:elibapp/entity/announ/announce_brief.dart';
import 'package:elibapp/features/announ/data/announ_data.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/res.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';

class AnnounDataImpl extends AnnounData{

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<List<AnnounceBrief>>> getAnnounceBriefsNet(int offset, int limit) async{
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.announce.latest,
      method: HttpMethod.GET,
      data: {
        'offset': offset,
        'num': limit,
      }
    );
    if (!res.isSuccess) return res.to<List<AnnounceBrief>>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      List<AnnounceBrief> data = (resp.data as List<dynamic>).map((e) => AnnounceBrief.fromJson(e)).toList();
      return Res.successWithData(data);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

}