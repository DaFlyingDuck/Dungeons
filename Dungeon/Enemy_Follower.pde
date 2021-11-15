class Follower extends Enemy {
  
  Follower(int rX, int rY) {
    super(30, 50, rX, rY);
    
  }
  
  void show() {
    noStroke();
    fill(255, 0, 0);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(lives, loc.x, loc.y);
  }
  
  void act() {
    
    super.act();
    
    if (myHero.lives > 0) {
      vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag(1.5);
    } else {
      vel = new PVector(0,0);
    }
    
    
  }
  
  
}
