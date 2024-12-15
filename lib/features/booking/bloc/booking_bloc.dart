import 'package:elibapp/entity/lib/lib_time_span.dart';
import 'package:elibapp/entity/reserve_borrow/rb_detail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../entity/struct/res.dart';
import '../data/booking_data.dart';
import 'booking_event.dart';
import 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {

  final BookingData _data = GetIt.I<BookingData>();
  final String isbn;

  List<LibTimeSpan>? libTimeSpanList;
  int selectedLibIndex = 0;
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  BookingBloc(this.isbn) : super(BookingState.loadingNowNoData) {
    _prepareLoad();
    on<ReqReloadBasicsNowNoData>((event, emit) {
      // 说明上一步一定是retry
      emit(BookingState.loadingNowNoData);
      _prepareLoad();
    });

    on<ReqBooking>((event, emit) async{
      emit(BookingState.waitForRes);
      // 设置
      selectedDateIndex = event.dateIndex;
      selectedTimeIndex = event.timeIndex;
      selectedLibIndex = event.libIndex;

      LibTimeSpan libTimeSpan = libTimeSpanList![selectedLibIndex];
      int libId = libTimeSpan.libId;
      DateTime pickUpDate = libTimeSpan.timeSpans[selectedDateIndex].date;
      int hour = libTimeSpan.timeSpans[selectedDateIndex].hourBegin + selectedTimeIndex;

      DateTime pickUpTime = DateTime(pickUpDate.year, pickUpDate.month, pickUpDate.day, hour);
      Res<RBDetail> res = await _data.book(libId, isbn, pickUpTime);
      if (res.isSuccess) {
        emit(BookingSuccess(res.data!));
      }else{
        emit(BookingFailed(res.code.msg));
      }
    });
  }

  void _prepareLoad() async {
    assert (state is BookingLoadingNowNoData);
    Res<List<LibTimeSpan>> res = await _data.getLibTimeSpanList(isbn);
    if (res.isSuccess) {
      libTimeSpanList = res.data;
      selectedDateIndex = 0;
      selectedTimeIndex = 0;
      selectedLibIndex = 0;
      emit(BookingState.loadedBasicData);
    }else{
      emit(BookingState.retry);
    }
  }
}