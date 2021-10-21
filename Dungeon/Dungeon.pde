// Mode Framework
int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameover = 3;

// Mouse and Keyboard Variables
boolean mouseReleased;
boolean wasPressed;

boolean wkey, skey, akey, dkey, spacekey, shiftkey;

// Colours
color mentalAsylum1 = #443939;
color mentalAsylum2 = #302222;
color mentalAsylum3 = #473B2B;
color mentalAsylum4 = #5D360A;
color mentalAsylum5 = #6B5B45;

// Fonts
PFont dungeon;

AnimatedGIF introGIF;

Button startBut;

Hero myHero;

void setup() {
  
  rectMode(CENTER);
  
  size(800,600);
  mode = intro;
  
  dungeon = loadFont("LatinWide-48.vlw");
  
  introGIF = new AnimatedGIF(3, "frame_", "_delay-0.1s.gif"); 
  startBut = new Button("START", width/2, height/2, 250, 100, mentalAsylum5, mentalAsylum2, 30);

  myHero = new Hero();
  
}

void draw() {
  
  click();
  
  if(mode == intro) intro();
  if(mode == game) game();
  if(mode == pause) pause();
  if(mode == gameover) gameover();
  
  
  
}
