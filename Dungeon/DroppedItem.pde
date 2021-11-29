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
  
  RapidFire() {
    
  }
  
  void show() {
    
  }
  
}
