class Enemy extends GameObject {
  
  int dmg2Hero;
  
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
  
  Enemy(int _lives, int s, int x, int y) {
    loc = new PVector(random(width/8, 7 * width/8), random(height/8, 7 * height/8));
    vel = new PVector(0, 0);
    lives = _lives;
    size = s;
    roomX = x;
    roomY = y;
    
    
    
  }
  
  
  void act(int hDrop) {
    super.act();
    
    // Collision with Bullet
    int i = 0;
    while(i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (lives > 0 && myObj instanceof Bullet && isCollidingWith(myObj)) {
        lives = lives - ((Bullet) myObj).dmg;
        myObj.lives = 0;
        if (lives <= 0) {
          myObjects.add(new HealthPotion(loc.x, loc.y, roomX, roomY, hDrop));
          for (int j = 0; j < 50; j ++) myObjects.add(new Particles(loc.x, loc.y, HERO_BLOOD));
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
    noStroke();
    fill(black);
    circle(loc.x, loc.y, size);
    fill(black);
    textSize(20);
    text(lives, loc.x, loc.y);
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
