import 'package:web_socket_channel/html.dart';

typedef SocketConnectReceiver = void Function(dynamic data);

/// Created by shiyucheng on 2020/12/8

class SocketConnect {
  String _url;

  HtmlWebSocketChannel _channel;

  SocketConnectReceiver receiver;

  SocketConnect(this._url, {this.receiver});

  void connect() {
    _channel = HtmlWebSocketChannel.connect(_url);
    _channel.stream.listen((event) {
      print("receive message from server $_url :\n $event");
      receiver?.call(event);
    });
    _channel.stream.handleError((error) {
      print("socket error:$error");
    });
  }

  void send(dynamic data) {
    print("send msg to server : $data");
    _channel.sink.add(data);
  }

  void disconnect() {
    _channel.sink.close();
  }
}
