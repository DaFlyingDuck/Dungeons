class Bullet extends GameObject {
  
  color colour;
  
  
  Bullet(float speedx, float speedy, color c, int s) {
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    lives = 1;
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(speedx, speedy);
    size = s;
    colour = c;
    
    
  }
  
  void act() {
    super.act();
    
    if (loc.x < 0) lives = 0;
    if (loc.x > width) lives = 0;
    if (loc.y < 0) lives = 0;
    if (loc.y > height) lives = 0;
    
  }
  
  
  void show() {
    
    fill(colour);
    noStroke();
    circle(loc.x, loc.y, size);
  }

}
