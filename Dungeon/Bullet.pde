class Bullet extends GameObject {
  
  color colour;
  
  
  Bullet(PVector speed, color c, int s) {
    loc = new PVector(myHero.loc);
    vel = new PVector(speed);
    size = s;
    colour = c;
    
    
  }
  
  void act() {
    super.act();
  }
  
  
  void show() {
    
    fill(colour);
    circle(loc.x, loc.y, size);
  
  
  
  
  
}
