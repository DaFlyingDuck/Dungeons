void game() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMiniMap();
  removeParticles();
  shop();
  gunMenu();
  //println("Hero Health:", myHero.lives);
  //println(myHero.xp);
  //println(myObjects.size()); 
  println(myHero.roomX, myHero.roomY);
  
  scroll = 0;
  
}

void mouseWheel(MouseEvent event) {
  scroll = event.getCount();
  println(scroll);
  }

void shop() {
  
  shopBut.show();
  
  if(mouseReleased && mouseX > shopBut.position.x - shopBut.w/2 && mouseX < shopBut.position.x + shopBut.w/2 && mouseY > shopBut.position.y - shopBut.h/2 && mouseY < shopBut.position.y + shopBut.h/2) {
    mode = pause;
  }
  
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
  sRoom = map.get(myHero.roomX, myHero.roomY +   1);  
  eRoom = map.get(myHero.roomX + 1, myHero.roomY);  

  noStroke();
  fill(black);
  if(nRoom != white) {
    ellipse(width/2, height * 0.1, 100, 100);
  }
  if(wRoom != white) {
    ellipse(width * 0.1, height/2, 100, 100);
  }
  if(sRoom != white) {
    ellipse(width/2, height * 0.9, 100, 100);
  }
  if(eRoom != white) {
    ellipse(width * 0.9, height/2, 100, 100);
  }
  
  // Closed Door Boss Room
  if (myHero.roomX == 8 && myHero.roomY == 6 && !bossBeat) {
    fill(mentalAsylum3);
    ellipse(width/2, height * 0.9, 110, 110);
  }
  if (myHero.roomX == 8 && myHero.roomY == 6 && bossBeat && !exitedBRoom) {
    fill(mentalAsylum3);
    ellipse(width * 0.1, height/2, 110, 110);
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
    
    if (myObj.lives <= 0) {
      myObjects.remove(i);
      //println(myObj);
    } else {
      i ++;
    }
    
    if (myObj.roomX == myHero.roomX && myObj.roomY == myHero.roomY) {  
      myObj.act();
      myObj.show();
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
    square(30 + size * x, 30 + size * y, size);
    x ++;
    if (x >= map.width) {
      x = 0;
      y ++;
    }
  }
  
  fill(golden);
  square(30 + size * myHero.roomX, 30 + size * myHero.roomY, size + 2);
 
  
}

void removeParticles() {
  
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    
    if (myObj instanceof Particles && (myObj.roomX != myHero.roomX || myObj.roomY != myHero.roomY)) {
      myObjects.remove(i);
    } else {
      i ++;
    }
    
  }
  
}


void gunMenu() {
  if(myHero.currentGun == 1) {
    image(sniperRifle, 100, 550, 150, 40);
  } else if (myHero.currentGun == 2) {
    image(pistol, 100, 550, 180, 100);
  } else if (myHero.currentGun == 3) {
    image(shotgun, 100, 550, 200, 100);
  }
}
