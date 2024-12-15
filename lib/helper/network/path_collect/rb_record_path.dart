class RBRecordPath{
  late final String base;
  late final String records;
  late final String record;

  RBRecordPath(){
    base = "/reserve_borrow";
    records = "$base/records";
    record = "$base/record";
  }
}