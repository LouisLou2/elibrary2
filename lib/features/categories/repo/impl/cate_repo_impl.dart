import 'package:elibapp/common/res_enum.dart';
import 'package:elibapp/entity/book/book_cate.dart';
import 'package:elibapp/features/categories/data/cate_data.dart';
import 'package:elibapp/features/categories/repo/cate_repo.dart';
import 'package:get_it/get_it.dart';

import '../../../../entity/struct/res.dart';

class CateRepoImpl implements CateRepo{

  final CateData _cateData = GetIt.I<CateData>();

  List<BookCate> bookCates1 = [];
  Map<int,List<BookCate>> bookCates2Map = {};

  @override
  List<BookCate> get currentCategories1 => bookCates1;

  @override
  List<BookCate> getCurrentSubCates(int parentId) {
    return bookCates2Map[parentId] ?? [];
  }

  @override
  Future<ResCodeEnum> getFromNetAndPersist() async{
    Res<List<BookCate>> res = await _cateData.getBookCates();
    if (!res.isSuccess) return res.code;
    // 清空原来的
    bookCates1.clear();
    bookCates2Map.clear();
    // 重新赋值
    List<BookCate> bookCates = res.data!;
    for (BookCate bookCate in bookCates) {
      if (bookCate.parentId == 0) {
        bookCates1.add(bookCate);
      }else {
        if (!bookCates2Map.containsKey(bookCate.parentId)) {
          bookCates2Map[bookCate.parentId] = [];
        }
        bookCates2Map[bookCate.parentId]!.add(bookCate);
      }
    }
    bookCates1.sort();
    // persist
    _cateData.saveBookCates(bookCates);
    return res.code;
  }

  @override
  bool initFromLocal() {
    // assert (bookCates1.isEmpty && bookCates2Map.isEmpty);
    bookCates1.clear();
    bookCates2Map.clear();
    List<BookCate> bookCates = _cateData.getBookCatesLocal();
    if (bookCates.isEmpty) return false;
    for (BookCate bookCate in bookCates) {
      if (bookCate.parentId == 0) {
        bookCates1.add(bookCate);
      }else {
        if (!bookCates2Map.containsKey(bookCate.parentId)) {
          bookCates2Map[bookCate.parentId] = [];
        }
        bookCates2Map[bookCate.parentId]!.add(bookCate);
      }
    }
    bookCates1.sort();
    return true;
  }
}