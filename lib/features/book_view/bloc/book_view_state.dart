import 'package:equatable/equatable.dart';

sealed class BookViewState extends Equatable{
  static const BookViewInitWithLocal initWithLocalHasData = BookViewInitWithLocal();
  static const BookViewRefresh refresh = BookViewRefresh();
  static const BookViewInitNoData noDataNoCover = BookViewInitNoData(cover: '');
  static const BookViewRetry retry = BookViewRetry();
  static const BookRetrievedNoData retrievedNoData = BookRetrievedNoData();


  // override props to make the class comparable
  @override
  List<Object?> get props => [];

  const BookViewState();
}

class BookViewInitNoData extends BookViewState {
  final String? cover;
  const BookViewInitNoData({required this.cover});
  @override
  List<Object?> get props => [cover];
}

// 对应一开始的本地数据加载界面
class BookViewInitWithLocal extends BookViewState {
  const BookViewInitWithLocal();
}

// 对于使用网络最新数据的界面
class BookViewRefresh extends BookViewState {
  const BookViewRefresh();
}

// 对应什么都没有的界面，只有一个重试按钮的界面
class BookViewRetry extends BookViewState {
  const BookViewRetry();
}

class BookRetrievedNoData extends BookViewState {
  const BookRetrievedNoData();
}