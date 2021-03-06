class Enemy extends GameObject {

  int dmg2Hero;
  int xp;

  Enemy() {

    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    lives = 20;
    roomX = 1;
    roomY = 1;
    size = 50;
  }

  Enemy(int _lives, int s, int x, int y, int _xp) {
    loc = new PVector(random(width/6, 5 * width/6), random(height/6, 5 * height/6));
    vel = new PVector(0, 0);
    lives = _lives;
    size = s;
    roomX = x;
    roomY = y;
    xp = _xp;
  }
  
  Enemy(int _lives, int s, float x, float y, int rx, int ry, int _xp) { // For minions

    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    lives = _lives;
    size = s;
    lives = 20;
    roomX = rx;
    roomY = ry;
    xp = _xp;
  }
  
  void act() { // Minion Act
    super.act();
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && isCollidingWith(myObj)) {
        lives = lives - ((Bullet) myObj).dmg;
        myObj.lives = 0;
      }
      i ++;
    }
    
    // Collision with Hero
    if (isCollidingWith(myHero) && myHero.immune <= 0) {
      myHero.lives = myHero.lives - dmg2Hero;
      myHero.immune = HERO_DMG_IMMUNE;
    }
  }
    

  void act(int hDrop) {
    super.act();

    // Collision with Bullet
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && isCollidingWith(myObj)) {
        lives = lives - ((Bullet) myObj).dmg;
        myObj.lives = 0;
        // Drop Item
        if (lives <= 0) {
          int r = int(random(5));
          if (r == 0) {
            myObjects.add(new HealthPotion(loc.x, loc.y, roomX, roomY, hDrop));
          } else if (r == 1) {
            myObjects.add(new RapidFire(loc.x, loc.y, roomX, roomY));
          } else if (r == 2) {
            myObjects.add(new DmgBoost(loc.x, loc.y, roomX, roomY));
          } else if (r == 3) {
            myObjects.add(new SpdBoost(loc.x, loc.y, roomX, roomY));
          } else if (r == 4) {
            myObjects.add(new HealthPotion(loc.x, loc.y, roomX, roomY, hDrop));
          }
          for (int j = 0; j < 50; j ++) myObjects.add(new Particles(loc.x, loc.y, HERO_BLOOD));

          myHero.xp += xp;
          myObjects.add(new Message(loc, "+" + xp, roomX, roomY));
        }
      }
      i ++;
    }

    // Collision with Hero
    if (isCollidingWith(myHero) && myHero.immune <= 0) {
      myHero.lives = myHero.lives - dmg2Hero;
      myHero.immune = HERO_DMG_IMMUNE;
    }
  }

  void show() {
    fill(black);
    textSize(20);
    text(int(lives), loc.x, loc.y);
  }

}

class Dummy extends Enemy {

  Dummy(int rX, int rY) {
    super(DUMMY_LIVES, DUMMY_SIZE, rX, rY, DUMMY_XP);
    dmg2Hero = 20;
  }

  void show() {
    noStroke();
    fill(green);
    circle(loc.x, loc.y, size);
    super.show();
  }

  void act() {

    super.act(20);
  }
}

class Follower extends Enemy {

  Follower(int rX, int rY) {
    super(FOLLOWER_LIVES, FOLLOWER_SIZE, rX, rY, FOLLOWER_XP);
    dmg2Hero = 25;
  }

  void show() {
    noStroke();
    fill(red);
    circle(loc.x, loc.y, size);
    super.show();
  }

  void act() {

    super.act(30);

    if (myHero.lives > 0) {
      vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag(FOLLOWER_SPEED);
    } else {
      vel = new PVector(0, 0);
    }
  }
}



class Turret extends Enemy {

  int shotTimer;
  int threshold;

  Turret(int rX, int rY) {
    super(TURRET_LIVES, TURRET_SIZE, rX, rY, TURRET_XP);
    dmg2Hero = 15;

    shotTimer = 0;
    threshold = 60;
  }

  void act() {
    super.act(35);

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
    super.show();
  }
}

class Spawner extends Enemy {

  int spwnTimer;
  int threshold;

  Spawner(int rX, int rY) {
    super(SPAWNER_LIVES, SPAWNER_SIZE, rX, rY, SPAWNER_XP);

    spwnTimer = 0;
    threshold = 180;
    dmg2Hero = 20;
  }

