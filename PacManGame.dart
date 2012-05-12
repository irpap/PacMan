#library('PacMan');

#import('dart:io');

#import('Player.dart');
#import('ConnectedPlayer.dart');
#import('Message.dart');
#import('Board.dart');
#import('PacManServer.dart');
#import('tile.dart');

class PacManGame {
  Player pacman;
  List<Player> players;
  List<Player> ghosts;
  Board board;
  Timer gameLoop;
  final double stepSize = Tile.size / 10; 
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
    moveAllPlayers();
    //collisionDetection();
  }
  void moveAllPlayers() {
    for (Player player in players) {
      movePlayerForwardIfSpace(player);
    }
  }
  
  void movePlayerForwardIfSpace(Player player) {
    double nextx = player.x;
    double nexty = player.y;
    if(player.direction == 'N') {
      nexty -= stepSize;
    }
    else if(player.direction == 'S') {
      nexty += stepSize;
    }
    else if(player.direction == 'E') {
      nextx -= stepSize;
    }
    else if(player.direction == 'E') {
      nextx += stepSize;
    }   
    
    if (board.withinBounds(nextx, nexty) && board.getTile(nextx, nexty).type != '#') {
      player.x = nextx;
      player.y = nexty;
    }
    
    //if you weren't at the edge, go to the edge;
}
  
}
