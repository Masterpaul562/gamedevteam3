class Timer {

  int savedTime;      // When Timer started
  int totalTime;      // How long Timer should last
  boolean paused;     // Is the timer paused?
  int pausedTime;     // The time at which the timer was paused

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
    paused = false;
  }

  // Starting the timer
  void start() {
    savedTime = millis();
    paused = false;
    pausedTime = 0;
  }

  // Pausing the timer
  void pause() {
    if (!paused) {
      pausedTime = millis() - savedTime;
      paused = true;
    }
  }

  // Resuming the timer
  void resume() {
    if (paused) {
      savedTime = millis() - pausedTime;
      paused = false;
      pausedTime = 0;
    }
  }

  // The function isFinished() returns true if the set time has passed. 
  boolean isFinished() {
    if (paused) {
      return false;  // If paused, it can't be finished
    }
    int passedTime = millis() - savedTime;
    return passedTime > totalTime;
  }
}
