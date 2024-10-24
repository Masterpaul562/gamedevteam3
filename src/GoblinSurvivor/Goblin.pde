//Paul Tokhtuev Canon Unguren | 3 Oct 2024
class Goblin {
  //Member Variables
  int health, speed;
  boolean alive;
  PImage guy;

  //Constructor
  Goblin() {
    health = 10;
    speed = 1;
    alive = true;
    guy = loadImage("Goblin.png");
  }
  //Member Methods
  void display() {
    imageMode(CENTER);
    guy.resize(100, 100);
    image(guy, width/2, height/2);
  }
}
