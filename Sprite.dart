#library("PacMan");

#import('dart:html');
#import('ClientPlayer.dart');

/* TODO: Switch to interface */
class Sprite /* default PacManSprite */ {
  static final int width = 32;
  static final int height = 32;

  final List<ImageElement> allFrames; // may need different for different directions if can't rotate image for rendering.
  final num maxFrames;

  num frameNum = 0;

  Sprite(final List<ImageElement> newFrames) :
    allFrames = newFrames,
    maxFrames = newFrames.length {
  }

  void render(CanvasRenderingContext2D ctx, ClientPlayer player) {
    ctx.drawImage(allFrames[frameNum], player.x * width, player.y * height);
    if (++frameNum > maxFrames) {
      frameNum = 0;
    }
    // TODO: Handle player.direction
  }

}
