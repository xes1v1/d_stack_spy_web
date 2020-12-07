import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpyListWidget extends StatefulWidget {
  @override
  _SpyListWidgetState createState() => _SpyListWidgetState();
}

class _SpyListWidgetState extends State<SpyListWidget> {
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
            '$index',
            style: TextStyle(fontSize: 20),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 10,
    );
  }
}
