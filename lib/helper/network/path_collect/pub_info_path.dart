class PubInfoPath{
  late final String base;
  late final String infoOnePub;
  late final String pubBooks;

  PubInfoPath(){
    base = "/pub_info";
    infoOnePub = "$base/info_one_pub";
    pubBooks = "$base/pub_books";
  }
}