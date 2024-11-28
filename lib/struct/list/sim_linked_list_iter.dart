import 'package:elibapp/struct/list/sim_node.dart';

class SimLinkedListIter<T>{
  SimNode<T>? _current;

  SimLinkedListIter(this._current);

  T get current => _current!.value!;

  bool get hasNext => _current != null;

  bool moveNext() {
    if (_current != null) {
      _current = _current!.next;
      return _current != null;
    }
    return false;
  }
}