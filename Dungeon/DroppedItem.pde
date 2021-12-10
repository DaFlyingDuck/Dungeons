class DroppedItem extends GameObject {
  
  int type;
  int healthType;
  
  DroppedItem(float x, float y, int rx, int ry) {
    lives = 1;
    loc = new PVector(x, y);
    vel = new PVector(0,0);
    size = 20;
    roomX = rx;
    roomY = ry;
  }
  
}


class HealthPotion extends DroppedItem {
  
  HealthPotion(float x, float y, int rx, int ry, int hAmount) {
    super(x, y, rx, ry);  
    type = HEALTH;
    healthType = hAmount;
  }
  
  void show() {
    healthPotion.show(loc.x, loc.y, 1.5 * size, 1.5 * size);
  }
  
}

class RapidFire extends DroppedItem {
  
  RapidFire(float x, float y, int rx, int ry) {
    super(x, y, rx, ry);
    type = RFIRE;
  }
  
  void show() {
    image(rapidfire, loc.x, loc.y, size * 3, size * 0.7);
  }
  
}

class DmgBoost extends DroppedItem {
    
  DmgBoost(float x, float y, int rx, int ry) {
    super(x, y, rx, ry);
    type = DBOOST;
  }
  
  void show() {
    image(damageboost, loc.x, loc.y, size * 3, size * 0.7);
  }
  
}

class SpdBoost extends DroppedItem {
  
  SpdBoost(float x, float y, int rx, int ry) {
    super(x,y,rx,ry);
    type = SBOOST;
  }
  
  void show() {
    image(speedboost, loc.x, loc.y, size * 1.4, size * 1.4);  
  }
  
  
}
