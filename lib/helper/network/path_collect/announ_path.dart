class AnnounPath{
  late final String base;
  late final String latest;
  late final String detail;

  AnnounPath(){
    base = "/announ";
    latest = "$base/latest";
    detail = "$base/detail";
  }
}