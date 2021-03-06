class Hero extends GameObject {
  
  int roomX, roomY;
  Weapon myWeapon;
  int currentGun;
  Weapon[] myGuns;
  
  Hero() {
    
    lives = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 30;
    roomX = 1;
    roomY = 1;
    
   myGuns = new Weapon[10];
    myGuns[1] = new SniperRifle();
    myGuns[2] = new AutoPistol();
    myGuns[3] = new icecream();
    myGuns[4] = new icecream();
    myGuns[5] = new icecream();
    myGuns[6] = new icecream();
    myGuns[7] = new icecream();
    myGuns[8] = new icecream();
    myGuns[9] = new icecream();
    currentGun = 9;
    
    
  }
  
  void act() {
    
    super.act();
    
    // Change Guns
    if (key1) currentGun = 1;
    if (key2) currentGun = 2;
    if (key3) currentGun = 3;
    if (key4) currentGun = 4;
    if (key5) currentGun = 5;
    if (key6) currentGun = 6;
    if (key7) currentGun = 7;
    if (key8) currentGun = 8;
    if (key9) currentGun = 9;    
    
    
    
    // Update and Shoot Gun
    myGuns[currentGun].update();
    if (spacekey) myGuns[currentGun].shoot();
    
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
