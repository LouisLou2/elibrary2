class SearchPath{
  late final String base;
  late final String keyword;

  SearchPath(){
    base = "/search";
    keyword = "$base/keyword";
  }
}