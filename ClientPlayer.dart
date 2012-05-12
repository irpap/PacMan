#library('PacMan');

#import('dart:html');

#import("Player.dart");
#import("Sprite.dart");

class ClientPlayer extends Player {
  final Sprite sprite;

  ClientPlayer(bool isPacMan, double x, double y, Sprite this.sprite) : super(isPacMan, x, y);

  void render(CanvasRenderingContext2D ctx) => sprite.render(ctx, this);
}
