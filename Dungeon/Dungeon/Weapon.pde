class Weapon {
  
  int shotTimer;
  int threshold;
  int bulletSpeed;
  
  Weapon(int t, int b) {
    shotTimer = 0;
    threshold = t;
    bulletSpeed = b;
    
  }
  
  void update() {
    
    shotTimer ++; 
   
  }
  
  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX - myHero.loc.x, mouseY - myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(aimVector.x, aimVector.y, #D30D13, 10));
      shotTimer = 0;
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
