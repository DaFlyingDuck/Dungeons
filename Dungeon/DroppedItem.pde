class DroppedItem extends GameObject {
  
  int type;
  int healthType;
  
  DroppedItem(float x, float y, int rx, int ry) {
    type = HEALTH;
    healthType = 25;
    lives = 1;
    loc = new PVector(x, y);
    vel = new PVector(0,0);
    size = 20;
    roomX = rx;
    roomY = ry;
  }
  
  
  void show() {
    noStroke();
    fill(#CD04D8);
    circle(loc.x, loc.y, size);
  } 
  
}
