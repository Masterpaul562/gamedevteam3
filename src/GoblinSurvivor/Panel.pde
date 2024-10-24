class Panel {
  int seconds;
  int minutes;
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
      text(int(seconds/60)+":"+seconds%60, width-70, 30);
    } else {
      text(int(seconds/60)+":0"+seconds%60, width-70, 30);
    }
   
  }
}
