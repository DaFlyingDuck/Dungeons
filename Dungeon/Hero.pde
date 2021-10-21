class Hero extends GameObject {
  
  
  Hero() {
    
    lives = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 30;
    
    
    
  }
  
  void act() {
    
    super.act();
    
    
    //Movement Code
    if(wkey) vel.y = -1;
    if(skey) vel.y = 1;
    if(akey) vel.x = -1;
    if(dkey) vel.x = 1;
    if(wkey || skey || akey || dkey) vel.setMag(2);
    
    if(!wkey && !skey) vel.y = 0;
    if(!akey && !dkey) vel.x = 0;
    
    // Border Walls
    if(loc.x < width/2 - 3 * width/8 + size/2) loc.x = width/2 - 3 * width/8 + size/2;
    if(loc.x > width/2 + 3 * width/8 - size/2) loc.x = width/2 + 3 * width/8 - size/2;
    if(loc.y < height/2 - 3 * height/8 + size/2)loc.y = height/2 - 3 * height/8 + size/2;
    if(loc.y > height/2 + 3 * height/8 - size/2)loc.y = height/2 + 3 * height/8 - size/2;    
    
  }
  
  void show() {
   
    stroke(mentalAsylum5);
    fill(mentalAsylum5);
    circle(loc.x, loc.y, size);
    
  }
  
}
