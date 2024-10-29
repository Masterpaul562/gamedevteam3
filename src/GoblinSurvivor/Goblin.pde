//Paul Tokhtuev Canon Unguren | 3 Oct 2024
class Goblin {
  //Member Variables
  int health, speed;
  boolean alive;
  PImage guy;
  String img1;

  //Constructor
  Goblin() {
    img1 = "Goblin.png";
    health = 100;
    speed = 1;
    alive = true;
    guy = loadImage(img1);
  }
  //Member Methods
  void display() {
    guy = loadImage(img1);
    imageMode(CENTER);
    guy.resize(100, 100);
    image(guy, width/2, height/2);
  }
}
