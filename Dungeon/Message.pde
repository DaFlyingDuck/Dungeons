class Message extends GameObject {

  String msg;
  int timer;
  
  Message(PVector _loc, String _msg, int rx, int ry) {
    
    roomX = rx;
    roomY = ry;
    lives = 1;
    loc = _loc;
    msg = _msg;
    vel = new PVector(0, -1);
    
    timer = 120;
    
  }
  
  void act() {
    
    super.act();
    timer --;
    if (timer <= 0) lives = 0;
    
  }
  
  void show() {
    
    fill(white, 2 * timer);
    textSize(15);
    text(msg, loc.x, loc.y);
    
  }
  
}
