class Tile {
  int width;
  int height;
  int x;
  int y;
  bool solid;
  
  Tile(int tx, int ty, int tw, int th, bool ts)
  {
    width = tw;
    height = th;
    x = tx;
    y = ty;
    solid = ts;
  }
  
  bool Collides(Tile other)
  {
    return(Inside(other.x, other.y) || Inside(other.x + other.width, other.y) ||
        Inside(other.x, other.y + other.height) || Inside(other.x + other.width, other.y + other.height)
        || Inside(other.x + other.width / 2, other.y) || Inside(other.x + other.width / 2, other.y + other.height) ||
        Inside(other.x, other.y + other.height / 2) || Inside(other.x + other.width, other.y + other.height / 2) ||
        Inside(other.x + other.width / 2, other.y + other.height / 2));
  }
  
  bool Inside(int ox, int oy)
  {
    return (ox >= x && ox < x + width) && (oy >= y && oy < y + height);
  }
}