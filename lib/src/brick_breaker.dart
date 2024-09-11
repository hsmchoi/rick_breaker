import 'dart:async';
import 'package:brick_breaker/src/components/ball.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'dart:math' as math;
import 'components/play_area.dart';
import 'config.dart';

class BrickBreaker extends FlameGame with HasCollisionDetection {
  BrickBreaker()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    camera.viewport.anchor = Anchor.topLeft;
    world.add(PlayArea());

    final ball = Ball(
        velocity: (Vector2(math.cos(math.pi / 4), math.sin(math.pi / 44))
              ..normalize()) *
            (gameHeight / 4),
        radius: ballRadius,
        position: Vector2(
          gameWidth / 2,
          gameHeight * 0.75,
        ));
    //공의 속도 velocity, 반지름 radius, 초기 위치를 설정한다.
    //너비 /2 , 높이 * 0.75 = 중앙에서 아래로 25%
  }
}

//클래스 BrickBreaker
//flame의 기본 로직
//FlameGame 확장 (extends)

//중돌 감지기 믹스인 = with hascollisiondetection