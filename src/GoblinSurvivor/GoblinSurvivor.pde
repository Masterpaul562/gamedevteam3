// Canon Unguren, Axl Dain, Paul Tokhtuevm, Oskar Szajnuk, Aiden Felt| Oct 3 2024 //<>// //<>// //<>// //<>// //<>//
import processing.sound.*;
SoundFile background1, coin1, ouch1, gameoversound, arrow1;
SoundFile bite1;
Goblin g1;

PowUp o1;
Timer eTimer, timer1, zWalk, shootA, shootB, skullFrameSpeed, lF, lC, welcomeTime, transTimer;
Shop shop1;
Panel panel;
Tile tile;
int level, welcomeCounter, transCount;
int speed = 5;
int skullFrame;
float[] Edistance;
ArrayList<Projectile> proj = new ArrayList<Projectile>();
ArrayList<PowUp> powUps = new ArrayList<PowUp>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean play, end, lD, lFired;
PImage start1;
PImage game1, over1, skull1, retry1;
PImage[] skulls = new PImage[8];
String retrying;
PVector userPos;
int etime;
void setup() {
  etime = 5000;
  retrying = "RetryButton.png";
  end = false;
  lFired = false;
  background1 = new SoundFile(this, "Background.mp3");
  arrow1 = new SoundFile(this, "Arrow.mp3");
  bite1 = new SoundFile(this, "bite.wav");
  coin1 = new SoundFile(this, "coinCollect.mp3");
  ouch1 = new SoundFile(this, "ouch.mp3");
  gameoversound = new SoundFile(this, "gameover.wav");
  background1.loop();
  shootA = new Timer (4000);
  shootB = new Timer (6000);
  shootB.start();
  shootA.start();
  userPos = new PVector(width/2, height/2);
  enemies.add (new Enemy());
  zWalk = new Timer(500);
  zWalk.start();
  eTimer = new Timer(etime);
  eTimer.start();
  timer1 = new Timer(500);
  timer1.start();
  lF = new Timer(5000);
  lC = new Timer(10000);
  transTimer = new Timer(2000);
  lC.start();
  welcomeTime = new Timer(1000);
  welcomeTime.start();
  welcomeCounter = 0;
  skullFrameSpeed = new Timer(300);
  skullFrameSpeed.start();
  size(1000, 1000);
  level = 1;
  t1 = loadImage("Tile.png");
  userPos = new PVector(width/2, height/2);
  g1 = new Goblin();
  skullFrame = 0;
  shop1 = new Shop();
  panel = new Panel();
  play = false;
  tile = new Tile();
  transCount = 0;
  start1 = loadImage("GoblinStart.png");
  game1 = loadImage("GAME.png");
  over1 = loadImage("OVER.png");
  skull1 = loadImage("Skull.png");
  retry1 = loadImage(retrying);
}

