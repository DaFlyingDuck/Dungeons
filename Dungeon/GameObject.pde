class GameObject {
  
  int roomX, roomY;
  float lives;
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
  
  boolean isCollidingWith(GameObject myObj) {
  
    float d = dist(myObj.loc.x, myObj.loc.y, loc.x, loc.y);
    return inRoomWith(myObj) && d < size/2 + myObj.size/2 && lives > 0;
  }
  
  boolean inRoomWith(GameObject myObj) {  
    return roomX == myObj.roomX && roomY == myObj.roomY;
  }
  
}
