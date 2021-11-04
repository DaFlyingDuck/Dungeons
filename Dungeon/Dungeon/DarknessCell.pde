class DarknessCell {
  
  float opacity;
  PVector loc;
  float size;
  float d;
  
  DarknessCell(float _x, float _y, float s) {
    size = s;
    loc = new PVector(_x, _y);
    opacity = 100;
    
  }
  
  void act() {
    
    
  }
  
  void show() {
    
    noStroke();
    d = dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y);
    opacity = map(d, 0, 500, 0, 255);
    fill(black, opacity);
    square(loc.x, loc.y, size);
    
  }
  
  
  
  
  
  
  
  
  
  
}
