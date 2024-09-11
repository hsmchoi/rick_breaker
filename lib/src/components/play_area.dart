import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';

class PlayArea extends RectangleComponent with HasGameRef<BrickBreaker> {
  PlayArea()
      : super(
          paint: Paint()..color = const Color(0xFFf2e8cf),
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    size = Vector2(gameWidth, gameHeight);
  }
}


//PlayerArea라는 클래스를 만든다. 
// 이 클래스는 플레이 영역을 만드는게 목적이다. 마치 농장을 짓기 전에 울타리를 치는것과 같다. 
// Flame에서 지원하는 Rectanglecomponent(직선의 부품)