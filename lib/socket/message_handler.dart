
import 'package:dstack_spy_web/model/image_entity.dart';
import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:dstack_spy_web/provider/provider_manager.dart';

/// Created by shiyucheng on 2020/12/8

class MessageHandler {
  MessageHandler._();

  static MessageHandler _instance;

  static MessageHandler getInstance() {
    if (_instance == null) {
      _instance = MessageHandler._();
    }
    return _instance;
  }

  void handleNode(NodeEntity nodeEntity) {
    switch (nodeEntity.action) {
      case ActionType.actionTypePush:
      case ActionType.actionTypePresent:
        ProviderManager.getInstance().nodeProvider.push(nodeEntity);
        break;
      case ActionType.actionTypePop:
      case ActionType.actionTypeDidPop:
      case ActionType.actionTypeGesture:
      case ActionType.actionTypeDissmiss:
        ProviderManager.getInstance().nodeProvider.pop(nodeEntity);
        break;
      case ActionType.actionTypePopTo:
        ProviderManager.getInstance().nodeProvider.popTo(nodeEntity);
        break;
      case ActionType.actionTypePopSkip:
        ProviderManager.getInstance().nodeProvider.popSkip(nodeEntity);
        break;
      case ActionType.actionTypePopToRoot:
        ProviderManager.getInstance().nodeProvider.popToRoot(nodeEntity);
        break;
      case ActionType.actionTypeReplace:
        ProviderManager.getInstance().nodeProvider.replace(nodeEntity);
        break;
    }
  }

  void handleImage(ImageEntity imageEntity) {}
}

///消息类型
class MessageType {
  static const node = 'node';
  static const image = 'screenshot';
}

///节点动作类型
class ActionType {
  // push跳转android
  static const String actionTypePush = 'push';

  // present跳转(ios独有)
  static const String actionTypePresent = 'present';

  // pop返回android
  static const String actionTypePop = 'pop';

  // didPop返回android
  static const String actionTypeDidPop = 'didPop';

  // popTo 返回
  static const String actionTypePopTo = 'popTo';

  // PopToRoot
  static const String actionTypePopToRoot = 'popToRoot';

  // PopSkip
  static const String actionTypePopSkip = 'popSkip';

  // 手势
  static const String actionTypeGesture = 'gesture';

  // Dissmiss返回(ios独有)
  static const String actionTypeDissmiss = 'dissmiss';

  //replace
  static const String actionTypeReplace = 'replace';
}
