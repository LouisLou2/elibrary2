import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/book/simple_user_owned_book.dart';
import 'package:elibapp/features/auth/repo/user_state_repo.dart';
import 'package:elibapp/features/shelf/data/shelf_data.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';
import '../shelf_repo.dart';

class ShelfRepoImpl implements ShelfRepo {
  final ShelfData _shelfData = GetIt.I<ShelfData>();
  final UserStateRepo _userStateRepo = GetIt.I<UserStateRepo>();

  List<SimpleUserOwnedBook> _currentBooks = [];
  bool _hasRefreshedNet = false;

  @override
  List<SimpleUserOwnedBook> get currentBooks => _currentBooks;

  @override
  bool initListWithLocal(int pageSize) {
    List<SimpleUserOwnedBook> books = _shelfData.getShelfBooksLocal(
        _userStateRepo.userId, 0, pageSize
    );
    if (books.isEmpty) return false;
    _currentBooks = books;
    return true;
  }

  @override
  Future<ResCodeEnum> loadMoreUsingNetAndPersist(int pageSize) async{
    assert(_hasRefreshedNet);
    Res<List<SimpleUserOwnedBook>> res = await _shelfData.getShelfBooksNet(_currentBooks.length, pageSize);
    if (!res.isSuccess) return res.code;
    _currentBooks.addAll(res.data!);
    for (var ele in _currentBooks) {
      ele.userId = _userStateRepo.userId;
    }
    _shelfData.saveShelfBooks(_currentBooks);
    return res.code;
  }

  @override
  Future<ResCodeEnum> refreshUsingNetAndPersist(int pageSize, {int needPageNum = 1}) async {
    Res<List<SimpleUserOwnedBook>> res = await _shelfData.getShelfBooksNet(0, pageSize*needPageNum);
    if (!res.isSuccess) return res.code;
    _currentBooks = res.data!;
    for (var ele in _currentBooks) {
      ele.userId = _userStateRepo.userId;
    }
    _hasRefreshedNet = true;
    _shelfData.saveShelfBooks(_currentBooks);
    return res.code;
  }

  @override
  bool hasRefreshedNet() {
    return _hasRefreshedNet;
  }

}