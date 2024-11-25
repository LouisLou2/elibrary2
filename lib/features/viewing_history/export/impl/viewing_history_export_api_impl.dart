import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:get_it/get_it.dart';

import '../../data/viewing_history_data.dart';
import '../viewing_history_export_api.dart';

class ViewingHistoryExportApiImpl extends ViewingHistoryExportApi {
  final ViewingHistoryData _historyData = GetIt.I<ViewingHistoryData>();

  @override
  List<BookViewingHistory> getViewingHistoryLocal(int pageNum, int pageSize, int userId) {
    return _historyData.getViewingHistoryLocal(pageNum, pageSize, userId);
  }

  @override
  void persistHistory(List<BookViewingHistory> lis) {
    _historyData.saveViewingHistory(lis);
  }
}