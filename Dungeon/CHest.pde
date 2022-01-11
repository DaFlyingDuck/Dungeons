class Chest extends GameObject {
  
  Chest() {
    roomX = 8;
    roomY = 8;
    lives = 1;
    loc = new PVector(width/2, 5 * height/8);
    size = 69;
    opened = false;
  }
  
  void act() {
    if (wasPressed && mouseX > width/2 - 35 && mouseX < width/2 + 35 && mouseY > 5*height/8 - 35 && mouseY < 5*height/8 + 35) {
      opened = true;
      mode = gameover;
    }
  }
  
  void show() {
    image(chest, loc.x, loc.y, size, size);
  }
  
}
