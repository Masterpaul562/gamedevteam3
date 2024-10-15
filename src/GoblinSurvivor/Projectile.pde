// Aiden Felt, Canon Unguren| 3 Oct 2024
class Projectile {
  // Memebr Varibles
  PImage staby1; 
  int x, y, w, h;
  int speed, damage, range, atkSpeed;
  boolean unlocked;
  char type;

  // Constructor
  Projectile() {
    x = width/2+50;
    y = height/2+50;
    staby1 = loadImage("Sowrdplaceholder.png");
    //w = ;
    //h = ;
    //speed = ;
    //dmg = ;
    //unlocked = false;
    //type = ;
    //range = ;
    //atkSpeed = ;
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
     staby1.resize(50,50);
    image(staby1, x, y);
  }
  void move () {
    x = x + 1;
  }
}
