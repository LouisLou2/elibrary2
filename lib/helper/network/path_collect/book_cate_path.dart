class BookCatePath{
  late final String base;
  late final String hitSubCates;
  late final String allCates;
  late final String subCates;
  late final String subCateDetail;
  late final String subCateHitBooks;
  
  BookCatePath(){
    base = "/book_cate";
    hitSubCates = "$base/hit_sub";
    allCates = "$base/categories";
    subCates = "$base/sub_cates";
    subCateDetail = "$base/sub_cate_detail";
    subCateHitBooks = "$base/sub_cate_hit_books";
  }
}