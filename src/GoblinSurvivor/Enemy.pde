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
  PVector velocity;
  PVector direction;

  // Constructor
  Enemy() {
    enemyPos = new PVector(random(displayWidth+20|displayWidth-20), random(displayHeight+20|displayHeight-20));
    userPos = new PVector(width/2, height/2);
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
  void display() {
    e1.resize(100, 100);
    imageMode(CENTER);
    image(e1, 50, 50);
  }
  void move() {
    direction = new PVector(width/2,height/2);
    direction.sub(userPos);
    direction.normalize();
    direction.mult(5);
  }
}
