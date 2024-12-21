import 'package:elibapp/entity/book/book_viewing_history.dart';
import 'package:elibapp/features/viewing_history/const/vb_ui_strategy.dart';
import 'package:elibapp/features/viewing_history/data/viewing_history_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';

enum VbState {
  loading,
  retry,
  loaded,

  loadingMore,
  loadedMore,
  loadingMoreError,
  loadNoMore,
}

enum VbEvent {
  reqReloadNowNoData,
  reqLoadMore,
}

class VbBloc extends Bloc<VbEvent, VbState> {

  final ViewingHistoryData _vbHistData = GetIt.I<ViewingHistoryData>();

  bool _byTime = true;
  String _keyword = "";
  final List<BookViewingHistory> _vbHistList = [];
  int _pageNum = 0;

  VbBloc._(this._byTime, this._keyword) : super(VbState.loading){
    _executeFirstReq();
    on<VbEvent>((event, emit) async{
      switch (event) {
        case VbEvent.reqReloadNowNoData:
          _executeFirstReq();
          break;
        case VbEvent.reqLoadMore:
          emit(VbState.loadingMore);
          Res<List<BookViewingHistory>> res = await _vbHistData.getVBHistNetByKeyword(_keyword, _pageNum + 1, VBUiStrategy.pageSize);
          if (res.isSuccess) {
            _vbHistList.addAll(res.data!);
            if (res.data!.length < VBUiStrategy.pageSize) {
              emit(VbState.loadNoMore);
            } else {
              ++_pageNum;
              emit(VbState.loadedMore);
            }
          } else {
            emit(VbState.loadingMoreError);
          }
          break;
      }
    });
  }
  VbBloc.byTime() : this._(true, "");
  VbBloc.byKeyword(String keyword) : this._(false, keyword);

  List<BookViewingHistory> get vbHistList => _vbHistList;

  Future<void> _executeFirstReq() async {
    emit(VbState.loading);
    Res<List<BookViewingHistory>> res = await _vbHistData.getVBHistNetByKeyword(_keyword, 0, VBUiStrategy.pageSize);
    if (res.isSuccess) {
      _vbHistList.clear();
      _vbHistList.addAll(res.data!);
      emit(VbState.loaded);
    } else {
      emit(VbState.retry);
    }
  }
}