import 'package:elibapp/entity/author/author_with_booklis.dart';
import 'package:elibapp/entity/book/book_brief_abs.dart';
import 'package:elibapp/features/author_info/const/author_info_ui_strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../entity/author/author.dart';
import '../../../entity/struct/res.dart';
import '../data/author_info_data.dart';

enum AuthorInfoEvent {
  reqReloadNowNoData,
  reqLoadMore,
}

enum AuthorInfoState{
  retry,
  loading,
  loaded,

  loadingMore,
  loadedMore,
  loadMoreError,
}

class AuthorInfoBloc extends Bloc<AuthorInfoEvent, AuthorInfoState> {
  final AuthorInfoData _authorInfoData = GetIt.I<AuthorInfoData>();

  List<BookBriefAbs> books = [];
  late Author author;
  int authorId;

  AuthorInfoBloc(this.authorId) : super(AuthorInfoState.loading) {
    _doFirstSearch();
    on<AuthorInfoEvent>((event, emit) async{
      switch (event) {
        case AuthorInfoEvent.reqReloadNowNoData:
          _doFirstSearch();
          break;
        case AuthorInfoEvent.reqLoadMore:
          emit(AuthorInfoState.loadingMore);
          Res<List<BookBriefAbs>> res = await _authorInfoData.getAuthorBooks(authorId, AuthorInfoUiStrategy.pageSize, books.length);
          if (!res.isSuccess) {
            emit(AuthorInfoState.loadMoreError);
            return;
          }
          books.addAll(res.data!);
          emit(AuthorInfoState.loadedMore);
          break;
      }
    });
  }

  void _doFirstSearch() async {
    emit(AuthorInfoState.loading);
    Res<AuthorWithBookLis> res = await _authorInfoData.getAuthorWithBooks(authorId, AuthorInfoUiStrategy.pageSize);
    if (!res.isSuccess) {
      emit(AuthorInfoState.retry);
      return;
    }
    author = res.data!.author;
    books = res.data!.books;
    emit(AuthorInfoState.loaded);
  }
}