#library('PacMan');

class Tile {
  static final num size = 1;
  int x;
  int y;
  String type;  
  Tile(this.x, this.y, this.type);

  //TODO: delete this!
  /*bool Collides(Tile other)
  {
    return(Inside(other.x, other.y) || Inside(other.x + other.width, other.y) ||
        Inside(other.x, other.y + other.height) || Inside(other.x + other.width, other.y + other.height)
        || Inside(other.x + other.width / 2, other.y) || Inside(other.x + other.width / 2, other.y + other.height) ||
        Inside(other.x, other.y + other.height / 2) || Inside(other.x + other.width, other.y + other.height / 2) ||
        Inside(other.x + other.width / 2, other.y + other.height / 2));
  }*/
  
  bool Inside(int ox, int oy)
  {
    return (ox >= x && ox < x + size) && (oy >= y && oy < y + size);
  }
}