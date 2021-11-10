class GameObject {
  
  int roomX, roomY;
  int lives;
  PVector loc;
  PVector vel;
  int size;
  int dmg;
  
  GameObject() {
    
    
  }
  
  void show() {
    
    
  }
  
  void act() {

    loc.add(vel);
    
  }
  
}
