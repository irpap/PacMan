#library('PacMan');

#import('dart:html');
#import('dart:core');

#source('tile.dart');
#source('DartmonMap.dart');

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
    
    infoDiv = document.query("#info");
    infoDiv.innerHTML = "Key: " + 123;
    infoDiv.text = "SSx";
    
    //HTMLElement body = document.query("html");
    
    document.on.keyDown.add((KeyboardEvent e) {
      int kc = e.keyCode;
      infoDiv.innerHTML = "Key: " + kc;
    }, true);
  }
  
  void drawSeed(num x, num y) {
    _ctx.beginPath();
    _ctx.lineWidth = 2;
    _ctx.fillStyle = ORANGE;
    _ctx.strokeStyle = ORANGE;
    _ctx.arc(x, y, 5, 0, TAU, false);
    _ctx.fill();
    _ctx.closePath();
    _ctx.stroke();
  }
  
  DartmonMap dartMap;
  
  CanvasElement _canvas;
  CanvasRenderingContext2D _ctx;
  
  DivElement infoDiv;

  static final String ORANGE = "orange";
  static final TAU = Math.PI * 2;
}