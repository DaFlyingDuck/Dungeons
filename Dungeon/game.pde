void game() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
 
}


void drawRoom() {
  
  background(0);
  
  // Room Background
  noStroke();
  fill(mentalAsylum3);
  rect(width/2, height/2, width, height);
  
  //Room X cross lines
  strokeWeight(4);
  stroke(mentalAsylum2);
  line(0, height, width, 0);
  line(0, 0, width, height);
  
  // Draw Exits
  nRoom = map.get(myHero.roomX, myHero.roomY - 1);
  wRoom = map.get(myHero.roomX - 1, myHero.roomY);
  sRoom = map.get(myHero.roomX, myHero.roomY + 1);  
  eRoom = map.get(myHero.roomX + 1, myHero.roomY);  

  noStroke();
  fill(black);
  if(nRoom == black) {
    ellipse(width/2, height * 0.1, 100, 100);
  }
  if(wRoom == black) {
    ellipse(width * 0.1, height/2, 100, 100);
  }
  if(sRoom == black) {
    ellipse(width/2, height * 0.9, 100, 100);
  }
  if(eRoom == black) {
    ellipse(width * 0.9, height/2, 100, 100);
  }
  
  // Room floor square
  stroke(mentalAsylum2);
  strokeWeight(5);
  fill(mentalAsylum3);
  rect(width/2, height/2, 3 * width/4, 3 * height/4);
  
}

void drawGameObjects() {

  for (int i = 0; i < myObjects.size(); i ++) {
    GameObject myObj = myObjects.get(i);
    
    myObj.act();
    myObj.show();
    
  }  
  
}
void drawLightLayer() {

  for (int i = 0; i < darkness.size(); i ++) {
    DarknessCell myDark = darkness.get(i);  
    myDark.act();
    myDark.show();
    
  }  
  
}
