// Axl Dain Paul Tokhtuev | 3 Oct 2024
class Enemy {
  // Member Variables
  PImage e1;
  int x, y, w, h;
  int health, speed, dmg;
  boolean alive;
  char type;
  PVector enemyPos;
  PVector userPos;
  PVector direction;
  PVector playerMovement;
  PVector playerMovement2;
  boolean poof;


  // Constructor
  Enemy() {
    playerMovement = new PVector(1, 1);
      playerMovement2 = new PVector(-1, -1);
    enemyPos = new PVector(random(displayWidth+10|displayWidth-10), random(displayHeight+10|displayHeight-10));
    userPos = new PVector(width/2, height/2);
    direction = enemyPos.copy();
    e1 =  loadImage("Zombie.png");
    x = width/2;
    y = height/2;
    w = 50;
    h = 50;
    health = 100;
    speed = 5;
    dmg = 10;
    alive = true;
    type = 'b';
  }


  // Member Methods
  void update() {
    
    
    direction = enemyPos.copy();
    direction.sub(userPos);
    direction.normalize();
    direction.mult(3);
    enemyPos.sub(direction);
    
  }

  void display() {
    e1.resize(100, 100);
    imageMode(CENTER);
    image(e1, enemyPos.x, enemyPos.y);
  }
  void zombiepoof() {
  if(enemyPos==userPos){
  poof=true;
  }
  }
}
