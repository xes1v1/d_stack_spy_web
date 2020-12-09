import 'dart:convert';

import 'package:dstack_spy_web/provider/provider_manager.dart';
import 'package:dstack_spy_web/socket/service.dart';
import 'package:dstack_spy_web/widget/spy_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  initSocket();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProviderManager.getInstance().nodeProvider),
      ],
      child: MyApp(),
    ),
  );
}

void initSocket() {
  Service.getInstance().start();
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

class SpyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          'DStack可视化插件',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 100, right: 100, top: 50),
        child: SpyBodyWidget(),
      ),
    );
  }
}
