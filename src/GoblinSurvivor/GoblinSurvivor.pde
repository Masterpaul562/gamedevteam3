// Canon Unguren, Axl Dain, Paul Tokhtuevm, Oskar Szajnuk, Aiden Felt| Oct 3 2024
Goblin g1;
Projectile p1;
PowUp o1;
Enemy[] enemies;
int level;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowUp> powUps = new ArrayList<PowUp>();
ArrayList<Tile> tiles = new ArrayList<Tile>();
boolean play;
PImage start1;
PVector userPos;
void setup() {
  size(500, 500);
  level = 1;
  userPos = new PVector(width/2, height/2);
  g1 = new Goblin();
  p1 = new Projectile();
  o1 = new PowUp();
  play = false;
  tiles.add(new Tile());
  start1 = loadImage("GoblinStart.png");
  enemies = new Enemy[10];
  for (int i = 0; i < enemies.length; i++) {
    enemies[i] = new Enemy();
  }
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
    g1.display();
    p1.display();
    o1.display();
    for (int i = 0; i < enemies.length; i++) {
      enemies[i].update();
      enemies[i].display();
    }
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
