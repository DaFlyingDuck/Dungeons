class Follower extends Enemy {
  
  Follower(int rX, int rY) {
    super(FOLLOWER_LIVES, FOLLOWER_SIZE, rX, rY);
    dmg2Hero = 25;
    
  }
  
  void show() {
    noStroke();
    fill(red);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(lives, loc.x, loc.y);
  }
  
  void act() {
    
    super.act(30);
    
    if (myHero.lives > 0) {
      vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag(FOLLOWER_SPEED);
    } else {
      vel = new PVector(0,0);
    }
    
    
  }
  
  
}
