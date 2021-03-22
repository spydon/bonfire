import 'dart:ui';

import 'package:bonfire/base/game_component.dart';
import 'package:bonfire/bonfire.dart';
import 'package:bonfire/objects/follower_object.dart';
import 'package:bonfire/util/vector2rect.dart';

class AnimatedFollowerObject extends FollowerObject {
  final bool loopAnimation;
  final SpriteAnimation animation;

  AnimatedFollowerObject({
    this.animation,
    GameComponent target,
    Vector2Rect positionFromTarget,
    this.loopAnimation = false,
  }) : super(target, positionFromTarget);

  @override
  void render(Canvas canvas) {
    if (animation == null || position == null) return;
    animation
        .getSprite()
        .render(canvas, position: position.position, size: position.size);
    super.render(canvas);
  }

  @override
  void update(double dt) {
    animation?.update(dt);
    super.update(dt);
    if (!loopAnimation) {
      if (animation.isLastFrame) {
        remove();
      }
    }
  }
}
