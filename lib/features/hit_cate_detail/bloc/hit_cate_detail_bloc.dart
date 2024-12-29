import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/entity/book/cate_detail.dart';
import 'package:elibapp/features/hit_cate_detail/const/hit_cate_detail_ui_strategy.dart';
import 'package:elibapp/features/hit_cate_detail/data/hit_cate_detail_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../entity/struct/res.dart';

enum HitCateDetailState{
  loadingNowNoData,
  retry,
  loaded,
  loadedAndAllData,

  loadingMore,
  loadingMoreFailed,
  loadedMore,
  loadedMoreAndAllData,
}


enum HitCateDetailEvent{
  reqRetry,
  reqLoadMore,
}

class HitCateDetailBloc extends Bloc<HitCateDetailEvent, HitCateDetailState> {

  final HitCateDetailData _data = GetIt.I.get<HitCateDetailData>();

  final int cateId;
  late final BookCate _cate;
  final List<BookBriefAbs> _books = [];
  bool _hasMoreData = true;

  get cate => _cate;
  get books => _books;
  get hasMoreData => _hasMoreData;

  HitCateDetailBloc(this.cateId) : super(HitCateDetailState.loadingNowNoData){
    _prepareFirstLoad();

    on<HitCateDetailEvent>((event, emit) async {
      switch(event){
        case HitCateDetailEvent.reqRetry:
          _prepareFirstLoad();
          break;
        case HitCateDetailEvent.reqLoadMore:
          emit(HitCateDetailState.loadingMore);
          Res<List<BookBriefAbs>> res = await _data.getHitSubCateBooks(cateId, _books.length, HitCateDetailUiStrategy.bookPageSize);
          if(res.isSuccess){
            _books.addAll(res.data!);
            if(res.data!.length < HitCateDetailUiStrategy.bookPageSize) {
              _hasMoreData = false;
              emit(HitCateDetailState.loadedMoreAndAllData);
            }else{
              emit(HitCateDetailState.loadedMore);
            }
          }else{
            emit(HitCateDetailState.loadingMoreFailed);
          }
          break;
      }
    });
  }

  void _prepareFirstLoad() async{
    emit(HitCateDetailState.loadingNowNoData);
    _books.clear();
    Res<CateDetail> res = await _data.getHitCateDetail(cateId, HitCateDetailUiStrategy.bookPageSize);
    if(res.isSuccess) {
      _cate = res.data!.cate;
      _books.addAll(res.data!.books);
      if (_books.length < HitCateDetailUiStrategy.bookPageSize) {
        _hasMoreData = false;
        emit(HitCateDetailState.loadedAndAllData);
      } else {
        emit(HitCateDetailState.loaded);
      }
    }else{
      emit(HitCateDetailState.retry);
    }
  }

}