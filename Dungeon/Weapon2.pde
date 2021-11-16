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
