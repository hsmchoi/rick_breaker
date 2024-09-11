import 'package:brick_breaker/src/brick_breaker.dart';
import 'package:brick_breaker/src/components/play_area.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameRef<BrickBreaker> {
  Ball({
    required this.velocity,
    required double radius,
    required Vector2 position,
  }) : super(
          radius: radius,
          position: position,
          anchor: Anchor.center,
          paint: Paint()
            ..color = const Color(0xFFe63946)
            ..style = PaintingStyle.fill,
        );

  final Vector2 velocity;

  @override //반응에 대한 정의
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is PlayArea) {
      if (intersectionPoints.first.x <= 0 ||
          intersectionPoints.first.x >= game.width) {
        velocity.x = -velocity.x;
      }
      if (intersectionPoints.first.y <= 0) {
        velocity.y = -velocity.y;
      } else if (intersectionPoints.first.y >= game.height) {
        removeFromParent(); // 공이 아래로 떨어졌을 때 제거
      }
    } else {
      debugPrint('충돌 감지: $other');
    }
  }
}
//Ball 클래스를 정의한다.
//Flame의 circleComponent를 확장해서, 공의 위치, 속도를  관리한다. (물리엔진 활용)
