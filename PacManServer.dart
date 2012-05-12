#library('PacMan');

#import('dart:io');

#import('Player.dart');
#import('ConnectedPlayer.dart');
#import('Message.dart');
#import('PacManGame.dart');
#import('Board.dart');

class PacManManager {
  PacManGame game;
  int connectionCount = 0;
  List<ConnectedPlayer> players;
  PacManManager() : players = [] {
  Board b = new Board(
  '''
_#.._#..._#_
_#.._#..._#_
_#.._#..._#_
_#.._#..._#_
_#.._#..._#_
_#.._#..._#_
_#.._#..._#_'''
  );
    this.game = new PacManGame(b);
  }
  
  
  //get a connection; create a player and listen for messages!
  void onOpenConnection(WebSocketConnection conn) {
    
    ConnectedPlayer p = new ConnectedPlayer(game.addPlayer(), connectionCount, conn);
    players.add(p);
    connectionCount += 1;
    
    //handle incoming messages on the socket
    conn.onMessage = (message) {
      handleMessage(p, message);
    };
    
    //handle socket closing
    conn.onClosed = (int status, String reason) {
      
    };
  }
  
  void handleMessage(ConnectedPlayer p, String message) {
    Message msg = new Message(message);
    if(msg.type == 'PlayerDirectionMessage') {
      handlePlayerDirectionMessage(p, msg);
    }
  }
  
  void handlePlayerDirectionMessage(ConnectedPlayer p, PlayerDirectionMessage m) {
    //update our internal representation
    game.setPlayerDirection(p.player, m.direction);
    
    //send an update to all other players
    for(ConnectedPlayer player in players) {
      if(player !== p) { //test for same instance
        player.connection.send((new PlayerDirectionMessage(p.id, p.player.direction)).toString());
      }
    }
  }
  
  void handleConnectionClose(ConnectedPlayer p, int status, String reason) {
    //notify other players
    for(ConnectedPlayer player in players) {
      if(player !== p) { //test for same instance
        player.connection.send('player ${p.id} disconnected!');
      }
    }
    
    // choose a new pac man?
    if(p.player.isPacMan) {
      
    }
    
    game.handlePlayerDisconnect(p.player);
    
  }
  
  void _sendMessageToAll(Message m) {
    for(ConnectedPlayer p in players) {
      p.connection.send(m.toString());
    }
  }
  
  void sendPlayerDeathMessage(PlayerDeathMessage m) {
    _sendMessageToAll(m);
  }
  void sendPlayerSuperMessage(PlayerSuperMessage m) {
    _sendMessageToAll(m);
  }
  void sendPlayerPositionMessage(PlayerPositionMessage m) {
    _sendMessageToAll(m);
  }
  void sendPlayerDirectionMessage(PlayerDirectionMessage m) {
    for(ConnectedPlayer p in players) {
      if(p.id != m.playerId) {
        p.connection.send(m.toString());
      }
    }
  }
  
}

void main() {
  HttpServer server = new HttpServer();
  WebSocketHandler wsHandler = new WebSocketHandler();
  server.addRequestHandler((req) => req.path == "/ws", wsHandler.onRequest);
  
 PacManManager game = new PacManManager();
  
  wsHandler.onOpen = (WebSocketConnection conn) {
    game.onOpenConnection(conn);
  };
  
  server.listen('127.0.0.1', 8000);
}