void draw() {

  if (!play && !end) {

    startScreen();
  } else {
    for (int i = 0; i < 8; i++) {
      skulls[i] = loadImage("Impact" + i + ".png");  // Load each frame as a separate image
    }

    if (eTimer.isFinished()) {
      enemies.add(new Enemy());
      if (etime >= 50) {
        println(etime);
        etime -= 5;
        eTimer = new Timer(etime);
      }

      eTimer.start();
    }
    background(115);
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        mapOffsetY+= speed;
        for (int i = 0; i < powUps.size(); i++) {
          PowUp powUp = powUps.get(i);
          powUp.y = powUp.y+ speed;

          if (powUp.offScreen()) {
            powUps.remove(i);
          }
          powUp.display();
        }
        //o1.y = o1.y + speed;
        if (timer1.isFinished()) {
          if (g1.img1 != "GoblinWalkUp1.png") {
            g1.img1 = "GoblinWalkUp1.png";
          } else {
            g1.img1 =  "GoblinWalkUp2.png";
          }
          timer1.start();
        }
      } else if (key == 's' || key == 'S') {
        mapOffsetY -= speed;
        for (int i = 0; i < powUps.size(); i++) {
          PowUp powUp = powUps.get(i);
          powUp.y = powUp.y- speed;
          if (powUp.offScreen()) {
            powUps.remove(i);
          }
          powUp.display();
        }
        //o1.y = o1.y - speed;
        if (timer1.isFinished()) {
          if (g1.img1 != "GoblinWalkDown1.png") {
            g1.img1 = "GoblinWalkDown1.png";
          } else {
            g1.img1 =  "GoblinWalkDown2.png";
          }
          timer1.start();
        }
      } else if (key == 'd' || key == 'D') {
        mapOffsetX -= speed;
        for (int i = 0; i < powUps.size(); i++) {
          PowUp powUp = powUps.get(i);
          powUp.x = powUp.x- speed;
          if (powUp.offScreen()) {
            powUps.remove(i);
          }
          powUp.display();
        }
        //o1.x = o1.x - speed;
        if (timer1.isFinished()) {
          if (g1.img1 != "GoblinWalkRight1.png") {
            g1.img1 = "GoblinWalkRight1.png";
          } else {
            g1.img1 =  "GoblinWalkRight2.png";
          }
          timer1.start();
        }
      } else if (key == 'a' || key == 'A') {
        for (int i = 0; i < powUps.size(); i++) {
          PowUp powUp = powUps.get(i);
          powUp.x = powUp.x+ speed;
          if (powUp.offScreen()) {
            powUps.remove(i);
          }
          powUp.display();
        }
        mapOffsetX += speed;
        //o1.x = o1.x + speed;
        if (timer1.isFinished()) {
          if (g1.img1 != "GoblinWalkLeft1.png") {
            g1.img1 = "GoblinWalkLeft1.png";
          } else {
            g1.img1 =  "GoblinWalkLeft2.png";
          }
          timer1.start();
        }
      }
      if (key == 'z' || key == 'Z') {
        shop1.shopOpen = true;
      } else if (key == 'z' && shop1.shopOpen == true|| key == 'Z' && shop1.shopOpen == true) {
        shop1.shopOpen = false;
      } else if (key == 'x'  || key == 'X') {
        shop1.shopOpen = false;
      } else if (key == '|') {
        g1.health = 0;
      }
    }
    //you are playing the game!

    tile.display();
    panel.display();

    g1.display();


    for (int i = 0; i < powUps.size(); i++) {
      PowUp powUp = powUps.get(i);

      if (dist(width/2, height/2, powUp.x, powUp.y)<20) {
        powUps.remove(i);
        coin1.play();
        panel.money +=1;
      }
      powUp.display();
    }

    g1.display();

    if (shootA.isFinished() && shop1.$bow) {
      arrow1.play();
      proj.add(new Projectile('a', new PVector (width/2, height/2)));
      shootA.start();
    }

    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      int indexofCE=getIndexOfClosestEnemy();


      if (enemy.type == 'w') {
        if (enemy.shoot == true) {
          enemy.shoot = false;
          proj.add(new Projectile('w', new PVector (enemy.enemyPos.x+5, enemy.enemyPos.y-20)));
        }
      }
      enemy.update();
      enemy.zombiepoof();
      enemy.playerMovement();
      enemy.display();
      shop1.display();
      if (enemy.poof == true) {
        enemies.remove(i);
        bite1.play();
        ouch1.play();
        powUps.add(new PowUp(int(enemy.enemyPos.x), int(enemy.enemyPos.y)));
        panel.enemiesKilled = panel.enemiesKilled+1;
        g1.health= g1.health - 15;
      }
      if (enemy.fall == true) {
        enemies.remove(i);
      }
      if (enemy.begone == true) {
        enemies.remove(i);
      }
      for (int n = 0; n < proj.size(); n++) {
        Projectile projs = proj.get(n);
        if (shootB.isFinished() && shop1.$banana) {



          proj.add(new Projectile('b', enemies.get(indexofCE).enemyPos.copy()));
          shootB.start();
        }
        if (projs.type == 'b' && enemy.enemyPos.dist(projs.bP)<30) {
          proj.remove(n);
          enemy.health -= 1000;
          if (enemy.health <0) {
            enemies.remove(i);
            powUps.add(new PowUp(int(enemy.enemyPos.x), int(enemy.enemyPos.y)));
            panel.enemiesKilled = panel.enemiesKilled+1;
            panel.xp+=1;
          }
        }
        if (projs.type == 'b' && projs.bananaD == true) {
          proj.remove(n);
        }
        if (projs.type == 'w') {
          if (projs.ballPos.dist(userPos)<20) {
            proj.remove(n);
            ouch1.play();
            g1.health -= 10;
          }
          if (projs.Bdisappear == true) {
            proj.remove(n);
          }
        }

        if (projs.type == 'a') {
          if (enemy.enemyPos.dist(projs.location)<30) {
            enemy.health -= 100;
            if (enemy.health < 0) {
              enemies.remove(i);
              proj.remove(n);
              powUps.add(new PowUp(int(enemy.enemyPos.x), int(enemy.enemyPos.y)));
              panel.enemiesKilled = panel.enemiesKilled+1;
              panel.xp+=1;
            }
          }

          if (projs.disappear == true) {
            proj.remove(n);
          }
        }

        if (keyPressed) {
          if (key == 'q' && lC.isFinished()&& lFired == false) {
            proj.add(new Projectile('l', new PVector (0, 0)));
            projs.aim = true;
            lFired = true;
            projs.LBPlaced = false;
          }
        }
        if (mousePressed && lFired == true && projs.LBPlaced == false) {
          projs.aim = false;
          projs.LBPlaced = true;
          lC.start();
          projs.lP.x = mouseX;
          projs.lP.y = mouseY;

          lD = true;
          lF.start();
        }
        if (lF.isFinished()&&projs.type == 'l'&&lD==true) {
          proj.remove(n);
          lD= false;
          lFired = false;
        }
        if (projs.type == 'l') {

          if (enemy.enemyPos.dist(projs.lP)<100) {
            enemy.health =- 100;
            if (enemy.health < 0) {
              enemies.remove(i);

              powUps.add(new PowUp(int(enemy.enemyPos.x), int(enemy.enemyPos.y)));
              panel.enemiesKilled = panel.enemiesKilled+1;
              panel.xp+=1;
            }
          }
        }
      }
    }
    for (int n = 0; n < proj.size(); n++) {
      Projectile projs = proj.get(n);
      projs.fire();
      projs.playerMovement();
      projs.display();
    }

    if (g1.health <= 0) {
      end = true;
      play = false;
      gameOver();
      for (int i = 0; i < enemies.size(); i++) {
        enemies.remove(i);
      }
      background1.pause();
      eTimer.paused = true;
      timer1.paused = true;
      zWalk. paused = true;
      shootA.paused = true;

      gameoversound.play();
      g1.health = 100;
    }
  }
  if (!play && end) {

    gameOver();
  }
}


