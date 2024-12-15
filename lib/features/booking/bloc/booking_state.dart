import 'package:elibapp/entity/reserve_borrow/rb_detail.dart';
import 'package:equatable/equatable.dart';

sealed class BookingState extends Equatable {
  static const BookingState loadingNowNoData = BookingLoadingNowNoData();
  static const BookingState loadedBasicData = BookingLoadedBasicData();
  static const BookingState retry = BookingRetry();
  static const BookingState waitForRes = BookingWaitForRes();

  const BookingState();
  @override
  List<Object> get props => [];
}

class BookingLoadingNowNoData extends BookingState {
  const BookingLoadingNowNoData();
}

class BookingLoadedBasicData extends BookingState {
  const BookingLoadedBasicData();
}

class BookingRetry extends BookingState {
  const BookingRetry();
}

class BookingWaitForRes extends BookingState {
  const BookingWaitForRes();
}

class BookingSuccess extends BookingState {
  final RBDetail detail;
  const BookingSuccess(this.detail);
}

class BookingFailed extends BookingState {
  final String msg;
  const BookingFailed(this.msg);
}