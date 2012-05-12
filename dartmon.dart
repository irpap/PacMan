#import('dart:html');
#import('dart:core');

void main() {
  show('FARKORF!');
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
    
    player = new Player();
    
    _canvas.on.keyPress.add((KeyboardEvent e) {
      int kc = e.keyCode;
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
  
  Player player;

  static final String ORANGE = "orange";
  static final TAU = Math.PI * 2;
}

class DartmonMap
{
  int tileSize = 32;
  int boardSize = 12;
 
  DartmonMap(CanvasElement canvas, CanvasRenderingContext2D ctx)
  {
    canvas.width = tileSize * boardSize;
    canvas.height = tileSize * boardSize;
    
    ImageElement spriteTest = document.query("#sprite1");
    ImageElement wall = document.query("#sprite2");
        
    List<String> map = new List<String>(boardSize);
  
    map[0] = "############";
    map[1] = "#..........#";
    map[2] = "#  .   S   #";
    map[3] = "#   .      #";
    map[4] = "#   .      #";
    map[5] = "#   .      #";
    map[6] = "#          #";
    map[7] = "#          #";
    map[8] = "#  .       #";
    map[9] = "############";
    
    
    
    for(var c = 0; c < map.length; c++)
    {
      String line = map[c];
      for(var i = 0; i < line.length; i++)
      {
        bool solid = false;
        if(line.substring(i).startsWith("#"))
        {
          ctx.drawImage(wall, i * tileSize, c * tileSize);
          solid = true;
        }
        else if(line.substring(i).startsWith("."))
        {
          ctx.drawImage(spriteTest, i * tileSize, c * tileSize);
        }
        
        
      }
    }
  }
    
    CanvasElement _canvas;
    CanvasRenderingContext2D _ctx;
    
    List<List<Tile>> data;
}

class Tile
{
  int size = 32;
  bool solid;
  int x;
  int y;
  
  Tile(int xp, int yp, bool c)
  {
    xp = x;
    yp = y;
    solid = c;
  }
  
  
}

class Player
{
  Player()
  {
    player = document.query("#player");
  }
  
  ImageElement player;
  
}