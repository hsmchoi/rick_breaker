import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class Ball extends CircleComponent
    with HasGameRef<BrickBreaker>, CollisionCallbacks {
  Ball({required Vector2 velocity})
      : _velocity = velocity,
        super(radius: ballRadius);

  final Vector2 _velocity;

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;

    // 벽에 부딪혔을 때 반응
    if (position.y <= 0) {
      _velocity.y = -_velocity.y;
    }
    if (position.x <= 0 || position.x >= gameRef.size.x) {
      _velocity.x = -_velocity.x;
    }
    if (position.y >= gameRef.size.y) {
      removeFromParent(); // 공이 화면 아래로 사라지면 제거
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bat) {
      _velocity.y = -_velocity.y; // 배트에 부딪히면 위로 튕김
    }
  }
}
