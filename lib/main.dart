import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'src/brick_breaker.dart';

void main() {
  final game = BrickBreaker();
  runApp(GameWidget(game: game));
}

//FlameGame => BrickBreaker()로 불러올수 있다. 
// class BrickBreaker extends FlameGame {
//   BrickBreaker()
//       : super(
//           camera: CameraComponent.withFixedResolution(
//             width: gameWidth,
//             height: gameHeight,
//           ),
//         );
//   @override
//   FutureOr<void> onLoad() async {
//     super.onLoad();
//     camera.viewport.anchor = Anchor.topLeft;
//     world.add(PlayArea());
//   }
// }
