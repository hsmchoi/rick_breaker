import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';
import '../config.dart';

class Bat extends RectangleComponent with HasGameRef<BrickBreaker> {
  Bat()
      : super(
          paint: Paint()..color = Colors.white,
          size: Vector2(batWidth, batHeight),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    position =
        Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y - size.y * 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // 배트가 화면 밖으로 나가지 않도록 위치를 제한합니다.
    position.x = position.x.clamp(0, gameRef.size.x - size.x);
  }

  void moveLeft() {
    position.x -= batSpeed * dt;
  }

  void moveRight() {
    position.x += batSpeed * dt;
  }
}
