#import('dart:html');
#import('dart:core');

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
    
    player = new Player();
    
    infoDiv = document.query("#info");
    infoDiv.innerHTML = "Key: " + 123;
    
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
  
  Player player;
  
  DivElement infoDiv;

  static final String ORANGE = "orange";
  static final TAU = Math.PI * 2;
}

class Tile {
  int width;
  int height;
  int x;
  int y;
  bool solid;
  
  Tile(int tx, int ty, int tw, int th, bool ts)
  {
    width = tw;
    height = th;
    x = tx;
    y = ty;
    solid = ts;
  }
  
  bool Collides(Tile other)
  {
    return(Inside(other.x, other.y) || Inside(other.x + other.width, other.y) ||
        Inside(other.x, other.y + other.height) || Inside(other.x + other.width, other.y + other.height)
        || Inside(other.x + other.width / 2, other.y) || Inside(other.x + other.width / 2, other.y + other.height) ||
        Inside(other.x, other.y + other.height / 2) || Inside(other.x + other.width, other.y + other.height / 2) ||
        Inside(other.x + other.width / 2, other.y + other.height / 2));
  }
  
  bool Inside(int ox, int oy)
  {
    return (ox >= x && ox < x + width) && (oy >= y && oy < y + height);
  }
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
    
    data = new List<List<Tile>>(boardSize);
        
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
      data[c] = new List<Tile>(boardSize);
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
        
        data[c][i] = new Tile(i * tileSize, c * tileSize, tileSize, tileSize, solid);
      }
    }
  }
    
    CanvasElement _canvas;
    CanvasRenderingContext2D _ctx;
    
    List<List<Tile>> data;
}

class Player
{
  Player()
  {
    player = document.query("#player");
  }
  
  ImageElement player;
  
}