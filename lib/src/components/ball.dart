import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Ball extends CircleComponent {
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

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }
}
//Ball 클래스를 정의한다. 
//Flame의 circleComponent를 확장해서, 공의 위치, 속도를  관리한다. (물리엔진 활용)

