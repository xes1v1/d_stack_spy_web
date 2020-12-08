import 'package:dstack_spy_web/entity.dart';
import 'package:dstack_spy_web/node_stack.dart';
import 'package:dstack_spy_web/socket/message_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpyListWidget extends StatefulWidget {
  @override
  _SpyListWidgetState createState() => _SpyListWidgetState();
}

class _SpyListWidgetState extends State<SpyListWidget> {
  final NodeStack nodes = NodeStack();
  OnReceive onReceive;

  void handle(NodeData data) {
    var action = data.action;
    switch (action) {
      case ActionType.actionTypePush:
      case ActionType.actionTypePresent:
        nodes.push(data);
        break;
      case ActionType.actionTypePop:
      case ActionType.actionTypeDidPop:
      case ActionType.actionTypeDissmiss:
      case ActionType.actionTypeGesture:
        nodes.pop();
        break;
      case ActionType.actionTypePopTo:
      case ActionType.actionTypePopSkip:
        nodes.popTo(data);
        break;
      case ActionType.actionTypePopToRoot:
        nodes.popToRoot();
        break;
      case ActionType.actionTypeReplace:
        nodes.replace(data);
        break;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onReceive = (data) {
      handle(data);
    };
    MessageHandler.getInstance().addObserver(onReceive);
  }

  @override
  void dispose() {
    MessageHandler.getInstance().removeObserver(onReceive);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _dataWidget();
  }

  _dataWidget() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(
            nodes[index].target,
            style: TextStyle(fontSize: 20),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: nodes.length,
    );
  }
}
