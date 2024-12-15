import 'package:get_it/get_it.dart';

import 'data/booking_data.dart';
import 'data/impl/booking_data_impl.dart';

class BookingFeature{
  static void inject(){
    GetIt.I.registerFactory<BookingData>(() => BookingDataImpl());
  }
}