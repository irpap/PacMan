#library('PacMan');

#import('dart:html');
#import('dart:core');
#import('tile.dart');
#import('DartmonMap.dart');
#import("Sprite.dart");
#import("ClientPlayer.dart");


void main() {
  show('Pleasent message!');
  new Dartmon();
}

void show(String message) {
  document.query('#status').innerHTML = message;
}

class Dartmon
{
  Dartmon()
  {
    _canvas = document.query("#canvas");
    _ctx = _canvas.getContext("2d");

    dartMap = new DartmonMap(_canvas, _ctx);

    List<ImageElement> frames = [document.query("#player"), document.query("#sprite1")];
    Sprite sprite = new Sprite(frames);
    player = new ClientPlayer(true, 5.0, 5.0, sprite);
    player.render(_ctx);

    document.on.keyDown.add((KeyboardEvent e) {
      int kc = e.keyCode;
      show("Key: " + kc);
    }, true);

    startGame();
  }

  void startGame() {
    window.webkitRequestAnimationFrame(update);
  }

  bool update(num highResTime) {
    // TODO: collisions
    render();
    window.webkitRequestAnimationFrame(update);
    return false;
  }

  void render() {
    player.render(_ctx);
  }

  ClientPlayer player;
  DartmonMap dartMap;

  CanvasElement _canvas;
  CanvasRenderingContext2D _ctx;

}