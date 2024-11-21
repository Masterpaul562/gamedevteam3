// Aiden Felt, Canon Unguren, Paul Tokhtuev| 3 Oct 2024
class Projectile {
  // Memebr Varibles
  Timer fireballframeSpeed ;
  PImage arrow;
  PImage[] fireball, lightbeam;
  int x, y, w, h;
  int speed, damage, range, atkSpeed, imageCount, frame,lx,ly;
  boolean unlocked, disappear, Bdisappear,aim;
  char type;
  String direction, ballF;

  PVector target, location, ballPos, fireballT;



  // Constructor
  Projectile(char t, PVector ballP ) {
   
  
    if (t == 'l') {
      aim = true;
      lightbeam= new PImage[5];
      type = 'l';
      lightbeam[0] = loadImage ("AimCircle.png");
      lx=mouseX;
      ly=mouseY;
    }

    if (t == 'a') {
      type = 'a';
    }
    if (type == 'a') {
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

    if (t == 'w') {
      type = 'w';
    }
    if (type == 'w') {
      ballPos= ballP.copy();
      fireballframeSpeed = new Timer(300);
      fireballframeSpeed.start();
      frame =0;
      imageCount = 3;
      fireball= new PImage[3];
      if (ballPos.x<width/2) {
        for (int i = 0; i< 3; i++)
        {

          fireball[i] = loadImage("Fireball"+i+".png");
        }
      } else if (ballPos.x>width/2) {
        for (int i = 0; i< 3; i++)
        {
          fireball[i] = loadImage("FireballFlip" + i + ".png");
        }
      }


      fireballT = new PVector (width/2, height/2);
      fireballT.sub(ballPos);
      fireballT.normalize();
      fireballT.mult(5);
    }
  }
  // Member Methods

  void fire () {
    if (type == 'w') {
      ballPos.add(fireballT);
      if (ballPos.x > width+40 || ballPos.x <-40||ballPos.y < -40 || ballPos.y > height +40) {
        Bdisappear=true;
      }
    }
    if (type == 'a') {
      location.add(target);
      if (location.x > width+40 || location.x <-40||location.y < -40 || location.y > height +40) {
        disappear=true;
      }
    }
  }

  void display() {
    if (type == 'l') {
      if(aim == true) {
      image(lightbeam[0], mouseX, mouseY);
      }
      if(aim ==false) {
      image(lightbeam[0], lx, ly);
      }
    }
    if (type == 'w') {

      image(fireball[frame], ballPos.x, ballPos.y);
      if (fireballframeSpeed.isFinished()) {
        image(fireball[frame], ballPos.x, ballPos.y);
        fireballframeSpeed.start();
      }
      if (frame < 3)
      {
        frame++;
      }
      if (frame == 3) {
        frame = 0;
      }
    }
    if (type == 'a') {
      arrow = loadImage(direction);
      imageMode(CENTER);
      arrow.resize(50, 50);
      image(arrow, location.x, location.y);
    }
  }
  void playerMovement() {
    if (type == 'w') {
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
    if (type == 'a' ) {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          location.x = location.x + 1;
        } else if (key == 'd'||key == 'D') {
          location.x = location.x - 1;
        } else if (key == 'w'||key == 'W') {
          location.y = location.y - 1;
        } else if (key == 's'||key == 'S') {
          location.y = location.y + 1;
        }
      }
    }
  }
}
