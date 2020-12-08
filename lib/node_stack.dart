import 'package:dstack_spy_web/entity.dart';

/// Created by shiyucheng on 2020/12/8
class NodeStack {
  List<NodeData> list = [];

  void push(NodeData element) {
    list.insert(0, element);
  }

  NodeData pop() {
    if (list.length > 0) {
      return list.removeAt(0);
    }
    return null;
  }

  void popToRoot() {
    if (list.length > 0) {
      list.removeRange(0, list.length - 1);
    }
  }

  void popTo(NodeData nodeData) {
    if (list.length <= 0) {
      return;
    }
    int index = list.indexOf(nodeData);
    list.removeRange(0, index);
  }

  void replace(NodeData element) {
    pop();
    push(element);
  }

  NodeData operator [](int index) {
    return list[index];
  }

  int get length => list.length;
}
