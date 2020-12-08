import 'package:dstack_spy_web/entity.dart';

/// Created by shiyucheng on 2020/12/8
typedef OnReceive = void Function(NodeData data);

class MessageHandler {
  MessageHandler._();
  static MessageHandler _instance;

  static MessageHandler getInstance() {
    if (_instance == null) {
      _instance = MessageHandler._();
    }
    return _instance;
  }

  List<OnReceive> observers = [];

  void handle(NodeData data) {
    observers.forEach((element) {
      element.call(data);
    });
  }

  void addObserver(OnReceive receiver) {
    observers.add(receiver);
  }

  void removeObserver(OnReceive receiver) {
    observers.remove(receiver);
  }
}

///消息类型
class MessageType {
  static const node = "node";
}

class ActionType {
  // push跳转android
  static const String actionTypePush = "push";

  // present跳转(ios独有)
  static const String actionTypePresent = "present";

  // pop返回android
  static const String actionTypePop = "pop";

  // didPop返回android
  static const String actionTypeDidPop = "didPop";

  // popTo 返回
  static const String actionTypePopTo = "popTo";

  // PopToRoot
  static const String actionTypePopToRoot = "popToRoot";

  // PopSkip
  static const String actionTypePopSkip = "popSkip";

  // 手势
  static const String actionTypeGesture = "gesture";

  // Dissmiss返回(ios独有)
  static const String actionTypeDissmiss = "dissmiss";

  //replace
  static const String actionTypeReplace = "replace";
}
