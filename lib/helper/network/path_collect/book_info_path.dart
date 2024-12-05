class BookInfoPath{
  late final String base;
  late final String infoOneIsbn;
  late final String infoOneIsbnCountBehavior;

  BookInfoPath(){
    base = "/book_info";
    infoOneIsbn = "$base/info_one_isbn";
    infoOneIsbnCountBehavior = "$base/info_one_isbn_cb";
  }
}