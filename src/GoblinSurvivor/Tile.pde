//Canon Unguren, Paul Tokhtuev | Oct 8
int tileSize = 150;
int mapWidth = 5000;
int mapHeight = 5000;
float mapOffsetX = -mapWidth/2;
float mapOffsetY = -mapHeight/2;
PImage t1;
class Tile {
  Tile() {
    t1 = loadImage("Tile.png");
  }

  void display() {
    for (int x = 0; x < mapWidth; x += tileSize) {
      for (int y = 0; y < mapHeight; y += tileSize) {
        float drawX = x + mapOffsetX;
        float drawY = y + mapOffsetY;
        if (mapOffsetX <= -mapWidth+1000|| mapOffsetX >= -1000 ) {
          mapOffsetX = -2500;
        } else if ( mapOffsetY <= -mapHeight+1000 || mapOffsetY >= -1000) {
          mapOffsetY = -2500;
        }
        //println(mapOffsetX, mapOffsetY);
        // Only draw tiles that are visible within the screen
        if (drawX > -tileSize && drawX < width && drawY > -tileSize && drawY < height) {
          //fill((x + y) % 255);  // Vary tile color based on position
          t1.resize(tileSize, tileSize);
          imageMode(CORNER);
          image(t1, drawX, drawY);  // Draw tile
        }
      }
    }
  }
}
