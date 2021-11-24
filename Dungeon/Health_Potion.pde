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
