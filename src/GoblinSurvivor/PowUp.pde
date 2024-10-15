// Oskar Szajnuk | October 3 2024
class PowUp {
  // Member Variables
  PImage orb;
  int x,y,w,h;
  char type;
  
  // Constructor
  PowUp() {
    orb = loadImage("Orb.png");
    x = 100;
    x = 100;
    w = 50;
    h = 50;
    type = 'e';
  }
  
  // Member Methods
  void display() {
    imageMode(CENTER);
    // g1.resize(50,50)
    image(orb,x,y);
  }
  

}
