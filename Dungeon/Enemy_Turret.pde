class Turret extends Enemy {
  
  Turret(int rX, int rY) {
    super(45, 60, rX, rY);
     
  }
  
  void act() {
    super.act();
    
  }
  
  void show() {
    noStroke();
    fill(0, 0, 255);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(lives, loc.x, loc.y);
  }
 
  
}
