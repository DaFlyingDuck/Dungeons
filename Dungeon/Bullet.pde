class Bullet extends GameObject {
  
  color colour;
  int dmg;
  
  
  Bullet(float speedx, float speedy, color c, int s, int _dmg) {
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    lives = 1;
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(speedx, speedy);
    size = s;
    colour = c;
    dmg = _dmg;
    
    
  }
  
  void act() {
    super.act();
    
    if (loc.x < 0) lives = 0;
    if (loc.x > width) lives = 0;
    if (loc.y < 0) lives = 0;
    if (loc.y > height) lives = 0;
    
    if(loc.x < width/2 - 3 * width/8 + size/2) wWall();
    if(loc.x > width/2 + 3 * width/8 - size/2) eWall(); 
    if(loc.y < height/2 - 3 * height/8 + size/2) nWall();
    if(loc.y > height/2 + 3 * height/8 - size/2) sWall();
    
  }
  
  
  void show() {
    
    fill(colour);
    noStroke();
    circle(loc.x, loc.y, size);
  }
  
  void wWall() {
    lives = 0;
    if (size < 10) {
      for (int i = 0; i < 4; i ++) myObjects.add(new Particles(loc.x, loc.y, WWALL, BULLET_EXPLOSION));
    } else {
      for (int i = 0; i < 10; i ++) myObjects.add(new Particles(loc.x, loc.y, WWALL, BULLET_EXPLOSION));
    }
  }
  void eWall() {
    lives = 0;
    if (size < 10) {
      for (int i = 0; i < 4; i ++) myObjects.add(new Particles(loc.x, loc.y, EWALL, BULLET_EXPLOSION));
    } else {
      for (int i = 0; i < 10; i ++) myObjects.add(new Particles(loc.x, loc.y, EWALL, BULLET_EXPLOSION));
    }
  }
  void nWall() {
    lives = 0;
    if (size < 10) {
      for (int i = 0; i < 4; i ++) myObjects.add(new Particles(loc.x, loc.y, NWALL, BULLET_EXPLOSION));
    } else {
      for (int i = 0; i < 10; i ++) myObjects.add(new Particles(loc.x, loc.y, NWALL, BULLET_EXPLOSION));
    }    
  }
  void sWall() {
    lives = 0;
    if (size < 10) {
      for (int i = 0; i < 4; i ++) myObjects.add(new Particles(loc.x, loc.y, SWALL, BULLET_EXPLOSION));
    } else {
      for (int i = 0; i < 10; i ++) myObjects.add(new Particles(loc.x, loc.y, SWALL, BULLET_EXPLOSION));
    }  
  }
  

}
