// Aiden Felt, Canon Unguren| 3 Oct 2024
class Projectile {
  // Memebr Varibles
  PImage arrow;
  int x, y, w, h;
  int speed, damage, range, atkSpeed;
  boolean unlocked, disappear;
  char type;
  PVector arrowPos;
  String direction;
  Timer aFireT;


  // Constructor
  Projectile() {
    direction = "ArrowUP.png";
    aFireT = new Timer(4000);
    arrowPos = new PVector (width/2, height/2);
  }

  // Member Methods
  void display() {
   
      if (key == 'w' | key == 'W') {
        direction = "ArrowUP.png";
      }
      if (key == 's' | key == 'S') {
        direction = "ArrowDown.png";
      }
      if (key == 'd' | key == 'D') {
        direction = "ArrowRight.png";
      }
      if (key == 'a' | key == 'A') {
        direction = "ArrowLeft.png";
      }
    
    arrow = loadImage(direction);

    imageMode(CENTER);
    arrow.resize(50, 50);
    image(arrow, arrowPos.x, arrowPos.y);
    if (arrowPos.x > width+40 || arrowPos.x <-40||arrowPos.y < -40 || arrowPos.y > height +40) {
      disappear=true;
    }
  }
  void fire () {
    if (aFireT.isFinished()) {
     
        if (key == 'w' | key == 'W') {
         
          arrowPos.y -= 2;
        }
        if (key == 's' | key == 'S') {
       
          arrowPos.y += 2;
        }
        if (key == 'd' | key == 'D') {
       
          arrowPos.x += 2;
        }
        if (key == 'a' | key == 'A') {
        
          arrowPos.x -= 2;
        }
      
    }
  }
}
