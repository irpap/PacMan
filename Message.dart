#library('PacMan');

#import ('dart:json');

class Message {
  String type;
  factory Message(String json) {
    Message m = JSON.parse(json);
    //server -> client messages
    if(m.type == 'InitPlayerMessage') {
      return new InitPlayerMessage.parse(m);
    }
    else if(m.type == 'PlayerDeathMessage') {
      return new PlayerDeathMessage.parse(m);
    }
    else if(m.type == 'PlayerSuperMessage') {
      return new PlayerSuperMessage.parse(m);
    }
    else if(m.type == 'PlayerPositionMessage') {
      return new PlayerPositionMessage.parse(m);
    }
    //client <-> server messages
    else if(m.type == 'PlayerDirectionMessage') {
      return new PlayerDirectionMessage.parse(m);
    }
  }
}

/**
 * Messages sent from server to client
 */
/**
 * InitPlayerMessage is sent to the player when they join the game
 */
class InitPlayerMessage implements Message {
  int playerId;
  String map;
  double x;
  double y;
  bool isPacMan;
  final String type = 'InitPlayerMessage';
  
  // server-only: create a message to send to the client to initialize it
  InitPlayerMessage(this.playerId, this.map, this.x, this.y, this.isPacMan);
  
  //client only: create a message from input (called from factory)
  InitPlayerMessage.parse(InitPlayerMessage m) {
    playerId = m.playerId;
    map = m.map;
    x = m.x;
    y = m.y;
    isPacMan = m.isPacMan;
    
  }
  
  //server-only: stringify this object so that it can be sent over the websoket
  String toString() {
    return JSON.stringify({
      'type': type,
      'playerId': playerId,
      'map': map,
      'x': x,
      'y': y,
      'isPacMan': isPacMan
    });
  }
}

/**
 * PlayerDeathMessage is sent to all players whenever a player (ghost or 
 * pacMan) is killed
 */
class PlayerDeathMessage implements Message {
  int playerId;
  double x;
  double y;
  final String type = 'PlayerDeathMessage';
  
  // server-only: create a message to send to the client to kill it and set its new position
  PlayerDeathMessage(this.playerId, this.x, this.y);
  
  //client only: create a message from input (called from factory)
  PlayerDeathMessage.parse(PlayerDeathMessage m) {
    playerId = m.playerId;
    x = m.x;
    y = m.y;
  }
  
  //server-only: stringify this object so that it can be sent over the websoket
  String toString() {
    return JSON.stringify({
      'type': type,
      'playerId': playerId,
      'x': x,
      'y': y
    });
  }
}

/**
 * PlayerSuperMessage is sent to all players when pacMan eats a 
 * super pill and when the super pill wears off
 */
class PlayerSuperMessage implements Message {
  int playerId;
  bool isSuper;
  final String type = 'PlayerSuperMessage';
  
  // server-only: create a message to send to the client to kill it and set
  // its new position
  PlayerSuperMessage(this.playerId, this.isSuper);
  
  //client only: create a message from input (called from factory)
  PlayerSuperMessage.parse(PlayerSuperMessage m) {
    playerId = m.playerId;
    isSuper = m.isSuper;
  }
  
  //server-only: stringify this object so that it can be sent over the websoket
  String toString() {
    return JSON.stringify({
      'type': type,
      'playerId': playerId,
      'isSuper': isSuper
    });
  }
}

/**
 * PlayerPositionMessage is sent to all players when a player's position needs to be updated
 * TODO: is this needed or could we repurpose PlayerDeathMessage for this if needed?
 */
class PlayerPositionMessage implements Message {
  int playerId;
  double x;
  double y;
  final String type = 'PlayerPositionMessage';
  
  // server-only: create a message to send to the client to kill it and set its new position
  PlayerPositionMessage(this.playerId, this.x, this.y);
  
  //client only: create a message from input (called from factory)
  PlayerPositionMessage.parse(PlayerPositionMessage m) {
    playerId = m.playerId;
    x = m.x;
    y = m.y;
  }
  
  //server-only: stringify this object so that it can be sent over the websoket
  String toString() {
    return JSON.stringify({
      'type': type,
      'playerId': playerId,
      'x': x,
      'y': y
    });
  }
}



/**
 * Messages sent in both directions
 */

/**
 * Players send this message to the server to request a direction change
 * The server sends this message to all players whenever a player's direction changes
 */
class PlayerDirectionMessage implements Message {
  int playerId;
  String direction;
  final String type = 'PlayerDirectionMessage';
  
  // create a message to send to the client to initialize it
  PlayerDirectionMessage(this.playerId, this.direction);
  
  // create a message from input (called from factory)
  PlayerDirectionMessage.parse(PlayerDirectionMessage m) {
    playerId = m.playerId;
    direction = m.direction;
  }
  
  // stringify this object so that it can be sent over the websoket
  String toString() {
    return JSON.stringify({
      'type': type,
      'playerId': playerId,
      'direction': direction
    });
  }
}

