import 'package:elibapp/features/viewing_history/bloc/control/vb_hist_control_event.dart';
import 'package:elibapp/features/viewing_history/bloc/control/vb_hist_control_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VbHistControlBloc extends Bloc<VbHistControlEvent, VbHistControlState> {

  String keyword = "";
  bool byTime = true; // true: byTime, false: byKeyword

  VbHistControlBloc() : super(VbHistControlState.byTime){
    on<VbHistReportKeyword>((event, emit) {
      keyword = event.keyword;
      if (keyword.isEmpty) {
        emit(VbHistControlState.byTime);
      } else {
        emit(VbHistByKeyword(keyword));
      }
    });
  }
}