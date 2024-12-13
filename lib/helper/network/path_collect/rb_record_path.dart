class RBRecordPath{
  late final String base;
  late final String records;

  RBRecordPath(){
    base = "/reserve_borrow";
    records = "$base/records";
  }
}