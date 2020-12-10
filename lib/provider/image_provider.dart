import 'package:dstack_spy_web/model/image_entity.dart';
import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:flutter/material.dart';

class SnapShotProvider extends ChangeNotifier {
  //节点集合
  List<NodeEntity> _nodes = [];

  List<NodeEntity> get nodes => _nodes;

  void action(List<NodeEntity> nodes) {
    _nodes = nodes;
    notifyListeners();
  }

  void save(ImageEntity imageEntity) {
    for (int i = 0; i < _nodes.length; i++) {
      NodeEntity nodeEntity = _nodes[i];
      if (nodeEntity.target == imageEntity.target) {
        nodeEntity.base64 = imageEntity.imageData;
        break;
      }
    }
    notifyListeners();
  }
}
