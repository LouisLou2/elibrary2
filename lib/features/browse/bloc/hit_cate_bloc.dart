import 'package:elibapp/features/announ_content/repo/announ_content_repo.dart';
import 'package:elibapp/features/browse/const/browse_ui_strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../repo/hit_category_repo.dart';

enum HitCateEvent { reqReloadFromRetry }
enum HitCateState { loading, loaded, retry}

class HitCateBloc extends Bloc<HitCateEvent, HitCateState> {

  final HitCateRepo _repo = GetIt.I<HitCateRepo>();
  HitCateBloc() : super(HitCateState.loading){

    _prepareFetchContent();

    on<HitCateEvent>((event, emit) async{
      switch (event) {
        case HitCateEvent.reqReloadFromRetry:
          emit(HitCateState.loading);
          bool res = await _repo.resetHitSubcatesNet(BrowseUiStrategy.hitSubCateNum);
          if (res) {
            emit(HitCateState.loaded);
          } else {
            emit(HitCateState.retry);
          }
          break;
        default:
          throw Exception('event not found'); // 如果出现这个说明逻辑有问题
      }
    });
  }

  void _prepareFetchContent() async{
    bool isLoaded = await _repo.resetHitSubcatesNet(BrowseUiStrategy.hitSubCateNum);
    Future.delayed(const Duration(milliseconds: 100), () {
      if (isLoaded) {
        emit(HitCateState.loaded);
      } else {
        emit(HitCateState.retry);
      }
    });
  }
}