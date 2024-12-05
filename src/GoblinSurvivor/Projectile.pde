// Aiden Felt, Canon Unguren, Paul Tokhtuev| 3 Oct 2024
class Projectile {
  // Memebr Varibles
  Timer fireballframeSpeed, lFS, BFS, hammerTime ;
  PImage arrow;
  PImage[] fireball, lightbeam, banana;
  int x, y, w, h;
  int speed, damage, range, atkSpeed, imageCount, frame, lF, bF;

  boolean unlocked, disappear, Bdisappear,bananaD, aim, LBPlaced;
  char type;
  String direction, ballF;

  PVector target, location, ballPos, fireballT, lP, hammer, bP, bananaTarget;



  // Constructor
  Projectile(char t, PVector ballP ) {

    lP = new PVector (0, 0);
    if (t == 'b') {
      bananaTarget = ballP.copy();
     
      bP =  new PVector (width/2, height/2);
     
     
      bananaTarget.sub(bP);
      bananaTarget.normalize();
      bananaTarget.mult(5);
       
      type = 'b';
      BFS = new Timer (1000);
      BFS.start();
      banana = new PImage[4];
      for ( int i =0; i<4; i++) {
        banana[i] = loadImage ("bannanaanimation"+i+".png");
      }
    }
    if (t == 'l') {
      lFS = new Timer(200);
      lFS.start();
      aim = true;
      lightbeam= new PImage[5];
      type = 'l';
      for (int i =0; i<4; i++) {
        lightbeam[i] = loadImage ("PurifyBeam"+i+".png");
      }
      lightbeam[4] = loadImage ("AimCircle.png");
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
    if (type == 'b') {

      bP.add(bananaTarget);
       if (bP.x > width+40 || bP.x <-40||bP.y < -40 || bP.y > height +40) {
        bananaD=true;
      }
    }
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
    if (type =='b') {

      image(banana[bF], bP.x, bP.y);
      if (BFS.isFinished()) {
        image(banana[bF], bP.x, bP.y);
        BFS.start();
      }
      if (bF<4) {
        bF++;
      }
      if (bF==4) {
        bF=0;
      }
    }
    if (type == 'l') {
      if (aim == true) {
        image(lightbeam[4], mouseX, mouseY);
      }
      if (aim ==false) {
        image(lightbeam[lF], lP.x, lP.y-100);
        if (lFS.isFinished()) {
          image(lightbeam[lF], lP.x, lP.y-100);
          lFS.start();
        }
        if (lF <4) {
          lF++;
        }
        if (lF == 4) {
          lF = 0;
        }
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
    if(type =='b') {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          bP.x = bP.x + 4.5;
        } else if (key == 'd'||key == 'D') {
          bP.x = bP.x - 4.5;
        } else if (key == 'w'||key == 'W') {
          bP.y = bP.y + 4.5;
        } else if (key == 's'||key == 'S') {
          bP.y = bP.y - 4.5;
        }
      }
    }
    if (type == 'w') {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          ballPos.x = ballPos.x + 4.5;
        } else if (key == 'd'||key == 'D') {
          ballPos.x = ballPos.x - 4.5;
        } else if (key == 'w'||key == 'W') {
          ballPos.y = ballPos.y + 4.5;
        } else if (key == 's'||key == 'S') {
          ballPos.y = ballPos.y - 4.5;
        }
      }
    }
    if (type == 'l') {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          lP.x = lP.x + 5;
        } else if (key == 'd'||key == 'D') {
          lP.x = lP.x - 5;
        } else if (key == 'w'||key == 'W') {
          lP.y = lP.y + 5;
        } else if (key == 's'||key == 'S') {
          lP.y = lP.y - 5;
        }
      }
    }
    if (type == 'a' ) {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          location.x = location.x + 4.5;
        } else if (key == 'd'||key == 'D') {
          location.x = location.x - 4.5;
        } else if (key == 'w'||key == 'W') {
          location.y = location.y + 4.5;
        } else if (key == 's'||key == 'S') {
          location.y = location.y - 4.5;
        }
      }
    }
  }
}
