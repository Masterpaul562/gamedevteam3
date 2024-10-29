// Oskar Szajnuk | October 3 2024
class PowUp {
  // Member Variables
  PImage orb;
  int x, y, w, h;
  char type;

  // Constructor
  PowUp() {
    orb = loadImage("Orb.png");
    x = 20;
    y = 450;
    w = 50;
    h = 50;
    type = 'e';
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    orb.resize(25, 25);
    image(orb, x, y);
  }
}
