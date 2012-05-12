#library("PacMan");

#import('dart:html');
#import('Player.dart');

/* TODO: Switch to interface */
class Sprite /* default PacManSprite */ {
  static final int width = 32;
  static final int height = 32;

  final List<ImageElement> allFrames; // may need different for different directions if can't rotate image for rendering.
  final Player player;

  num frameNum = 0;

  Sprite(final List<ImageElement> this.allFrames, Player this.player) {
  }

  void render(ctx) {
    ctx.drawImage(allFrames[frameNum], player.x * width, player.y * height);
    // TODO: Handle player.direction
  }

}
