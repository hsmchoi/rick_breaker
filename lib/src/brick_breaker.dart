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
    world.add(Ball(velocity: Vector2(100, 100)));

    debugMode = true;
  }
}

//클래스 BrickBreaker
//flame의 기본 로직
//FlameGame 확장 (extends)

//중돌 감지기 믹스인 = with 