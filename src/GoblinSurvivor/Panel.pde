//Canon Unguren | 25 Oct 2024

class Panel {
  int seconds;
  int minutes;
  int enemiesKilled;
  int xp;
  int money;
  Panel() {
    seconds = millis()/1000;
    minutes = 0;
    xp = 0;
    money = 0;
  }
  void display() {
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
    text("Money:"+xp, 30, 30);
    text("Kills: "+enemiesKilled, 200, 30);
    fill(255, 150);
    rect(400, 5, 200, 30, 10);
    fill(255, 0, 0, 150);
    rect(400, 5, g1.health*2, 30, 10);


    fill(0);
    text("Health: "+g1.health, 425, 30);
  }
}
