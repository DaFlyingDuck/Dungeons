class Chest extends GameObject {
  
  boolean opened;
  
  Chest() {
    roomX = 8;
    roomY = 8;
    lives = 1;
    loc = new PVector(width/2, 5 * height/8);
    size = 69;
  }
  
  void act() {
  }
  
  void show() {
    image(chest, loc.x, loc.y, size, size);
  }
  
}
