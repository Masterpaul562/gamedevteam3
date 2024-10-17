// Axl Dain | 3 Oct 2024
class Enemy { 
  // Member Variables
  PImage e1;
  int x,y,w,h;
  int health,speed,dmg;
  boolean alive;
  char type;
  
  // Constructor
  Enemy() {
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
     e1.resize(100,100);
    imageMode(CENTER);
    image(e1,50,50);
  }
  void move() {
    x = x + 1;
  }


}
