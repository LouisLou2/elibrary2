import 'package:elibapp/common/search_type.dart';
import 'package:equatable/equatable.dart';

sealed class SearchEvent extends Equatable{
  static const ReqLoadMore loadMore = ReqLoadMore();
  static const SearchEvent searchAgain = ReqSearchAgain();

  const SearchEvent();
  @override
  List<Object> get props => [];
}

class ReqSearch extends SearchEvent{
  final String keyword;
  final bool ignoreIfSame;
  const ReqSearch(this.keyword, {this.ignoreIfSame = true});
  @override
  List<Object> get props => [keyword,ignoreIfSame];
}

class ReqSearchAgain extends SearchEvent{
  const ReqSearchAgain();
}

class ReqLoadMore extends SearchEvent{
  const ReqLoadMore();
}