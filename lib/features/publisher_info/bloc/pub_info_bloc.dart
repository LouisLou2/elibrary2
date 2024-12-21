import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/entity/publisher/publisher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../entity/publisher/pub_with_booklis.dart';
import '../../../entity/struct/res.dart';
import '../const/pub_info_ui_strategy.dart';
import '../data/pub_info_data.dart';

enum PubInfoEvent {
  reqReloadNowNoData,
  reqLoadMore,
}

enum PubInfoState{
  retry,
  loading,
  loaded,

  loadingMore,
  loadedMore,
  loadMoreError,
  loadNoMore,
}

class PubInfoBloc extends Bloc<PubInfoEvent, PubInfoState> {
  final PubInfoData _pubInfoData = GetIt.I<PubInfoData>();

  List<BookBriefAbs> books = [];
  late Publisher pub;
  int pubId;
  bool hasMore = true;

  PubInfoBloc(this.pubId) : super(PubInfoState.loading) {
    _doFirstSearch();
    on<PubInfoEvent>((event, emit) async{
      switch (event) {
        case PubInfoEvent.reqReloadNowNoData:
          _doFirstSearch();
          break;
        case PubInfoEvent.reqLoadMore:
          emit(PubInfoState.loadingMore);
          Res<List<BookBriefAbs>> res = await _pubInfoData.getPubBooks(pubId, PubInfoUiStrategy.pageSize, books.length);
          if (!res.isSuccess) {
            emit(PubInfoState.loadMoreError);
            return;
          }
          books.addAll(res.data!);
          hasMore = res.data!.length >= PubInfoUiStrategy.pageSize;
          emit(hasMore ? PubInfoState.loadedMore : PubInfoState.loadNoMore);
          break;
      }
    });
  }

  void _doFirstSearch() async {
    emit(PubInfoState.loading);
    Res<PubWithBookLis> res = await _pubInfoData.getPubWithBooks(pubId, PubInfoUiStrategy.pageSize);
    if (!res.isSuccess) {
      emit(PubInfoState.retry);
      return;
    }
    pub = res.data!.pub;
    books = res.data!.books;
    hasMore = books.length >= PubInfoUiStrategy.pageSize;
    emit(PubInfoState.loaded);
  }
}