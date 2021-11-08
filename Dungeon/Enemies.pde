class Enemy extends GameObject {
  
  Enemy() {
  
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    lives = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
    
  }
  
  void show() {
    noStroke();
    fill(0, 255, 0);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(lives, loc.x, loc.y);
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
