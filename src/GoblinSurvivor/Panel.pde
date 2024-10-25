class Panel {
  int seconds;
  int minutes;
  int enemiesKilled;
  Panel() {
    seconds = millis()/1000;
    minutes = 0;
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
    text("Money: 0", 30,30);
    text("Enemies Killed: "+
  }
}
