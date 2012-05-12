#library('PacMan');

class Board {
  
  List<List<String>> board;
  
  Board(String boardRows) : board =  new List<List<String>>(){ 
    populateBoardFromInput(boardRows);
  }
 
  void printBoard() {
    for (List<String> row in board) {
      print(row);
    }
  }
  
  void populateBoardFromInput(String boardRows) {
    List<String> rows = boardRows.split("\n");
    
    for (var i  = 0; i < rows.length; i++) {
      board.add(rows[i].splitChars());
    }
  }
  
  
}
