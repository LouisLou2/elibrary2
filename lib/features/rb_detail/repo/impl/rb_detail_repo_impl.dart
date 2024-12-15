import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/reserve_borrow/rb_detail.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';
import '../../data/rb_detail_data.dart';
import '../rb_detail_repo.dart';

class RBDetailRepoImpl extends RBDetailRepo {

  late RBDetail detail;
  final RBDetailData _data = GetIt.I<RBDetailData>();

  @override
  Future<ResCodeEnum> getRBDetail(int reserveId) async{
    Res<RBDetail> res = await _data.getRBDetail(reserveId);
    if (!res.isSuccess) return res.code;
    detail = res.data!;
    return res.code;
  }

  @override
  RBDetail get currentDetail => detail;

}