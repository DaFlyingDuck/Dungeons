class AnimatedGIF {
  
  PImage[] pics;
  int numFrames;
  int currentFrame;
  
  PVector loc;
  PVector size;
  
  AnimatedGIF(int nf, String pre, String post) {
    
    numFrames = nf;
    loc = new PVector(width/2,height/2);
    size = new PVector(width, height);
    pics = new PImage[numFrames];
    
    
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre + i + post);  
      i ++;
    }
    currentFrame = 0;
    
  }
  
  AnimatedGIF(int nf, String pre, String post, float x, float y, float sizex, float sizey) {
    
    numFrames = nf;
    loc = new PVector(x,y);
    size = new PVector(sizex, sizey);
    pics = new PImage[numFrames];
    
    
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
    
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], loc.x, loc.y, size.x, size.y); 
    currentFrame ++;
    
  }
  
}
