//Paul Tokhtuev | 3 Oct 2024
class Goblin {
  //Member Variables
  float health,speed; 
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
    image(guy,width/2,height/2);
    //guy.resize(50,50)
  }
  void move() {
    
  }
  
}
