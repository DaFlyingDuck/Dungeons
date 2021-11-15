class SniperRifle extends Weapon {
  
  SniperRifle() {
    super(100,20);
  }
  
}

class AutoPistol extends Weapon {
  
  AutoPistol() {
    super(12,3);
  }
  
}

class icecream extends Weapon {
  
  icecream() {
    super(2,30);
  }

}

class shotgun extends Weapon { 
  
  shotgun() {
    super(100, 6);
  }
  
  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX - myHero.loc.x, mouseY - myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      for (int i = 0; i < 10; i ++) {
        myObjects.add(new Bullet(aimVector.x + random(-.35 * bulletSpeed, .35 * bulletSpeed), aimVector.y + random(-.35 * bulletSpeed, .35 * bulletSpeed), #D30D13, 7, 2));
      }
      shotTimer = 0;
    }
  }
  
}