  void act() {
    super.act(40);

    spwnTimer ++;
    if (spwnTimer > threshold) {
      myObjects.add(new Minion(MINION_LIVES, loc.x, loc.y, roomX, roomY, red));
      spwnTimer = 0;
    }
  }

  void show() {
    noStroke();
    fill(pink);
    circle(loc.x, loc.y, size);
    super.show();
  }
}

class Minion extends Enemy {
  
  color c;

  Minion(int _lives, float x, float y, int rX, int rY, color _c) {
    super(_lives, MINION_SIZE,x, y, rX, rY, MINION_XP);
    
    dmg2Hero = 10;
    c = _c;
  }

  void act() {
    super.act();
    
    if (myHero.lives > 0) {
      vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag(FOLLOWER_SPEED);
    } else {
      vel = new PVector(0, 0);
    }
    
  }

  void show() {
    noStroke();
    fill(c);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(10);
    text(int(lives), loc.x, loc.y);
  }
}

class Boss extends Enemy {
  
  int spwnTimer;
  int spwnthreshold;
  
  int shotTimer;
  int shotthreshold;
  
  int bossPhase;
  
  float shotDeg;
  
  
  Boss(int rX, int rY) {
    super(BOSS_LIVES, BOSS_SIZE, rX, rY, BOSS_XP);
    loc = new PVector(width/2, height/2);
    dmg2Hero = 30;
    
    // Shooting and Spawning
    spwnTimer = 0;
    spwnthreshold = 420;
    shotTimer = 0;
    shotthreshold = 90;
    
    bossPhase = 1;
    shotDeg = 0;
    
  }
  
  void act() {
    
    loc.add(vel);
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && isCollidingWith(myObj)) {
        lives = lives - ((Bullet) myObj).dmg;
        if (lives <= 0 && bossPhase == 1) {
          lives = 200;
          bossPhase = 2;
          shotTimer = 0;
          shotthreshold = 3;
        }
        if (lives <= 0 && bossPhase == 2) {
          bossBeat = true;
          exitedBRoom = false;
        }
        myObj.lives = 0;
      }
      i ++;
    }
  
    // Collision with Hero
    if (isCollidingWith(myHero) && myHero.immune <= 0) {
      myHero.lives = myHero.lives - dmg2Hero;
      myHero.immune = HERO_DMG_IMMUNE;
    }
    
    
    
    if (lives <= BOSS_LIVES && bossPhase == 1) {
      spwnTimer ++;
      if (spwnTimer > spwnthreshold) {
        myObjects.add(new Minion(MINION_LIVES + 5, loc.x, loc.y, roomX, roomY, mentalAsylum7));
        spwnTimer = 0;
      }
    }
    if (lives <= 2 * BOSS_LIVES / 3 && bossPhase == 1) {
      shotTimer ++;
      if (shotTimer > shotthreshold) {
        myObjects.add(new Enemy_Bullet(loc.x, loc.y, roomX, roomY));
        shotTimer = 0;
      }
    }
    if (lives <= BOSS_LIVES / 3 && bossPhase == 1) {
      if (myHero.lives > 0) {
        vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
        vel.setMag(BOSS_SPEED);
      } else {
        vel = new PVector(0, 0);
      }
    }
    
    
    if (bossPhase == 2) {
      
      if (dist(loc.x, loc.y, width/2, height/2) > 2) {
        vel = new PVector(width/2 - loc.x, height/2 - loc.y);
        vel.setMag(1);
      } else {
        loc = new PVector(width/2, height/2);
      }
      
      //shotTimer ++;
      //if (shotTimer > shotthreshold) {
      //  shotTimer = 0;
      //  for(int u = 0; u < 15; u ++) {
      //    myObjects.add(new Enemy_Bullet(roomX, roomY, loc.x, loc.y));
      //  }
      //}
      
      shotTimer ++;
      if (shotTimer > shotthreshold) {
        shotDeg = shotDeg + (2 * PI / random(12,16));
        if (shotDeg > 2 * PI) shotDeg = 0;
        for(int u = 0; u < 2; u ++) {
          myObjects.add(new Enemy_Bullet(loc.x, loc.y, roomX, roomY, shotDeg + random(-2 * PI / 20, 2 * PI / 20) ));
        }
        shotTimer = 0;
      }
      
    }
    
    
  }
  
  void show() {
    noStroke();
    fill(mentalAsylum6);
    circle(loc.x, loc.y, size);
    super.show();
  }
  
}
