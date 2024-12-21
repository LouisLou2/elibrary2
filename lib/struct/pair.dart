class Pair<K, V> {
  K first;
  V second;

  // 构造函数
  Pair(this.first, this.second);

  // 打印输出
  @override
  String toString() {
    return 'Pair(first: $first, second: $second)';
  }

  // 可以选择添加一些其他常用方法，如相等比较
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Pair<K, V> && other.first == first && other.second == second;
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}