import 'package:elibapp/entity/book/simple_user_owned_book.dart';

import '../../../entity/struct/res.dart';

abstract class ShelfData{
  Future<Res<List<SimpleUserOwnedBook>>> getShelfBooksNet(int offset, int num);
  List<SimpleUserOwnedBook> getShelfBooksLocal(int userId,int offset, int num);
  void saveShelfBooks(List<SimpleUserOwnedBook> books);
}