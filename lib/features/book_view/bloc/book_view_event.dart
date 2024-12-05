import 'package:equatable/equatable.dart';

sealed class BookViewEvent extends Equatable{

  static const BookViewReqNet reqNet = BookViewReqNet();
  static const BookViewMarkIt markIt = BookViewMarkIt();
  static const BookViewReqBeginFromNoData reqBeginFromNoData = BookViewReqBeginFromNoData();

  const BookViewEvent();
  @override
  List<Object> get props => [];
}

class BookViewReqNet extends BookViewEvent{
  const BookViewReqNet();
}

class BookViewMarkIt extends BookViewEvent{
  const BookViewMarkIt();
}

// 指的是请求再次开启这一过程：本地没有任何数据，应用加载动画->请求网络
class BookViewReqBeginFromNoData extends BookViewEvent{
  const BookViewReqBeginFromNoData();
}