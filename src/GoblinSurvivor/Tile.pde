//Canon Unguren, Paul Tokhtuev | Oct 8
int x, y, w, h;
PImage floor;
class Tile {
  Tile() {

    x = CENTER;
    y = CENTER;
    w = width;
    h = height;
    floor = loadImage("Tile.png");
  }

  void display() {
    floor.resize(width, height);
    image(floor, x, y);
  }
}
