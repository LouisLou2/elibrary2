import 'package:elibapp/features/announ_content/repo/announ_content_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

enum AnnounContentEvent { reqReloadFromRetry}
enum AnnounContentState { loading, loaded, retry}

class AnnounContentBloc extends Bloc<AnnounContentEvent, AnnounContentState> {

  final AnnounContentRepo _repo = GetIt.I<AnnounContentRepo>();
  final int _announId;

  AnnounContentBloc(this._announId) : super(AnnounContentState.loading){

    _prepareFetchContent();

    on<AnnounContentEvent>((event, emit) async{
      switch (event) {
        case AnnounContentEvent.reqReloadFromRetry:
          emit(AnnounContentState.loading);
          bool res = await _repo.retrieveAnnouncement(_announId);
          if (res) {
            emit(AnnounContentState.loaded);
          } else {
            emit(AnnounContentState.retry);
          }
          break;
        default:
          throw Exception('event not found'); // 如果出现这个说明逻辑有问题
      }
    });
  }

  void _prepareFetchContent() async{
    bool isLoaded = await _repo.retrieveAnnouncement(_announId);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (isLoaded) {
        emit(AnnounContentState.loaded);
      } else {
        emit(AnnounContentState.retry);
      }
    });
  }
}

