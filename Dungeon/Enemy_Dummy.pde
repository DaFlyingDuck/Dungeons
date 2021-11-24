class Dummy extends Enemy {
  
  Dummy(int rX, int rY) {
    super(DUMMY_LIVES, DUMMY_SIZE, rX, rY);
    dmg2Hero = 20;
    
  }
  
  void show() {
    noStroke();
    fill(green);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(lives, loc.x, loc.y);
  }
  
  void act() {
    
    super.act(20);

    
  }
  
  
}
