class RBPath{
  late final String base;
  late final String records;
  late final String record;
  late final String timeSpans;
  late final String reserve;

  RBPath(){
    base = "/reserve_borrow";
    records = "$base/records";
    record = "$base/record";
    timeSpans = "$base/time_spans";
    reserve = "$base/reserve";
  }
}