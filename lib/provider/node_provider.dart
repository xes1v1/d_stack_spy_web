import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:flutter/material.dart';

class NodeProvider extends ChangeNotifier {
  List<NodeEntity> _nodes = [];

  List<NodeEntity> get nodes => _nodes;

  void push(NodeEntity node) {
    nodes.insert(0, node);
    notifyListeners();
  }

  void pop(NodeEntity nodeEntity) {
    if (_nodes.isEmpty) {
      return;
    }
    _nodes.removeAt(0);
    notifyListeners();
  }

  void popTo(NodeEntity nodeEntity) {
    if (_nodes.isEmpty) {
      return;
    }
    int index = -1;
    for (int i = 0; i < _nodes.length; i++) {
      NodeEntity tempNodeEntity = _nodes[i];
      if (tempNodeEntity.target == nodeEntity.target) {
        index = i;
        break;
      }
    }
    if (index == -1) {
      return;
    }
    _nodes.removeRange(0, index);
    notifyListeners();
  }

  void popSkip(NodeEntity nodeEntity) {
    if (_nodes.isEmpty) {
      return;
    }
    List<NodeEntity> removeNodeList = [];
    for (int i = 0; i < _nodes.length; i++) {
      NodeEntity tempNodeEntity = _nodes[i];
      if (tempNodeEntity.target.contains(nodeEntity.target)) {
        removeNodeList.add(tempNodeEntity);
      }
    }
    for (NodeEntity nodeEntity in removeNodeList) {
      _nodes.remove(nodeEntity);
    }
    notifyListeners();
  }

  void popToRoot(NodeEntity nodeEntity) {
    if (_nodes.isEmpty) {
      return;
    }
    _nodes.removeRange(1, _nodes.length);
    notifyListeners();
  }

  void replace(NodeEntity nodeEntity) {
    if (_nodes.isEmpty) {
      return;
    }
    _nodes[0] = nodeEntity;
    notifyListeners();
  }
}
