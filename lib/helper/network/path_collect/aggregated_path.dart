class AggregatedPath{
  late final String base;
  late final String getHomeData;

  AggregatedPath(){
    base = "/aggregated";
    getHomeData = "$base/home_data";
  }
}