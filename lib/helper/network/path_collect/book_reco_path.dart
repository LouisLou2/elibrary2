class BookRecoPath{
  late final String base;
  late final String getRecommend;

  BookRecoPath(){
    base = "/book_reco";
    getRecommend = "$base/by_user";
  }
}