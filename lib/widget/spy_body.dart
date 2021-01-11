import 'package:dstack_spy_web/widget/spy_card.dart';
import 'package:dstack_spy_web/widget/spy_list.dart';
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
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, bottom: 10),
                  child: Text(
                    '节点栈（栈顶到栈底）',
                    style: TextStyle(color: Color(0xFF212121), fontSize: 28),
                  ),
                ),
                Expanded(child: SpyListWidget()),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            width: 7,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            child: SpyCardWidget(),
          )
        ],
      ),
    );
  }
}
