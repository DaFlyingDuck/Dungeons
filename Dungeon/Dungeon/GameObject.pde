class GameObject {
  
  int lives;
  PVector loc;
  PVector vel;
  int size;
  
  GameObject() {
    
    
  }
  
  void show() {
    
    
  }
  
  void act() {

    loc.add(vel);
    
  }
  
}
