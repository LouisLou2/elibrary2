import 'package:equatable/equatable.dart';

sealed class VbHistControlState extends Equatable {
  static const VbHistControlState byTime = VbHistByTime();
  const VbHistControlState();

  @override
  List<Object> get props => [];
}

class VbHistByTime extends VbHistControlState {
  const VbHistByTime();
}

class VbHistByKeyword extends VbHistControlState {
  final String keyword;
  const VbHistByKeyword(this.keyword);

  @override
  List<Object> get props => [keyword];
}