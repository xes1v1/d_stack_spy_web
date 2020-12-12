import 'dart:convert';
import 'dart:convert' as convert;

import 'package:dstack_spy_web/model/image_entity.dart';
import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:dstack_spy_web/socket/message_handler.dart';
import 'package:http/http.dart' as http;

import 'connect.dart';

/// Created by shiyucheng on 2020/12/8
class Service {
  Service._();

  static Service _instance;

  static Service getInstance() {
    if (_instance == null) {
      _instance = Service._();
    }
    return _instance;
  }

  SocketConnect connector;

  Future<void> start() async {
    var url = 'http://localhost:9202/getHost';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      String host = jsonResponse['host'];
      int port = jsonResponse['port'];
      if (host == null || host.isEmpty) {
        return;
      }
      initConnect(host, port);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void initConnect(String host, int port) {
    String serviceUrl = 'ws://$host:$port/ws';
    print('webSocket地址$serviceUrl');
    connector = SocketConnect(serviceUrl, receiver: _receiver);
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
