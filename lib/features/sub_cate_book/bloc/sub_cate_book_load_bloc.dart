import 'package:elibapp/entity/book/book_brief_sub_cate.dart';
import 'package:elibapp/features/sub_cate_book/const/sub_cate_book_ui_strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../entity/struct/res.dart';
import '../data/sub_cate_book_data.dart';

enum SubCateBookLoadState{
  loadingNowNoData,
  retry,
  refreshedLocal,

  refreshedNet,
  refreshingNet,
  refreshNetFailed,

  loadedMore,
  loadingMore,
  loadMoreFailed,
}

enum SubCateBookLoadEvent{
  reqLoadNowNoData,
  reqRefresh,
  reqLoadMore,
}

class SubCateBookLoadBloc extends Bloc<SubCateBookLoadEvent, SubCateBookLoadState> {

  final SubCateBookData _subCateBookData = GetIt.I<SubCateBookData>();

  List<BookBriefSC> bookBriefs = [];
  bool hasRefreshedNet = false;
  final int subCateId;

  SubCateBookLoadBloc._({required this.subCateId, required this.bookBriefs}) : super(_resolveFirstState(subCateId, bookBriefs)){
    _prepareLoad();
    on<SubCateBookLoadEvent>((event, emit) async {
      switch (event) {
        case SubCateBookLoadEvent.reqLoadNowNoData:
          emit(SubCateBookLoadState.loadingNowNoData);
          _prepareLoad();
          break;
        case SubCateBookLoadEvent.reqRefresh:
          emit(SubCateBookLoadState.refreshingNet);
          Res<List<BookBriefSC>> res = await _subCateBookData.getBookBriefsNet(subCateId, 0, SubCateBookUiStrategy.pageSize);
          if (res.isSuccess) {
            bookBriefs.clear();
            bookBriefs.addAll(res.data!);
            _subCateBookData.saveBookBriefs(bookBriefs);
            hasRefreshedNet = true;
            emit(SubCateBookLoadState.refreshedNet);
          } else {
            emit(SubCateBookLoadState.refreshNetFailed);
          }
          break;
        case SubCateBookLoadEvent.reqLoadMore:
          emit(SubCateBookLoadState.loadingMore);
          Res<List<BookBriefSC>> res = await _subCateBookData.getBookBriefsNet(subCateId, bookBriefs.length, SubCateBookUiStrategy.pageSize);
          if (res.isSuccess) {
            bookBriefs.addAll(res.data!);
            _subCateBookData.saveBookBriefs(res.data!);
            emit(SubCateBookLoadState.loadedMore);
          } else {
            emit(SubCateBookLoadState.loadMoreFailed);
          }
          break;
      }
    });
  }

  SubCateBookLoadBloc(int subCateId,) : this._(subCateId: subCateId, bookBriefs: []);

  static SubCateBookLoadState _resolveFirstState(int subCateId, List<BookBriefSC> bookBriefs){
    List<BookBriefSC> briefs = GetIt.I<SubCateBookData>().getBookBriefsLocal(subCateId, SubCateBookUiStrategy.pageSize);
    if (briefs.isEmpty) return SubCateBookLoadState.loadingNowNoData;
    bookBriefs.clear();
    bookBriefs.addAll(briefs);
    return SubCateBookLoadState.refreshedLocal;
  }

  void _prepareLoad() async {
    Res<List<BookBriefSC>> res = await _subCateBookData.getBookBriefsNet(subCateId, 0, SubCateBookUiStrategy.pageSize);
    Future.delayed(const Duration(milliseconds: 500), (){
      if (res.isSuccess) {
        bookBriefs.clear();
        bookBriefs.addAll(res.data!);
        _subCateBookData.saveBookBriefs(bookBriefs);
        hasRefreshedNet = true;
        emit(SubCateBookLoadState.refreshedNet);
      } else {
        if (state == SubCateBookLoadState.loadingNowNoData ) {
          emit(SubCateBookLoadState.retry);
        }
      }
    });
  }
}
