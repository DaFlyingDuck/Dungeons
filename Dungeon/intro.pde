void intro() {
  
  //Title Screen Background GIF
  introGIF.show();
  
  // Dungeon Title
  stroke(mentalAsylum4);
  fill(mentalAsylum4);
  textFont(dungeon);
  textAlign(CENTER, CENTER);
  textSize(60);
  text("Dungeons", width/2, height/4);
  
  // Start Button
  startBut.show();
  // If clicked start button, start game
  if(mouseReleased && mouseX > startBut.position.x - startBut.w/2 && mouseX < startBut.position.x + startBut.w/2 && mouseY > startBut.position.y - startBut.h/2 && mouseY < startBut.position.y + startBut.h/2) {
    mode = game;
    resetShop();
  }
  
}

void resetShop() {
  hUpgNum = 0;
  dUpgNum = 0;
  sUpgNum = 0;
  hUpgCost = 2;
  dUpgCost = 2;
  sUpgCost = 2;
  
}
