class Hero extends GameObject {
  
  int roomX, roomY;
  
  Hero() {
    
    lives = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 30;
    roomX = 1;
    roomY = 1;
    
    
    
  }
  
  void act() {
    
    super.act();
    
    
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
    }
    if(wRoom == black && loc.x == width/2 - 3 * width/8 + size/2 && loc.y > height/2 - 50 && loc.y < height/2 + 50) {
      roomX --;
      loc = new PVector(width/2 + 3 * width/8 - size/2 - 10, height/2);
    }
    if(sRoom == black && loc.y == height/2 + 3 * height/8 - size/2 && loc.x > width/2 - 50 && loc.x < width/2 + 50) {
      roomY ++;
      loc = new PVector(width/2, height/2 - 3 * height/8 + size/2 + 10);
    }
    if(eRoom == black && loc.x == width/2 + 3 * width/8 - size/2 && loc.y > height/2 - 50 && loc.y < height/2 + 50) {
      roomX ++;
      loc = new PVector(width/2 - 3 * width/8 + size/2 + 10, height/2);
    }
    
    
  }
  
  void show() {
   
    stroke(mentalAsylum5);
    fill(mentalAsylum5);
    circle(loc.x, loc.y, size);
    
    println(roomX, roomY);
    
  }
  
}
