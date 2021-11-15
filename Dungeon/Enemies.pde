class Enemy extends GameObject {
  
  Enemy() {
  
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    lives = 20;
    roomX = 1;
    roomY = 1;
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
  
  
  void act() {
    super.act();
    
    // Collision with Bullet
    int i = 0;
    while(i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.loc.x, obj.loc.y, loc.x, loc.y);
        if (d <= size/2 + obj.size/2) {
          lives = lives - ((Bullet) obj).dmg;
          obj.lives = 0;
        }
      }
      i ++;  
    }
    
    // Collision with Hero
    float d = dist(loc.x, loc.y, myHero.loc.x, myHero.loc.y);
    if (d <= size/2 + myHero.size/2 && myHero.immune <= 0) {
      myHero.lives --;
      myHero.immune = 60;
    }
    
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