void keyPressed() {

  if (keyCode == RIGHT) {
    mapOffsetX -= speed;
  } else if (keyCode == LEFT) {
    mapOffsetX += speed;
  } else if (keyCode == UP) {
    mapOffsetY += speed;
  } else if (keyCode == DOWN) {
    mapOffsetY -= speed;
  }
}

void startScreen() {
  background(0);
  fill(255);
  //start1.resize(1000, 1000);
  //image(start1, 0, 0);
  if (keyPressed || mousePressed) {
    play = true;
  }
  if (welcomeTime.isFinished()) {
    welcomeTime.start();
    welcomeCounter++;
  }
  switch(welcomeCounter) {
  case 0:
    text("Once the world lived in harmony", 200, 100);
    fill(255);
    break;
  case 1:
    text("Until a dark and evil force came", 100, 100);
    break;
  case 2:
    text("His name, was MR. EVILS MUNCHKIN MAN", 100, 100);
    break;
  case 3:
    text("The goblins together were the only thing that could stop him", 100, 100);
    break;
  case 4:
    text("but he separated them one by one, killing them all", 100, 100);
    break;
  case 5:
    text("Until only one remained", 100, 100);
    break;
  case 6:
    text("The last and strongest one made a stand", 100, 100);
    break;
  case 7:
    text("Too strong for MR. EVILS MUNCHKIN MAN to face head on", 100, 100);
    break;
  case 8:
    text("So he devised a devious plan to trap the goblin", 100, 100);
    break;
  case 9:
    text("to trap him in the prison realm and have his acolytes wear him down", 100, 100);
    break;
  case 10:
    text("the plan succeeded and the goblin was trapped", 100, 100);
    break;
  case 11:
    text("but will that be enough to stop...", 100, 100);
    break;
  case 12:
    text("THE GOBLIN SURIVIOR", 100, 100);
    transTimer.start();

    break;
  default:
    if (transTimer.isFinished() && transCount<=255) {
      image(start1, 0, 0);
      print(transCount);
      transCount += 20;
      tint(255, transCount);
      start1.resize(1000, 1000);
      image(start1, 0, 0);
      transTimer.start();
    }


  }


}


void gameOver() {
  background(0);

  retry1 = loadImage(retrying);

  fill(255);
  imageMode(CENTER);
  game1.resize(700, 400);
  image(game1, width/2, 100);
  over1.resize(700, 400);
  image(over1, width/2, 300);



  skulls[skullFrame].resize(200, 200);
  image(skulls[skullFrame], width/2, 550);
  if (skullFrameSpeed.isFinished()) {
    skulls[skullFrame].resize(200, 200);
    image(skulls[skullFrame], width/2, 550);
    println("done", skullFrame);
    skullFrameSpeed.start();
    if (skullFrame<=6) {
      skullFrame  +=1;
    }
  }
  if (mouseX > width/2-100 && mouseX < width/2+100 && mouseY > 725 && mouseY< 816 && mousePressed) {
    retrying = "RetryButtonPressed.png";
  } else {
    retrying = "RetryButton.png";
  }
  retry1.resize(250, 250);
  image(retry1, width/2, 750);
}


int getIndexOfClosestEnemy() {
  float mindistance = 1000000000;
  int indexofCE = -1;
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = enemies.get(i);
    float dist = PVector.dist(enemy.enemyPos, userPos);
    if (dist < mindistance) {

      mindistance = dist;
      indexofCE = i;
    }
  }
  return indexofCE;
}
