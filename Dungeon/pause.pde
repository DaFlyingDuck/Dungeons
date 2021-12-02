void pause() {
  
  pTimer --;
  if (pkey && pTimer < 0) {
    mode = game;
    pTimer = 10;
  }
  
  pauseScreen();
  
}

void pauseScreen() {
  background(mentalAsylum6);
  
}
