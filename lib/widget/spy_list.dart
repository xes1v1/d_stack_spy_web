import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:dstack_spy_web/provider/node_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;

class SpyListWidget extends StatefulWidget {
  @override
  _SpyListWidgetState createState() => _SpyListWidgetState();
}

class _SpyListWidgetState extends State<SpyListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NodeProvider>(
      builder: (context, data, child) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            NodeEntity nodeEntity = data.nodes[index];
            String paramsStr = convert.jsonEncode(nodeEntity.params);
            Color backgroundColor;
            Color textTitleColor;
            if (nodeEntity.pageType == 'flutter') {
              backgroundColor = Color(0xFFFFF0EB);
              textTitleColor = Color(0xFFFF4544);
            } else {
              backgroundColor = Color(0xFFB4CFF2);
              textTitleColor = Color(0xFF3E439C);
            }
            return Card(
              child: Container(
                color: backgroundColor,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          '路由：',
                          style: TextStyle(
                              color: textTitleColor, fontSize: 18),
                        ),
                        Text(
                          nodeEntity.target,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '页面类型：',
                          style: TextStyle(
                              color: textTitleColor, fontSize: 18),
                        ),
                        Text(
                          nodeEntity.pageType,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '参数：',
                          style: TextStyle(
                              color: textTitleColor, fontSize: 18),
                        ),
                        Text(
                          paramsStr,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '页面唯一id：',
                          style: TextStyle(
                              color: textTitleColor, fontSize: 18),
                        ),
                        Text(
                          nodeEntity.identifier,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: data.nodes.length,
        );
      },
    );
  }
}
