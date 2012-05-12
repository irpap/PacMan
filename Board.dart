#library('PacMan');

#import('tile.dart');

class Board {
  
  List<List<Tile>> board;
  int width;
  int height;
  List<double> pacManStart;
  List<double> ghostStart;
  Board(String boardRows) : board =  new List<List<Tile>>(){ 
    populateBoardFromInput(boardRows);
    width = board.length;
    height = board[0].length;
  }
 
  bool withinBounds(double x, double y) {
    return x>=1/2 && x<width-1/2 && y>=1/2 && y<height-1/2;
  }
  
  Tile getTile(double x, double y) {
    return board[y.floor().toInt()][x.floor().toInt()];
  }
  
  void printBoard() {
    for (List<Tile> row in board) {
      for(Tile t in row) {
       print(t.type); 
      }
    }
  }
  
  void populateBoardFromInput(String boardRows) {
    List<String> rows = boardRows.split("\n");
    
    for (var i  = 0; i < rows.length; i++) {
      List<String> strings = rows[i].splitChars();
      List<Tile> tiles = [];
      for(int j = 0; j < strings.length; j ++) {
        tiles.add(new Tile(j, i, strings[j]));
      }
      board.add(tiles);
    }
  }
  
  
}
