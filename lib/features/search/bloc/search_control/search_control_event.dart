import 'package:elibapp/common/search_type.dart';
import 'package:equatable/equatable.dart';

sealed class SearchControlEvent extends Equatable{
  static const SearchHistClear searchClear = SearchHistClear();

  const SearchControlEvent();
  @override
  List<Object> get props => [];
}

class SearchInputChanged extends SearchControlEvent{
  final String keyword;
  const SearchInputChanged(this.keyword);
  @override
  List<Object> get props => [keyword];
}

class SearchInTypeChanged extends SearchControlEvent{
  final SearchInType type;
  const SearchInTypeChanged(this.type);
  @override
  List<Object> get props => [type];
}

class SearchHistClear extends SearchControlEvent{
  const SearchHistClear();
}
