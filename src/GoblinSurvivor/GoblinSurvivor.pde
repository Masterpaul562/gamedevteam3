// Canon Unguren, Axl Dain, Paul Tokhtuevm, Oskar Szajnuk, Aiden Felt| Oct 3 2024
import processing.sound.*;
SoundFile background1;
SoundFile bite1;
Goblin g1;
Projectile p1;
PowUp o1;
Timer eTimer, timer1, zWalk, shootA;
Shop shop1;
Panel panel;
Tile tile;
int level;
int speed = 5;

ArrayList<Projectile> proj = new ArrayList<Projectile>();
ArrayList<PowUp> powUps = new ArrayList<PowUp>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean play;
PImage start1;
PVector userPos;
void setup() {
  background1 = new SoundFile(this, "backgroundMusic1.wav");
  bite1 = new SoundFile(this, "bite.wav");
  background1.play();
  shootA = new Timer (4000);
  shootA.start();
  userPos = new PVector(width/2, height/2);
  enemies.add (new Enemy());
  zWalk = new Timer(500);
  zWalk.start();
  eTimer = new Timer(5000);
  eTimer.start();
  timer1 = new Timer(300);
  timer1.start();
  size(1000, 1000);
  level = 1;
  t1 = loadImage("Tile.png");
  userPos = new PVector(width/2, height/2);
  g1 = new Goblin();
  p1 = new Projectile();
  shop1 = new Shop();
  panel = new Panel();
  play = false;
  tile = new Tile();

  start1 = loadImage("GoblinStart.png");
}

void draw() {
  if (!play) {

    startScreen();
  } else {
    if (shootA.isFinished()) {
      proj.add(new Projectile());
      shootA.start();
    }
    if (eTimer.isFinished()) {
      enemies.add(new Enemy());
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
      if (key == 'e' || key == 'E') {
        shop1.shopOpen = true;
      } else if (key == 'e' && shop1.shopOpen == true|| key == 'E' && shop1.shopOpen == true) {
        shop1.shopOpen = false;
      } else if (key == 'q'  || key == 'Q') {
        shop1.shopOpen = false;
      }


      //if (keyCode == RIGHT) {
      //  mapOffsetX -= speed;
      //} else if (keyCode == LEFT) {
      //  mapOffsetX += speed;
      //} else if (keyCode == UP) {
      //  mapOffsetY += speed;
      //} else if (keyCode == DOWN) {
      //  mapOffsetY -= speed;
      //}
    }
    //you are playing the game!

    tile.display();
    panel.display();
    shop1.display();
    g1.display();
    p1.display();

    for (int i = 0; i < powUps.size(); i++) {
      PowUp powUp = powUps.get(i);
      if (powUp.x < width/2+15 && powUp.x > width/2-15 && powUp.y < height/2+25 && powUp.y > height/2-25) {
        powUps.remove(i);
        panel.xp +=1;
      }
      powUp.display();
    }
    for (int i = 0; i < proj.size(); i++) {
      Projectile projs = proj.get(i);
      projs.fire();
      projs.playerMovement();
      projs.display();


      if (projs.disappear == true) {
        proj.remove(i);
      }
    }
    g1.display();
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      for (int n = 0; n < proj.size(); n++) {
        Projectile projs = proj.get(n);
        if (enemy.enemyPos.dist(projs.location)<30) {
          enemy.health -= 100;
          if (enemy.health < 0) {
            enemies.remove(i);
            powUps.add(new PowUp(int(enemy.enemyPos.x), int(enemy.enemyPos.y)));
            panel.enemiesKilled = panel.enemiesKilled+1;
          }
        }
      }


      enemy.update();
      enemy.zombiepoof();
      enemy.playerMovement();
      enemy.display();


      if (enemy.poof == true) {
        enemies.remove(i);
        bite1.play();
        powUps.add(new PowUp(int(enemy.enemyPos.x), int(enemy.enemyPos.y)));
        panel.enemiesKilled = panel.enemiesKilled+1;
        g1.health= g1.health - 15;
      }
      if (enemy.fall == true) {
        enemies.remove(i);
      }
    }


    if (g1.health <= 0) {
      gameOver();
    }
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
  start1.resize(1000, 1000);
  image(start1, 0, 0);
  if (keyPressed || mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textMode(CENTER);
  text("Game Over", width/2, height/2);
  noLoop();
}
