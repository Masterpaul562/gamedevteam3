// Axl Dain Paul Tokhtuev | 3 Oct 2024
class Enemy {
  // Member Variables
  Timer zWalk;
  PImage e1, e2;
  float x, y, w, h, x2, y2, dist;
  int health, speed, dmg, side;
  boolean fall, poof;
  char type;
  PVector enemyPos;
  PVector userPos;
  PVector direction;
  PVector playerMovement;
  PVector playerMovement2;
  String walk;

  // Constructor
  Enemy() {
    zWalk = new Timer(600);
    walk = "Zombie.png";
    fall = false;
    side = int(random(1, 5));
    playerMovement = new PVector(1, 1);
    playerMovement2 = new PVector(-1, -1);
    if (side ==1) {
      enemyPos = new PVector (random(width), -10);
    } else if (side == 2) {
      enemyPos = new PVector (width+10, random(height));
    } else if (side == 3) {
      enemyPos = new PVector (random(width), height+10);
    } else if (side == 4) {
      enemyPos = new PVector (-10, random(height));
    }
    userPos = new PVector(width/2, height/2);
    direction = enemyPos.copy();

    x = enemyPos.x;
    y = enemyPos.y;
    x2= userPos.x;
    y2 = userPos.y;
    w = 50;
    h = 50;
    health = 100;
    speed = 5;
    dmg = 10;
    type = 'b';
  }


  // Member Methods
  void update() {

    direction = enemyPos.copy();
    direction.sub(userPos);
    direction.normalize();
    direction.mult(1.5);
    enemyPos.sub(direction);
  }
  void playerMovement() {
    if (keyPressed) {
      if (key == 'a'||key == 'A') {
        enemyPos.x = enemyPos.x + 2;
      } else if (key == 'd'||key == 'D') {
        enemyPos.x = enemyPos.x - 2;
      } else if (key == 'w'||key == 'W') {
        enemyPos.y = enemyPos.y + 2;
      } else if (key == 's'||key == 'S') {
        enemyPos.y = enemyPos.y - 2;
      }
    }
  }

  void display() {


    if (enemyPos.x >width/2) {
      walk = "ZombieFlip.png";
    } else {
      walk = "Zombie.png";
    }
    if (zWalk.isFinished()) {
      if (walk != "Zombie2.png") {
        walk = "Zombie2.png";
      } else {
        walk =  "Zombie.png";
      }
      zWalk.start();
    }
      e1 = loadImage(walk);
      imageMode(CENTER);
      e1.resize(100, 100);
      image(e1, enemyPos.x, enemyPos.y);
    }
    void zombiepoof() {
      if (enemyPos.dist(userPos)<10) {
        poof=true;
      }
      if (enemyPos.x > width+40 || enemyPos.x <-40||enemyPos.y < -40 || enemyPos.y > height +40) {
        fall=true;
      }
    }
  }
