import 'package:dstack_spy_web/spy_card.dart';
import 'package:dstack_spy_web/spy_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpyBodyWidget extends StatefulWidget {
  @override
  _SpyBodyWidgetState createState() => _SpyBodyWidgetState();
}

class _SpyBodyWidgetState extends State<SpyBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: SpyListWidget(),
          ),
          Flexible(
              child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: SpyCardWidget() ,
              )),
        ],
      ),
    );
  }
}
