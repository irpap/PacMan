class DartmonMap {
  int tileSize = 32;
  int boardSize = 12;
  int startX;
  int startY;
 int pillCount;
 
  DartmonMap(CanvasElement canvas, CanvasRenderingContext2D ctx)
  {
    _ctx = ctx;
    
    canvas.width = tileSize * boardSize;
    canvas.height = tileSize * boardSize;
    
    pill = document.query("#sprite1");
    wall = document.query("#sprite2");

    data = new List<List<Tile>>(boardSize);
    
    List<String> map = new List<String>(boardSize);
    
    pillCount = 0;
  
    map[0] = "############";
    map[1] = "#..........#";
    map[2] = "#..S.......#";
    map[3] = "#..........#";
    map[4] = "#..........#";
    map[5] = "#..........#";
    map[6] = "#..........#";
    map[7] = "#..........#";
    map[8] = "#..........#";
    map[9] = "#..........#";
    map[10]= "#..........#";
    map[11]= "############";
    
    int blockCount = 20;
    
    int bss = boardSize - 2;
    
    /*for(int i = 0; i < blockCount; i++)
    {
      int x = Math.random() * bss;
      int y = Math.random() * bss;
    }*/
    
    for(var c = 0; c < map.length; c++)
    {
      String line = map[c];
      data[c] = new List<Tile>(boardSize);
      for(var i = 0; i < line.length; i++)
      {
        String type = "";
        if(line.substring(i).startsWith("#"))
          type = "#";
        else if(line.substring(i).startsWith("."))
        {
          type = ".";
          pillCount++;
        }
        else if(line.substring(i).startsWith("S"))
        {
          type = ".";
          startX = i * tileSize;
          startY = c * tileSize;
          pillCount++;
        }
        else
          type = " ";
        data[c][i] = new Tile(i * tileSize, c * tileSize, tileSize, tileSize, type);
      }
    }
  }
  
  check(Player p)
  {
    int psize = 16;
    
    Tile pt = new Tile(p.x + 8, p.y + 8, psize, psize, "#");
    Tile wt = new Tile(p.x + 2, p.y + 2, tileSize - 4, tileSize - 4, "#");
    for(int c = 0; c < boardSize; c++)
    {
      for(int i = 0; i < boardSize; i++)
      {
        Tile tile = data[c][i];
        if(tile.Collides(pt) && tile.type == ".")
        {
            tile.type = " ";
            p.addScore();
        }
        if(tile.Collides(wt) && tile.type == "#")
          {
             p.jumpBack();
          }
      }
    }
  }
  
  render()
  {
    
    for(var c = 0; c < boardSize; c++)
    {
      for(var i = 0; i < boardSize; i++)
      {
        Tile tile = data[c][i];
        if(tile.type == "#")
        {
          _ctx.drawImage(wall, i * tileSize, c * tileSize);
        }
        else if(tile.type == ".")
        {
          _ctx.drawImage(pill, i * tileSize, c * tileSize);
        }        
      }
    }
  }
  ImageElement pill;
  ImageElement wall;

    CanvasElement _canvas;
    CanvasRenderingContext2D _ctx;
    
    List<List<Tile>> data;
}
