class AuthorInfoPath{
  late final String base;
  late final String infoOneAuthor;
  late final String authorBooks;

  AuthorInfoPath(){
    base = "/author_info";
    infoOneAuthor = "$base/info_one_author";
    authorBooks = "$base/author_books";
  }
}