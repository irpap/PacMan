class DartmonMap {
  static final int tileSize = 32;
  static final int boardSize = 12;

  DartmonMap(CanvasElement canvas, CanvasRenderingContext2D ctx) :
    spriteTest = document.query("#sprite1"),
    wall = document.query("#sprite2"),
    map = new List<String>(boardSize)
  {
    canvas.width = tileSize * boardSize;
    canvas.height = tileSize * boardSize;

    data = new List<List<Tile>>(boardSize);

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
    map[10] = "############";
    map[11] = "############";

    render(ctx);
  }

  void render(ctx) {
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


  final ImageElement spriteTest;
  final ImageElement wall;

  final List<String> map;

  CanvasElement _canvas;
  CanvasRenderingContext2D _ctx;

  List<List<Tile>> data;
}
