void pause() {
  
  
  
  pTimer --;
  if (pkey && pTimer < 0) {
    mode = game;
    pTimer = 10;
  }
  
}
