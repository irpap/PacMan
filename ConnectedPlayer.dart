#library('PacMan');

#import('dart:io');

#import('Player.dart');

class ConnectedPlayer {
  Player player;
  int id;
  WebSocketConnection connection;
  ConnectedPlayer(this.player, this.id, this.connection);
}
