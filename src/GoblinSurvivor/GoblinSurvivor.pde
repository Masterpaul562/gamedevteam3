// Canon Unguren, Axl Dain, Paul Tokhtuevm, Oskar Szajnuk, Aiden Felt| Oct 3 2024
Goblin g1;
Projectile p1;
PowUp o1;
Timer eTimer;
Shop shop1;
Panel panel;
Timer frame;
int level;
int tileSize = 150;
int mapWidth = 5000;
int mapHeight = 5000;
PImage t1;
int speed = 5;
float mapOffsetX = -mapWidth/2;
float mapOffsetY = -mapHeight/2;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowUp> powUps = new ArrayList<PowUp>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean play;
PImage start1;
PVector userPos;
void setup() {
  userPos = new PVector(width/2, height/2);
  enemies.add (new Enemy());
  eTimer = new Timer(5000);
  eTimer.start();
  frame = new Timer(20);
  frame.start();
  size(1000, 1000);
  level = 1;
  t1 = loadImage("Tile.png");
  userPos = new PVector(width/2, height/2);
  g1 = new Goblin();
  p1 = new Projectile();
  o1 = new PowUp();
  shop1 = new Shop();
  panel = new Panel();
  play = false;

  start1 = loadImage("GoblinStart.png");
}

void draw() {
  if (!play) {

    startScreen();
  } else {

    if (eTimer.isFinished()) {
      enemies.add(new Enemy());
      eTimer.start();
    }
    background(115);
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        mapOffsetY+= speed;
        if (frame.isFinished()) {
          if (g1.guy != loadImage("GoblinWalkUp2.png")) {
            g1.guy = loadImage("GoblinWalkUp1.png");
          } else {
            g1.guy = loadImage("GoblinWalkUp2.png");
          }
          frame.start();
        }
      } else if (key == 's' || key == 'S') {
        mapOffsetY -= speed;
      } else if (key == 'd' || key == 'D') {
        mapOffsetX -= speed;
      } else if (key == 'a' || key == 'A') {
        mapOffsetX += speed;
      } else if (key == 'e' || key == 'E') {
        if (frameRate == 0) {
          frameRate(60);
          shop1.shopOpen = false;
        } else {
          frameRate(0);
          shop1.shopOpen = true;
        }
      }


      if (keyCode == RIGHT) {
        mapOffsetX -= speed;
      } else if (keyCode == LEFT) {
        mapOffsetX += speed;
      } else if (keyCode == UP) {
        mapOffsetY += speed;
      } else if (keyCode == DOWN) {
        mapOffsetY -= speed;
      }
    }
    //you are playing the game!
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
    panel.display();
    shop1.display();
    g1.display();
    p1.display();
    o1.display();
    for (int i = 0; i < enemies.size(); i++) {
      Enemy part = enemies.get(i);
      part.update();
      part.zombiepoof();

      part.display();
      if (part.poof == true) {
        enemies.remove(i);
        panel.enemiesKilled = panel.enemiesKilled+1;
        g1.health= g1.health - 15;
      }
    }
    if (g1.health <= 0) {
      gameOver();
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    mapOffsetX -= speed;
  } else if (keyCode == LEFT) {
    mapOffsetX += speed;
  } else if (keyCode == UP) {
    mapOffsetY += speed;
  } else if (keyCode == DOWN) {
    mapOffsetY -= speed;
  }
}

void startScreen() {
  start1.resize(1000, 1000);
  image(start1, 0, 0);
  if (keyPressed || mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over", width/2-20, height/2-20);
  noLoop();
}
