import 'package:elibapp/entity/book/book_cate.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';
import '../../data/cate_data.dart';
import '../cate_export_api.dart';

class CateExportApiImpl extends CateExportApi {

  final CateData _cateData = GetIt.I<CateData>();

  @override
  List<BookCate> getSubCatesLocal(int parentId) {
    return _cateData.getSubCatesLocal(parentId);
  }

  @override
  Future<Res<List<BookCate>>> getSubCatesNet(int parentId) {
    return _cateData.getSubCatesNet(parentId);
  }

}