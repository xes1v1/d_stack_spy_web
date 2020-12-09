import 'dart:convert';

import 'package:dstack_spy_web/model/image_entity.dart';
import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:dstack_spy_web/socket/message_handler.dart';

import 'connect.dart';

/// Created by shiyucheng on 2020/12/8
class Service {
  static const String serviceUrl = 'ws://10.29.118.14:4041/ws';

  Service._();

  static Service _instance;

  static Service getInstance() {
    if (_instance == null) {
      _instance = Service._();
    }
    return _instance;
  }

  SocketConnect connector;

  void initConnect() {
    connector = SocketConnect(serviceUrl, receiver: _receiver);
  }

  void start() {
    initConnect();
    connector.connect();
    Map map = {'socketClient': 'html'};
    var msg = jsonEncode(map);
    sendData(msg);
  }

  void stop() {
    connector.disconnect();
  }

  void sendData(String data) {
    connector.send(data);
  }

  SocketConnectReceiver _receiver = (dynamic message) {
    Map map = jsonDecode(message);
    Map data = map['data'];
    String messageType = map['messageType'];
    if (messageType == null || messageType.isEmpty) {
      return;
    }
    switch (messageType) {
      case MessageType.node:
        NodeEntity nodeEntity = NodeEntity.fromJson(data);
        MessageHandler.getInstance().handleNode(nodeEntity);
        break;
      case MessageType.image:
        ImageEntity imageEntity = ImageEntity.fromJson(data);
        MessageHandler.getInstance().handleImage(imageEntity);
        break;
    }
  };
}
