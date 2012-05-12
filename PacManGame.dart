#library('PacMan');

#import('dart:io');

#import('Player.dart');
#import('ConnectedPlayer.dart');
#import('Message.dart');
#import('Board.dart');
#import('PacManServer.dart');

class PacManGame {
  Player pacman;
  List<Player> players;
  List<Player> ghosts;
  Board board;
  Timer gameLoop;
  final int frequency = 100;
  PacManGame(this.board) : players = [], ghosts = [] {
    this.board.printBoard();
    gameLoop = new Timer.repeating(frequency, (Timer t){ this.gameStep(); });
  }
  Player addPlayer(){
    Player p = new Player(pacman == null, 0, 0);
    if(pacman == null) {
      pacman = p;
    }
    else {
      ghosts.add(p);
    }
    players.add(p);
    
    return p;
  }
  
  void setPlayerDirection(Player p, String direction) {
    p.direction = direction;
  }
  
  void handlePlayerDisconnect(Player p) {

    //delete player from lists
    int index = players.indexOf(p);
    if(index !== -1) {
      players.removeRange(index, 1);
    }
    index = ghosts.indexOf(p);
    if(index !== -1) {
      ghosts.removeRange(index, 1);
    }
  }
  
  void gameStep() {
    print('hello world!');
    //moveAllPlayers();
    //collisionDetection();
  }
  
}
