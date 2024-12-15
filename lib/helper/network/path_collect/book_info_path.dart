class BookInfoPath{
  late final String base;
  late final String infoOneIsbn;
  late final String infoOneIsbnCountBehavior;
  late final String subCateBooks;

  BookInfoPath(){
    base = "/book_info";
    infoOneIsbn = "$base/info_one_isbn";
    infoOneIsbnCountBehavior = "$base/info_one_isbn_cb";
    subCateBooks = "$base/sub_cate_books";
  }
}