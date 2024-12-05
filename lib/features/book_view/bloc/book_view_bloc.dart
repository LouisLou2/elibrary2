import 'package:elibapp/features/book_view/const/book_view_ui_strategy.dart';
import 'package:elibapp/features/book_view/repo/book_view_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'book_view_event.dart';
import 'book_view_state.dart';

class BookViewBloc extends Bloc<BookViewEvent, BookViewState> {

  final BookViewRepo _bookViewRepo = GetIt.I<BookViewRepo>();
  String isbn;
  String? coverUrl;

  BookViewBloc(this.isbn, String? coverUrl) : super(resolveInitialState(isbn, coverUrl)) {

    on<BookViewReqNet>((event, emit) async{
      print('@@@@@@@@@@@@@on BookViewReqNet, state is $state');
      bool res = await _bookViewRepo.tryResetFromNetAndPersist(isbn, BookViewUiStrategy.bookFromAuthorReqNum);
      emit(res ?
      BookViewState.refresh : (
          state is BookViewInitNoData ? BookViewState.retry : BookViewState.retrievedNoData
        )
      );
    });
    // 只有状态是retry的时候才会触发这个事件
    on<BookViewReqBeginFromNoData>((event, emit) async{
      print('@@@@@@@@@@@@@on BookViewReqBeginFromNoData, state is $state');
      assert(state is BookViewRetry);
      // 先将页面置为加载状态
      emit(coverUrl == null ? BookViewState.noDataNoCover : BookViewInitNoData(cover: coverUrl));
      // // 开始从网络加载数据
      // bool res = await _bookViewRepo.tryResetFromNet(isbn, BookViewUiStrategy.bookFromAuthorReqNum);
      // emit(res ? BookViewState.refresh : BookViewState.retry);
    });
  }

  static BookViewState resolveInitialState(String isbn, String? coverUrl){
    final BookViewRepo repo = GetIt.I<BookViewRepo>();
    bool has = repo.trySetBookInfoFromLocal(isbn, BookViewUiStrategy.bookFromAuthorReqNum);
    if (has){
      return BookViewState.initWithLocalHasData;
    } else {
      return coverUrl == null ? BookViewState.noDataNoCover : BookViewInitNoData(cover: coverUrl);
    }
  }

  @override
  void onTransition(Transition<BookViewEvent, BookViewState> transition) {
    print('onTransition: $transition');
    super.onTransition(transition);
  }
}