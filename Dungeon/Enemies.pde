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
  
  Enemy(int x, int y) {
  
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    lives = 20;
    roomX = x;
    roomY = y;
    size = 50;
    
  }
  
  Enemy(int _lives, int s, int x, int y, int _xp) {
    loc = new PVector(random(width/8, 7 * width/8), random(height/8, 7 * height/8));
    vel = new PVector(0, 0);
    lives = _lives;
    size = s;
    roomX = x;
    roomY = y;
    xp = _xp;
    
    
    
  }
  
  
  void act(int hDrop) {
    super.act();
    
    // Collision with Bullet
    int i = 0;
    while(i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && isCollidingWith(myObj)) {
        lives = lives - ((Bullet) myObj).dmg;
        myObj.lives = 0;
        if (lives <= 0) {
          int r = int(random(4));
          if (r == 0) {
            myObjects.add(new HealthPotion(loc.x, loc.y, roomX, roomY, hDrop));
          } else if (r == 1) {
            myObjects.add(new RapidFire(loc.x, loc.y, roomX, roomY));
          } else if (r == 2) {
            myObjects.add(new DmgBoost(loc.x, loc.y, roomX, roomY));
          } else if (r == 3) {
            myObjects.add(new SpdBoost(loc.x, loc.y, roomX, roomY));
          }
          
          for (int j = 0; j < 50; j ++) myObjects.add(new Particles(loc.x, loc.y, HERO_BLOOD));
          
          myHero.xp += xp;
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
      vel = new PVector(0,0);
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
