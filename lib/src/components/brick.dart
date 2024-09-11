import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class Brick extends RectangleComponent with CollisionCallbacks {
  Brick({required Vector2 position})
      : super(
          position: position,
          size: Vector2(brickWidth, brickHeight),
          paint: Paint()..color = Colors.blue,
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(RectangleHitbox()); // 충돌 판정 추가
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    removeFromParent(); // 충돌 시 벽돌 제거
  }
}
