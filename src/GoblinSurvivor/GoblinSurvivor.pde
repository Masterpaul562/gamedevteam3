// Canon Unguren, Axl Dain, Paul Tokhtuevm, Oskar Szajnuk, Aiden Felt| Oct 3 2024
Goblin g1;
Projectile p1;
PowUp o1;
Timer eTimer,timer1;
Shop shop1;
Panel panel;
Tile tile;
int level;
int speed = 5;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<PowUp> powUps = new ArrayList<PowUp>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
boolean play;
PImage start1;
PVector userPos;
void setup() {
  userPos = new PVector(width/2, height/2);
  enemies.add (new Enemy());
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
  o1 = new PowUp();
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

    if (eTimer.isFinished()) {
      enemies.add(new Enemy());
      eTimer.start();
    }
    background(115);
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        mapOffsetY+= speed;
        if(timer1.isFinished()) {
          if(g1.img1 != "GoblinWalkUp1.png") {
            g1.img1 = "GoblinWalkUp1.png";
          }else {
            g1.img1 =  "GoblinWalkUp2.png";
          
          }
          timer1.start();
        }
        
      } else if (key == 's' || key == 'S') {
        mapOffsetY -= speed;
        if(timer1.isFinished()) {
          if(g1.img1 != "GoblinWalkDown1.png") {
            g1.img1 = "GoblinWalkDown1.png";
          }else {
            g1.img1 =  "GoblinWalkDown2.png";
          
          }
          timer1.start();
        }
      } else if (key == 'd' || key == 'D') {
        mapOffsetX -= speed;
        if(timer1.isFinished()) {
          if(g1.img1 != "GoblinWalkRight1.png") {
            g1.img1 = "GoblinWalkRight1.png";
          }else {
            g1.img1 =  "GoblinWalkRight2.png";
          
          }
          timer1.start();
        }
      } else if (key == 'a' || key == 'A') {
        mapOffsetX += speed;
        if(timer1.isFinished()) {
          if(g1.img1 != "GoblinWalkLeft1.png") {
            g1.img1 = "GoblinWalkLeft1.png";
          }else {
            g1.img1 =  "GoblinWalkLeft2.png";
          
          }
          timer1.start();
        }
      } else if (key == 'e' || key == 'E') {
        if (frameRate == 0) {
          frameRate(60);
          shop1.shopOpen = false;
        } else {
          frameRate(0);
          shop1.shopOpen = true;
        }
        if (key == 'e' || key == 'E') {
          shop1.shopOpen = true;
        }
        if (key == 'q' || key == 'Q') {
          shop1.shopOpen = false;
        }
      }


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
    //you are playing the game!

    tile.display();
    panel.display();
    shop1.display();
    g1.display();
    p1.display();
    o1.display();
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = enemies.get(i);
      enemy.update();
      enemy.zombiepoof();
      enemy.playerMovement();
      enemy.display();
      if (enemy.poof == true) {
        enemies.remove(i);
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
