#library("PacMan");

#import('dart:html');
#import('ClientPlayer.dart');

/* TODO: Switch to interface */
class Sprite /* default PacManSprite */ {
  static final int width = 32;
  static final int height = 32;

  final List<ImageElement> allFrames; // may need different for different directions if can't rotate image for rendering.

  num frameNum = 0;

  Sprite(final List<ImageElement> this.allFrames) {
  }

  void render(CanvasRenderingContext2D ctx, ClientPlayer player) {
    ctx.drawImage(allFrames[frameNum], player.x * width, player.y * height);
    // TODO: Handle player.direction
  }

}
