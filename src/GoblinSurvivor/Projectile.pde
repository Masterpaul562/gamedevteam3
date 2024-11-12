// Aiden Felt, Canon Unguren, Paul Tokhtuev| 3 Oct 2024
class Projectile {
  // Memebr Varibles
  PImage arrow;
  PImage[] fireball;
  int x, y, w, h;
  int speed, damage, range, atkSpeed, imageCount, frame;
  boolean unlocked, disappear, Bdisappear;
  char type2;
  String direction, ballF;

  PVector target, location, ballPos, fireballT;



  // Constructor
  Projectile(char type, PVector ballP ) {



    if (type == 'a') {
      type2 = 'a';
      direction = "ArrowUP.png";
    
      location = new PVector (width/2, height/2);

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
      if (shootA.isFinished()) {

        if (key == 'w' | key == 'W') {
          target = new PVector (width/2, -40);
        }
        if (key == 's' | key == 'S') {
          target = new PVector (width/2, height+40);
        }
        if (key == 'd' | key == 'D') {
          target = new PVector (width+40, height/2);
        }
        if (key == 'a' | key == 'A') {
          target = new PVector (-40, height/2);
        }
        target.sub(location);
        target.normalize();
        target.mult(5);
        
      }
    }
    if (type == 'w') {
      frame =0;
      imageCount = 3;
      fireball= new PImage[imageCount];
      if (ballP.x < width/2) {
        for (int i = 0; i< 3; i++)
        {

          ballF = "Fireball" + nf(i, imageCount) + ".png";
          fireball[i] = loadImage(ballF);
        }
      }
      if (ballP.x > width/2) {
        for (int i = 0; i< 3; i++)
        {

          ballF = "FireballFlip" + nf(i, imageCount) + ".png";
          fireball[i] = loadImage(ballF);
        }
      }
      type2 = 'w';
      ballPos= ballP.copy();
      fireballT = new PVector (width/2, height/2);
      fireballT.sub(ballPos);
      fireballT.normalize();
      fireballT.mult(5);
    }
  }

  // Member Methods

  void fire () {
    if (type2 == 'w') {
      ballPos.add(fireballT);
    }
    if (type2 == 'a') {



      location.add(target);
    }
  }

  void display() {
    if (type2 == 'w') {
      frame = (frame+1) % imageCount;
      image(fireball[frame], ballPos.x, ballPos.y);

      if (ballPos.x > width+40 || ballPos.x <-40||ballPos.y < -40 || ballPos.y > height +40) {
        Bdisappear=true;
      }
    }
    if (type2 == 'a') {
      arrow = loadImage(direction);
      imageMode(CENTER);
      arrow.resize(50, 50);
      image(arrow, location.x, location.y);
      if (location.x > width+40 || location.x <-40||location.y < -40 || location.y > height +40) {
        disappear=true;
      }
    }
  }
  void playerMovement() {
    if (type2 == 'w') {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          ballPos.x = ballPos.x + 1;
        } else if (key == 'd'||key == 'D') {
          ballPos.x = ballPos.x - 1;
        } else if (key == 'w'||key == 'W') {
          ballPos.y = ballPos.y - 1;
        } else if (key == 's'||key == 'S') {
          ballPos.y = ballPos.y + 1;
        }
      }
    }
    if (type2 == 'a' ) {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          location.x = location.x + 1;
        } else if (key == 'd'||key == 'D') {
          location.x = location.x - 1;
        } else if (key == 'w'||key == 'W') {
          location.y = location.y + 1;
        } else if (key == 's'||key == 'S') {
          location.y = location.y - 1;
        }
      }
    }
  }
}
