//Canon Unguren | 25 Oct 2024

class Panel {
  int seconds, minutes, enemiesKilled, xp, money, levelUpXp, arSpeed;

  Panel() {
    seconds = millis()/1000;
    minutes = 0;
    xp = 0;
    levelUpXp = 5;
    money = 0;
    arSpeed = 4500;
  }
  void display() {

    fill(0, 0, 255);
    rect(0, 0, xp*(width/levelUpXp), 40);
    if (xp == levelUpXp) {
      shootA = new Timer (arSpeed);
      arSpeed -= 500;
      level+=1;
      levelUpXp *=2;
      xp = 0;
    }
    seconds = millis()/1000;
    fill(100, 150);
    rect(0, 0, width, 40);
    fill(200);
    textSize(30);
    if (seconds%60 >=10) {
      text("Time Alive: "+int(seconds/60)+":"+seconds%60, width-250, 30);
    } else {
      text("Time Alive: "+int(seconds/60)+":0"+seconds%60, width-250, 30);
    }
    text("Money:"+money, 30, 30);
    text("Kills: "+enemiesKilled, 200, 30);
    fill(255, 150);
    rect(400, 5, 200, 30, 10);
    fill(255, 0, 0, 150);
    rect(400, 5, g1.health*2, 30, 10);


    fill(0);
    text("Health: "+g1.health, 425, 30);
  }
}
