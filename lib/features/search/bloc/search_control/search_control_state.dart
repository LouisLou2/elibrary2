import 'package:elibapp/common/search_type.dart';
import 'package:equatable/equatable.dart';

sealed class SearchControlState extends Equatable{

  static const WaitTypingNowNoInput waitTypingNowNoInput = WaitTypingNowNoInput();
  const SearchControlState();

  @override
  List<Object> get props => [];
}

class WaitTypingNowNoInput extends SearchControlState{
  const WaitTypingNowNoInput();
}

class InputChanged extends SearchControlState{
  final String keyword;
  final SearchInType inType;
  const InputChanged(this.keyword, this.inType);

  @override
  List<Object> get props => [keyword, inType];
}