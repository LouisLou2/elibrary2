import 'package:elibapp/struct/list/sim_linked_list_iter.dart';
import 'package:elibapp/struct/list/sim_node.dart';

class SimLinkedList<T> {
  SimNode<T> head = SimNode<T>(); // Dummy head node
  SimNode<T>? tail;

  SimLinkedList() {
    tail = head;
  }

  int _length = 0;

  void append(T value) {
    final newNode = SimNode(value);
    tail!.next = newNode;
    tail = newNode;
    ++_length;
  }

  void appendAll(List<T> values) {
    for (var value in values) {
      append(value);
    }
  }

  void removeHead(int n) {
    for (int i = 0; i < n; i++) {
      if (head.next != null) {
        head.next = head.next!.next;
        --_length;
        if (head.next == null) {
          tail = head;
        }
      } else {
        break;
      }
    }
  }

  int get length => _length;

  SimLinkedListIter<T> get iterator => SimLinkedListIter<T>(head);
}