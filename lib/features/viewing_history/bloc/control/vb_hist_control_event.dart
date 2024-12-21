import 'package:equatable/equatable.dart';

sealed class VbHistControlEvent {
  const VbHistControlEvent();
}

class VbHistReportKeyword extends VbHistControlEvent {
  final String keyword;
  const VbHistReportKeyword(this.keyword);
}

