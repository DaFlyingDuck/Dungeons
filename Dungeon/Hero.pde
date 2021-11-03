class Hero extends GameObject {
  
  int roomX, roomY;
  Weapon myWeapon;
  
  Hero() {
    
    lives = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 30;
    roomX = 1;
    roomY = 1;
    
    Weapon[] myGuns = new Weapon[9];
    myGuns[1] = new SniperRifle();
    myGuns[2] = new AutoPistol();
    myGuns[3] = new icecream();
    
    
  }
  
  void act() {
    
    super.act();
    
    int i = 0;
    while (i < 10) {
      myGuns[i].update();
      i = i + 1;
    }
    
    if (spacekey) myGuns[1].shoot();
    
    //Movement Code
    if(wkey) vel.y = -2;
    if(skey) vel.y = 2;
    if(akey) vel.x = -2;
    if(dkey) vel.x = 2;
    if(wkey || skey || akey || dkey) vel.setMag(2);
    
    if(!wkey && !skey) vel.y = vel.y * 0.85;
    if(!akey && !dkey) vel.x = vel.x * 0.85;
    
    // Border Walls
    if(loc.x < width/2 - 3 * width/8 + size/2) loc.x = width/2 - 3 * width/8 + size/2;
    if(loc.x > width/2 + 3 * width/8 - size/2) loc.x = width/2 + 3 * width/8 - size/2;
    if(loc.y < height/2 - 3 * height/8 + size/2)loc.y = height/2 - 3 * height/8 + size/2;
    if(loc.y > height/2 + 3 * height/8 - size/2)loc.y = height/2 + 3 * height/8 - size/2;
    
    // Collision With Doors
    if (nRoom == black && loc.y == height/2 - 3 * height/8 + size/2 && loc.x > width/2 - 50 && loc.x < width/2 + 50) {
      roomY --;
      loc = new PVector(width/2, height/2 + 3 * height/8 - size/2 - 10);
      println(roomX, roomY);
  
      int r = 0;
      while (r < myObjects.size()) {
      GameObject myObj = myObjects.get(r);
        if (myObj instanceof Bullet) {
          myObj.lives = 0;
        }
        r ++;
      }
      
    }
    if(wRoom == black && loc.x == width/2 - 3 * width/8 + size/2 && loc.y > height/2 - 50 && loc.y < height/2 + 50) {
      roomX --;
      loc = new PVector(width/2 + 3 * width/8 - size/2 - 10, height/2);
      println(roomX, roomY);
      
      int r = 0;
      while (r < myObjects.size()) {
      GameObject myObj = myObjects.get(r);
        if (myObj instanceof Bullet) {
          myObj.lives = 0;
        }
        r ++;
      }
      
    }
    if(sRoom == black && loc.y == height/2 + 3 * height/8 - size/2 && loc.x > width/2 - 50 && loc.x < width/2 + 50) {
      roomY ++;
      loc = new PVector(width/2, height/2 - 3 * height/8 + size/2 + 10);
      println(roomX, roomY);
      
      int r = 0;
      while (r < myObjects.size()) {
      GameObject myObj = myObjects.get(r);
        if (myObj instanceof Bullet) {
          myObj.lives = 0;
        }
        r ++;
      }
      
    }
    if(eRoom == black && loc.x == width/2 + 3 * width/8 - size/2 && loc.y > height/2 - 50 && loc.y < height/2 + 50) {
      roomX ++;
      loc = new PVector(width/2 - 3 * width/8 + size/2 + 10, height/2);
      println(roomX, roomY);
      
      int r = 0;
      while (r < myObjects.size()) {
      GameObject myObj = myObjects.get(r);
        if (myObj instanceof Bullet) {
          myObj.lives = 0;
        }
        r ++;
      }
      
    }
    
    
  }
  
  void show() {
   
    stroke(mentalAsylum5);
    fill(mentalAsylum5);
    circle(loc.x, loc.y, size);
   
    
  }
  
}
