void game() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMiniMap();
 
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

  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    
    if (myObj.roomX == myHero.roomX && myObj.roomY == myHero.roomY) {  
      myObj.act();
      myObj.show();
    }
    
    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i ++;
    }
    
  }  
  
}


void drawLightLayer() {

  for (int i = 0; i < darkness.size(); i ++) {
    DarknessCell myDark = darkness.get(i);  
    myDark.act();
    myDark.show();
    
  }  
  
}

void drawMiniMap() {
  int size = 8;
  int x = 0;
  int y = 0;
  while (y < map.height) {
    color c = map.get(x,y);  
    fill(c, 200);
    noStroke();
    square(30 + 8 * x, 30 + 8 * y, size);
    x ++;
    if (x >= map.width) {
      x = 0;
      y ++;
    }
  }
  
  fill(#D30DC0);
  square(30 + 7 * myHero.roomX, 30 + 7 * myHero.roomY, 8);
  
}
