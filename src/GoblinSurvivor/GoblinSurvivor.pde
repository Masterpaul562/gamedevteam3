// Canon Unguren, Axl Dain, Paul Tokhtuevm, Oskar Szajnuk, Aiden Felt| Oct 3 2024
Goblin g1;
Tile tile;
int level;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<PowUp> powUps = new ArrayList<PowUp>();
//ArrayList<Tile> tiles = new ArrayList<Tile>();
boolean play;
PImage start1;
void setup() {
  size(500, 500);
  level = 1;
  tile = new Tile();
  g1 = new Goblin();
  play = false;
  start1 = loadImage("GoblinStart.png");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    //you are playing the game!
    //background(127);
    tile.display();
   g1.display();
   
  // tile.display();
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
