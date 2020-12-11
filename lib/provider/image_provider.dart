import 'package:dstack_spy_web/model/image_entity.dart';
import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:dstack_spy_web/provider/provider_manager.dart';
import 'package:flutter/material.dart';

class SnapShotProvider extends ChangeNotifier {
  //节点集合
  List<NodeEntity> _nodes = [];

  List<NodeEntity> get nodes => _nodes;

  //正在显示的节点
  NodeEntity _previewNode;

  NodeEntity get previewNode => _previewNode;

  void action(List<NodeEntity> nodes) {
    _nodes = nodes;
    notifyListeners();
    ProviderManager.getInstance().pageInfoProvider.action(_previewNode);
  }

  void save(ImageEntity imageEntity) {
    for (int i = 0; i < _nodes.length; i++) {
      NodeEntity nodeEntity = _nodes[i];
      if (nodeEntity.target == imageEntity.target) {
        nodeEntity.base64 = imageEntity.imageData;
        break;
      }
    }
    _previewNode = _nodes[0];
    notifyListeners();
    ProviderManager.getInstance().pageInfoProvider.action(_previewNode);
  }

  void previous() {
    NodeEntity nodeEntity = _nodes.last;
    _nodes.removeLast();
    _nodes.insert(0, nodeEntity);
    _previewNode = _nodes[0];
    ProviderManager.getInstance().pageInfoProvider.action(_previewNode);
  }

  void next() {
    NodeEntity nodeEntity = _nodes.first;
    _nodes.removeAt(0);
    _nodes.insert(_nodes.length, nodeEntity);
    _previewNode = _nodes[0];
    ProviderManager.getInstance().pageInfoProvider.action(_previewNode);
  }
}
