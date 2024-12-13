class BookCatePath{
  late final String base;
  late final String hitSubCates;
  late final String allCates;
  
  BookCatePath(){
    base = "/book_cate";
    hitSubCates = "$base/hit_sub";
    allCates = "$base/categories";
  }
}