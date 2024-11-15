// Axl Dain Paul Tokhtuev | 3 Oct 2024
class Enemy {
  // Member Variables
  Timer zWalk, fireball, fireballFramespeed;
  PImage e1;
  PImage[] e2;
  float  dist;
  int health, speed, dmg, side, wType, frame, castFrame, castFrameF, imageCountWC, imageCountF;
  boolean fall, poof, flip, shoot;
  char type;
  PVector enemyPos, userPos, direction;
  String walk, wizard, cast, fBall;

  // Constructor
  Enemy() {
    
    imageCountWC = 5;
   
 
    e2 = new PImage[imageCountWC+3];
    fireballFramespeed = new Timer(300);
  fireballFramespeed.start();
  castFrame = 0;
    fireball = new Timer(3500);
   
    wType = int(random(1, 3));
    if (wType == 1) {
      type = 'z';
    } else if (wType == 2) {
      type = 'w';
    }

    zWalk = new Timer(600);


    fall = false;
    if (type == 'z') {
      side = int(random(1, 5));
      if (side ==1) {
        enemyPos = new PVector (random(width), -10);
      } else if (side == 2) {
        enemyPos = new PVector (width+10, random(height));
      } else if (side == 3) {
        enemyPos = new PVector (random(width), height+10);
      } else if (side == 4) {
        enemyPos = new PVector (-10, random(height));
      }
    }
    if (type == 'w') {
      enemyPos = new PVector (random(width), (random(height)));
       fireball.start();
    }
    userPos = new PVector(width/2, height/2);
    direction = enemyPos.copy();
    health = 100;
    speed = 5;
    dmg = 10;
    
    
  }


  // Member Methods
  void update() {
  
    if (type == 'z') {
      if (enemyPos.x>width/2) {
        flip = true;
      } else {
        flip = false;
      }
      direction = enemyPos.copy();
      direction.sub(userPos);
      direction.normalize();
      direction.mult(1.5);
      enemyPos.sub(direction);
    }
  }
  void playerMovement() {
    if (type == 'w') {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          enemyPos.x = enemyPos.x + 5;
        } else if (key == 'd'||key == 'D') {
          enemyPos.x = enemyPos.x - 5;
        } else if (key == 'w'||key == 'W') {
          enemyPos.y = enemyPos.y + 5;
        } else if (key == 's'||key == 'S') {
          enemyPos.y = enemyPos.y - 5;
        }
      }
    }
    if (type == 'z') {
      if (keyPressed) {
        if (key == 'a'||key == 'A') {
          enemyPos.x = enemyPos.x + 2;
        } else if (key == 'd'||key == 'D') {
          enemyPos.x = enemyPos.x - 2;
        } else if (key == 'w'||key == 'W') {
          enemyPos.y = enemyPos.y + 2;
        } else if (key == 's'||key == 'S') {
          enemyPos.y = enemyPos.y - 2;
        }
      }
    }
  }

  void display() {

    if (type == 'w')
    {
      if (enemyPos.x<width/2) {
        for (int i = 0; i< 6; i++)
        { 
      
          e2[i] = loadImage("WizardCast"+i+".png");
        }
      } else if (enemyPos.x>width/2) {
        for (int i = 0; i< 6; i++)
        {        
          e2[i] = loadImage("WizardCastFlip" + i + ".png");
        }
      }
          if (enemyPos.x < width/2) {
        e2[6] = loadImage ("Wizard.png");
        image (e2[6], enemyPos.x, enemyPos.y);
      }
      if (enemyPos.x > width/2) {
        e2[7] = loadImage ("WizardFlip.png");
        image (e2[7], enemyPos.x, enemyPos.y);
      }
      if (fireball.isFinished()) {
       
     //  if (castFrame>imageCountWC) {castFrame =0;}
        imageMode(CENTER);        
        image(e2[castFrame], enemyPos.x, enemyPos.y);
        if(fireballFramespeed.isFinished()) {
        image(e2[castFrame],enemyPos.x,enemyPos.y);
        fireballFramespeed.start();
        }
        if (castFrame < imageCountWC+1)
        {
          print(castFrame);
        castFrame++;
        print(castFrame);
        }
       if(castFrame >= imageCountWC+1) {
         shoot = true;
       fireball.start();
       castFrame = 0;
       }
      }
 
   
  
    }
    if (type == 'z') {
      if (zWalk.isFinished() && enemyPos.x < width/2) {
        if (walk != "SCAMMER.png") {
          walk = "SCAMMER.png";
        } else {
          walk =  "Zombie.png";
        }
        zWalk.start();
      }
      if (zWalk.isFinished() && enemyPos.x > width/2) {
        if (walk != "ZombieFlip2.png") {
          walk = "ZombieFlip2.png";
        } else {
          walk = "ZombieFlip.png";
        }

        zWalk.start();
      }
      e1 = loadImage(walk);
      imageMode(CENTER);
      e1.resize(100, 100);
      image(e1, enemyPos.x, enemyPos.y);
    }
  }
  void zombiepoof() {
    if (type == 'z') {
      if (enemyPos.dist(userPos)<10) {
        poof=true;
      }
    }
    if (type == 'z') {
      if (enemyPos.x > width+40 || enemyPos.x <-40||enemyPos.y < -40 || enemyPos.y > height +40) {
        fall=true;
      }
      if (type == 'w') {
        if (enemyPos.x > width+60 || enemyPos.x <-60||enemyPos.y < -60 || enemyPos.y > height +60) {
          fall=true;
        }
      }
    }
  }
}
