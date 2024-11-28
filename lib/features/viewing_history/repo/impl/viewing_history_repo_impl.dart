import 'package:elibapp/features/viewing_history/data/viewing_history_data.dart';
import 'package:get_it/get_it.dart';

import '../viewing_history_repo.dart';

class ViewingHistoryRepoImpl extends ViewingHistoryRepo {

  final ViewingHistoryData _historyData = GetIt.I<ViewingHistoryData>();

  // @override
  // List<BookViewingHistory> getViewingHistoryLocal(int pageNum, int pageSize, int userId) {
  //
  // }
  //
  // @override
  // void presistHistory(List<BookViewingHistory> lis) {
  //   _historyData.saveViewingHistory(lis);
  // }

}