// Canon Unguren, Axl Dain, Paul Tokhtuevm, Oskar Szajnuk, Aiden Felt| Oct 3 2024
Goblin g1;
Enemy el;
Projectile p1;
PowUp o1;
int level;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<PowUp> powUps = new ArrayList<PowUp>();
ArrayList<Tile> tiles = new ArrayList<Tile>();
boolean play;
PImage start1;
void setup() {
  size(500, 500);
  level = 1;
  enemies = new ArrayList<Enemy>();
  g1 = new Goblin();
  p1 = new Projectile();
  o1 = new PowUp();
  play = false;
  tiles.add(new Tile());
  start1 = loadImage("GoblinStart.png");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    //you are playing the game!
        for (int i = 0; i < tiles.size(); i++) {
      Tile part = tiles.get(i);
      part.display();
    }
    
    //tile.display();
    g1.display();
    p1.display();
    //el.display();
    o1.display();
  }
}

void keyPressed() {
}

void startScreen() {
  image(start1, 0, 0);
  if (keyPressed || mousePressed) {
    play = true;
  }
}

void gameOver() {
}
