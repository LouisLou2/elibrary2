class BookChartPath{
  late final String base;
  late final String trendingBooks;
  late final String highRatingBooks;

  BookChartPath(){
    base = "/book_chart";
    trendingBooks = "$base/trending";
    highRatingBooks = "$base/high_rating";
  }
}