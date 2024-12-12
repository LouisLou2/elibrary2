import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/book/simple_user_owned_book.dart';

abstract class ShelfRepo{
  List<SimpleUserOwnedBook> get currentBooks;
  bool initListWithLocal(int pageSize);
  // 是否进行过网络刷新
  bool hasRefreshedNet();
  Future<ResCodeEnum> refreshUsingNetAndPersist(int pageSize, {int needPageNum = 1});
  Future<ResCodeEnum> loadMoreUsingNetAndPersist(int pageSize);
}