class Weapon {
  
  int shotTimer;
  int threshold;
  int bulletSpeed;
  int fireRate;
  
  Weapon(int t, int b) {
    shotTimer = 0;
    threshold = t;
    bulletSpeed = b;
    fireRate = 1;
    
  }
  
  void update() {
    
    shotTimer = shotTimer + fireRate; 
   
  }
  
  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX - myHero.loc.x, mouseY - myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(aimVector.x, aimVector.y, #D30D13, BULLET_SIZE, bulletSpeed/2));
      shotTimer = 0;
    }
  }
  
}


class SniperRifle extends Weapon {
  
  SniperRifle() {
    super(SNIPER_RELOAD,SNIPER_SPEED);
  }
  
}

class AutoPistol extends Weapon {
  
  AutoPistol() {
    super(PISTOL_RELOAD,PISTOL_SPEED);
  }
  
}

class icecream extends Weapon {
  
  icecream() {
    super(ICECREAM_RELOAD,ICECREAM_SPEED);
  }

}

class shotgun extends Weapon { 
  
  shotgun() {
    super(SHOTGUN_RELOAD, SHOTGUN_SPEED);
  }
  
  void shoot() {
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector(mouseX - myHero.loc.x, mouseY - myHero.loc.y);
      aimVector.setMag(bulletSpeed);
      for (int i = 0; i < 10; i ++) {
        myObjects.add(new Bullet(aimVector.x + random(-.35 * bulletSpeed, .35 * bulletSpeed), aimVector.y + random(-.35 * bulletSpeed, .35 * bulletSpeed), #D30D13, SHOTGUN_BULLET_SIZE, SHOTGUN_BULLET_DMG));
      }
      shotTimer = 0;
    }
  }
  
}
