class BookCatePath{
  late final String base;
  late final String hitSubCates;
  late final String allCates;
  late final String subCates;
  
  BookCatePath(){
    base = "/book_cate";
    hitSubCates = "$base/hit_sub";
    allCates = "$base/categories";
    subCates = "$base/sub_cates";
  }
}