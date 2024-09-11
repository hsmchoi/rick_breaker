import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'components/ball.dart';
import 'components/bat.dart';
import 'components/brick.dart';
import 'components/play_area.dart';
import 'config.dart';

class BrickBreaker extends FlameGame with HasCollisionDetection {
  @override
  Future<void> onLoad() async {
    camera.viewport = FixedResolutionViewport(Vector2(gameWidth, gameHeight));
    add(PlayArea());
    add(Ball(velocity: Vector2(100, 100)));
    add(Bat());
    addBricks(); // 벽돌 추가
  }

  void addBricks() {
    const brickWidthWithSpacing = brickWidth + 4;
    const brickHeightWithSpacing = brickHeight + 4;

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        final position = Vector2(
          col * brickWidthWithSpacing +
              (gameWidth - cols * brickWidthWithSpacing) / 2,
          row * brickHeightWithSpacing + 50,
        );
        add(Brick(position: position));
      }
    }
  }
}
