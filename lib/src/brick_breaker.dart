import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/play_area.dart';
import 'config.dart';

class BrickBreaker extends FlameGame {
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
  }
}

//클래스 BrickBreaker
//flame의 기본 로직
//FlameGame 확장 (extends)

