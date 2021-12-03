class Button {
  
  PVector position;
  float w;
  float h;
  float r;
  String text;
  color normal, highlight;
  boolean clicked;
  
  Button(String _text, float x, float y, float sw, float sh, color n, color hl, float _r) {
    
    position = new PVector(x,y);
    w = sw;
    h = sh;
    r = _r;
    text = _text;
    normal = n;
    highlight = hl;
    clicked = false;
    
  }
  
  void act() {
    
    
    
  }
  
  void show() {


    // Hover Over Highlight
    if(mouseX > position.x - w/2 && mouseX < position.x + w/2 && mouseY > position.y - h/2 && mouseY < position.y + h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
    
    rectMode(CENTER);
    rect(position.x, position.y, w, h, r);
    
    
    //
    textAlign(CENTER, CENTER);
    if(mouseX > position.x - w/2 && mouseX < position.x + w/2 && mouseY > position.y - h/2 && mouseY < position.y + h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(w/8);
    text(text, position.x, position.y);
    
    // Button Clicked
    if(mouseReleased && mouseX > position.x - w/2 && mouseX < position.x + w/2 && mouseY > position.y - h/2 && mouseY < position.y + h/2) {
      clicked = true;
    } else {
      clicked = false;
    }
    
  }
  
  void show(int tSize) {


    // Hover Over Highlight
    if(mouseX > position.x - w/2 && mouseX < position.x + w/2 && mouseY > position.y - h/2 && mouseY < position.y + h/2) {
      fill(highlight);
    } else {
      fill(normal);
    }
    
    rectMode(CENTER);
    rect(position.x, position.y, w, h, r);
    
    
    //
    textAlign(CENTER, CENTER);
    if(mouseX > position.x - w/2 && mouseX < position.x + w/2 && mouseY > position.y - h/2 && mouseY < position.y + h/2) {
      fill(normal);
    } else {
      fill(highlight);
    }
    textSize(tSize);
    text(text, position.x, position.y);
    
    // Button Clicked
    if(mouseReleased && mouseX > position.x - w/2 && mouseX < position.x + w/2 && mouseY > position.y - h/2 && mouseY < position.y + h/2) {
      clicked = true;
    } else {
      clicked = false;
    }
    
  }
  
}
