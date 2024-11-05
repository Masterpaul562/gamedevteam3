// Aiden Felt, Canon Unguren, Paul Tokhtuev| 3 Oct 2024
class Projectile {
  // Memebr Varibles
  PImage arrow;
  int x, y, w, h;
  int speed, damage, range, atkSpeed;
  boolean unlocked, disappear;
  char type;
  String direction;
  Timer aFireT;
  PVector target, velocity, acceleration;
  public PVector location;


  // Constructor
  Projectile() {
    direction = "ArrowUP.png";
    aFireT = new Timer(4000);
    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    target = new PVector (width/2, 0);

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
    if (aFireT.isFinished()) {
      if (key == 'w' | key == 'W') {
        target = new PVector (width/2, 0);
      }
      if (key == 's' | key == 'S') {
        target = new PVector (width/2, height);
      }
      if (key == 'd' | key == 'D') {
        target = new PVector (width, height/2);
      }
      if (key == 'a' | key == 'A') {
        target = new PVector (0, height/2);
      }
    }
  }

  // Member Methods

  void fire () {

    PVector acceleration = PVector.sub(target, location);
    acceleration.setMag(0.2);
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {

    arrow = loadImage(direction);
    imageMode(CENTER);
    arrow.resize(50, 50);
    image(arrow, location.x, location.y);
    if (location.x > width+40 || location.x <-40||location.y < -40 || location.y > height +40) {
      disappear=true;
    }
  }
  void playerMovement() {
    if (keyPressed) {
      if (key == 'a'||key == 'A') {
        location.x = location.x + 2;
      } else if (key == 'd'||key == 'D') {
        location.x = location.x - 2;
      } else if (key == 'w'||key == 'W') {
        location.y = location.y + 2;
      } else if (key == 's'||key == 'S') {
        location.y = location.y - 2;
      }
    }
  }
}
