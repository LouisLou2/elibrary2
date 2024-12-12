class BookShelfPath{
  late final String base;
  late final String books;

  BookShelfPath(){
    base = "/shelf";
    books = "$base/get_books";
  }
}