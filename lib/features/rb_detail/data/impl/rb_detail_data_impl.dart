import 'package:elibapp/entity/reserve_borrow/rb_detail.dart';
import 'package:elibapp/service/req/requester.dart';
import 'package:get_it/get_it.dart';

import '../../../../common/http_method.dart';
import '../../../../entity/struct/res.dart';
import '../../../../entity/struct/resp.dart';
import '../../../../helper/network/net_path_collector.dart';
import '../rb_detail_data.dart';

class RBDetailDataImpl implements RBDetailData {

  final Requester _requester = GetIt.I<Requester>();

  @override
  Future<Res<RBDetail>> getRBDetail(int reserveId) async{
    // 默认是请求那个考虑用户行为的(也就是需要身份认证的)
    Res<Resp> res = await _requester.req(
      path: '${NetworkPathCollector.rb.record}/$reserveId',
      method: HttpMethod.GET,
      data: {},
    );
    if (!res.isSuccess) return res.to<RBDetail>();
    Resp resp = res.data!;
    if (resp.code.isSuccess) {
      RBDetail records = RBDetail.fromJson(resp.data);
      return Res.successWithData(records);
    }else {
      return Res.failedMayWithMsg(resp.code, resp.message);
    }
  }

}