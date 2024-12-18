import 'package:elibapp/common/search_type.dart';
import 'package:equatable/equatable.dart';

sealed class SearchEvent extends Equatable{
  static const ReqLoadMore loadMore = ReqLoadMore();

  const SearchEvent();
  @override
  List<Object> get props => [];
}

class ReqSearchAgain extends SearchEvent{
  final bool withNewWord;
  final String keyword;
  const ReqSearchAgain(this.keyword, {this.withNewWord = true});
  @override
  List<Object> get props => [keyword, withNewWord];
}

class ReqLoadMore extends SearchEvent{
  const ReqLoadMore();
}