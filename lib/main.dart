import 'dart:convert';

import 'package:dstack_spy_web/socket/service.dart';
import 'package:dstack_spy_web/spy_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DStack Spy',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SpyHomeWidget(),
    );
  }
}

class SpyHomeWidget extends StatefulWidget {
  @override
  _SpyHomeWidgetState createState() => _SpyHomeWidgetState();
}

class _SpyHomeWidgetState extends State<SpyHomeWidget> {
  @override
  void initState() {
    super.initState();
    Service.getInstance().start();
  }

  @override
  void dispose() {
    Service.getInstance().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7E8EA),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'DStack可视化插件',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            SpyBodyWidget(),
            Positioned(
              right: 20,
              top: 20,
              child: GestureDetector(
                onTap: () {
                  Map map = {'socketClient': 'html'};
                  var msg = jsonEncode(map);
                  Service.getInstance().sendData(msg);
                },
                child: Text("测试发消息"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
