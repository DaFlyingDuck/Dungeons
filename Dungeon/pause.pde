void pause() {
  
  pTimer --;
  if (pkey && pTimer < 0) {
    mode = game;
    pTimer = 10;
  }
  
  background(mentalAsylum6);
  
  // Shop Title
  stroke(mentalAsylum4);
  fill(mentalAsylum4);
  textFont(dungeon);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("Upgrade Shop", width/2, height/4);
  
  // Back Button
  backBut.show(10);
  if(mouseReleased && mouseX > backBut.position.x - backBut.w/2 && mouseX < backBut.position.x + backBut.w/2 && mouseY > backBut.position.y - backBut.h/2 && mouseY < backBut.position.y + backBut.h/2) {
    mode = game;
  }
  
  // Hero Health Upgrade
  stroke(mentalAsylum4);
  fill(mentalAsylum7);
  textSize(30);
  text("Hero Health:", width/4 + 60, height/2);
  hUpgBut.show(50);
  
  
  
  
  
}
