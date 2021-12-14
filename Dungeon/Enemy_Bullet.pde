class Enemy_Bullet extends Enemy {



  Enemy_Bullet (float x, float y, int rX, int rY) {

    lives = 1;
    size = 10;
    loc = new PVector(x, y);
    vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(TURRET_BULLET_SPEED);
    roomX = rX;
    roomY = rY;
  }
  
  Enemy_Bullet(int rX, int rY, float x, float y) {
    lives = 1;
    size = 15;
    loc = new PVector(x, y);
    roomX = rX;
    roomY = rY;
    vel = new PVector(random(-BOSS_BULLET_SPEED, BOSS_BULLET_SPEED),random(-BOSS_BULLET_SPEED, BOSS_BULLET_SPEED));
    vel.setMag(BOSS_BULLET_SPEED);
  }
    

  void act() {

    loc.add(vel);

    // Collision with Hero
    if (isCollidingWith(myHero) && myHero.immune <= 0) {
      myHero.lives = myHero.lives - 15;
      myHero.immune = HERO_DMG_IMMUNE;
      lives = 0;
    }
  }

  void show() {

    fill(236, 255, 36);
    noStroke();
    circle(loc.x, loc.y, size);
  }
}
