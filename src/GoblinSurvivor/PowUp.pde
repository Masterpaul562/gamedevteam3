// Oskar Szajnuk, Canon Unguren| October 3 2024
class PowUp {
  // Member Variables
  Timer spin;
  PImage[] coin;
  int x, y, w, h, xp,frame;
  char type;

  // Constructor
  PowUp(int x, int y) {
    spin = new Timer(200); 
    spin.start();
    coin = new PImage[13];
    for (int i = 0; i <12; i++) {
    coin[i] = loadImage("CoinSpin" + i +".png");
    }
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
    image(coin[frame], x, y);
    if (spin.isFinished()) {
    image(coin[frame], x, y);
    spin.start();
    }
    if (frame <12) {
    frame++;
    
    }
    if (frame ==12){frame=0;}
  }
  void collect() {
  }
  boolean offScreen() {
    if (y >height+50 || y < -50 || x >width+50 || x <-50 ) {
      return true;
    } else {
      return false;
    }
  }
}
