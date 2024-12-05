import 'package:elibapp/entity/announ/announcement.dart';

import 'package:elibapp/entity/struct/res.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../common/res_enum.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../../../../service/req/requester.dart';
import '../announ_content_data.dart';

class AnnounContentDataImpl extends AnnounContentData {

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<Announcement>> getAnnouncementNet(int announcementId) async{
    Res<Resp> res = await _requester.req(
      path: NetworkPathCollector.announce.detail,
      method: HttpMethod.GET,
      data: {
        'id': announcementId,
      }
    );
    if (!res.isSuccess) return res.to<Announcement>();
    Resp resp = res.data!;
    if (resp.code == ResCodeEnum.Success) {
      Announcement data = Announcement.fromJson(resp.data);
      return Res.successWithData(data);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

}