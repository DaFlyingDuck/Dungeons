class AnimatedGIF {
  
  PImage[] pics;
  int numFrames;
  int currentFrame;
  
  int delay;
  int delayC;
  
  PVector loc;
  PVector size;
  
  AnimatedGIF(int nf, String pre, String post) {
    
    numFrames = nf;
    loc = new PVector(width/2,height/2);
    size = new PVector(width, height);
    pics = new PImage[numFrames];
    
    delay = 3;
    
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre + i + post);  
      i ++;
    }
    currentFrame = 0;
    
  }
  
  AnimatedGIF(int nf, int _delay, String pre, String post) {
    
    numFrames = nf;
    loc = new PVector(width/2,height/2);
    size = new PVector(width, height);
    pics = new PImage[numFrames];
    
    delay = _delay;
    
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre + i + post);  
      i ++;
    }
    currentFrame = 0;
    
  }  
  
  
  void act() {
    
  }
  
  void show() {
    
    image(pics[currentFrame], loc.x, loc.y, size.x, size.y); 
    delayC ++;
    if (delayC == delay) {
      currentFrame ++;
      delayC = 0;
    }
    if (currentFrame == numFrames) currentFrame = 0;
    
  }
  
  void show(float x, float y, float w, float h) {
    
    image(pics[currentFrame], x, y, w, h); 
    delayC ++;
    if (delayC == delay) {
      currentFrame ++;
      delayC = 0;
    }
    if (currentFrame == numFrames) currentFrame = 0;  
    
  }
  
}
