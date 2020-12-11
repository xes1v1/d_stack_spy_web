import 'package:dstack_spy_web/model/image_entity.dart';
import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:flutter/material.dart';

class PageInfoProvider extends ChangeNotifier {

  //正在显示的节点
  NodeEntity _previewNode;

  NodeEntity get previewNode => _previewNode;

  void action(NodeEntity previewNode) {
    _previewNode = previewNode;
    notifyListeners();
  }
}
