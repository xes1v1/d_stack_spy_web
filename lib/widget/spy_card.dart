import 'dart:convert';
import 'dart:math' as math;

import 'package:dstack_spy_web/infinitecard/infinite_card_view.dart';
import 'package:dstack_spy_web/infinitecard/infinite_cards_controller.dart';
import 'package:dstack_spy_web/model/node_entity.dart';
import 'package:dstack_spy_web/provider/image_provider.dart';
import 'package:dstack_spy_web/provider/provider_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SpyCardWidget extends StatefulWidget {
  @override
  _SpyCardWidgetState createState() => _SpyCardWidgetState();
}

class _SpyCardWidgetState extends State<SpyCardWidget> {
  InfiniteCardsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteCardsController(
      itemBuilder: _renderItem,
      itemCount: 0,
      animType: AnimType.TO_END,
    );
  }

  Widget _renderItem(BuildContext context, int index) {
    List<NodeEntity> nodes = ProviderManager.getInstance().imageProvider.nodes;
    NodeEntity nodeEntity = nodes[index];
    String image = nodeEntity.base64;
    if (image == null || image.isEmpty) {
      return Image(
        width: 360,
        height: 660,
        image: AssetImage('pic/pic${index + 1}.png'),
      );
    }
    String base64img = image.split(',')[1];
    return Image.memory(
      base64.decode(base64img),
      width: 360,
      height: 660,
      gaplessPlayback: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 1.4;
    double width = height / 1;
    return Consumer<SnapShotProvider>(
      builder: (context, data, child) {
        print('data: ${data.nodes.length}');
        _controller.itemCount = data.nodes.length;
        return Container(
          child: Column(
            key: UniqueKey(),
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InfiniteCards(
                width: width,
                height: height,
                controller: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _controller.reset(animType: AnimType.TO_FRONT);
                      _controller.previous();
                    },
                    child: Text("Pre"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _controller.reset(
                        animType: AnimType.TO_END,
                        transformToBack: _customToBackTransform,
                      );
                      _controller.next();
                    },
                    child: Text("Next"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

Transform _customToBackTransform(
    Widget item,
    double fraction,
    double curveFraction,
    double cardHeight,
    double cardWidth,
    int fromPosition,
    int toPosition) {
  int positionCount = fromPosition - toPosition;
  double scale = (0.8 - 0.1 * fromPosition) + (0.1 * fraction * positionCount);
  double rotateY;
  double translationX;
  if (fraction < 0.5) {
    translationX = cardWidth * fraction * 1.5;
    rotateY = math.pi / 2 * fraction;
  } else {
    translationX = cardWidth * 1.5 * (1 - fraction);
    rotateY = math.pi / 2 * (1 - fraction);
  }
  double interpolatorScale =
      0.8 - 0.1 * fromPosition + (0.1 * curveFraction * positionCount);
  double translationY = -cardHeight * (0.8 - interpolatorScale) * 0.5 -
      cardHeight * (0.02 * fromPosition - 0.02 * curveFraction * positionCount);
  return Transform.translate(
    offset: Offset(translationX, translationY),
    child: Transform.scale(
      scale: scale,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(rotateY),
        alignment: Alignment.center,
        child: item,
      ),
    ),
  );
}
