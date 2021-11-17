class Turret extends Enemy {
  
  int shotTimer;
  int threshold;
  
  Turret(int rX, int rY) {
    super(TURRET_LIVES, TURRET_SIZE, rX, rY);
    shotTimer = 0;
    threshold = 60;
     
  }
  
  void act() {
    super.act();
    
    shotTimer ++;
    if (shotTimer > threshold) {
      myObjects.add(new Enemy_Bullet(loc.x, loc.y, roomX, roomY));
      shotTimer = 0;
    }
    
  }
  
  void show() {
    noStroke();
    fill(blue);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(lives, loc.x, loc.y);
  }
 
  
}
