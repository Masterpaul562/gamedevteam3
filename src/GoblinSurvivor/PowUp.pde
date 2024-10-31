// Oskar Szajnuk, Canon Unguren| October 3 2024
class PowUp {
  // Member Variables
  PImage orb;
  int x, y, w, h,xp;
  char type;

  // Constructor
  PowUp(int x, int y) {
    orb = loadImage("Orb.png");
    this.x = x;
    this.y = y;
    w = 50;
    h = 50;
    xp = 0; 
    type = 'e';
  }

  // Member Methods
  void display() {
    imageMode(CENTER);
    orb.resize(25, 25);
    image(orb, x, y);
  }
  void collect() {
    
  }
  boolean offScreen() {
    if (y >height+50 || y < -50 || x >width+50 || x <-50 ) {
      return true;
    }else {
      return false;
    }

  }
}
