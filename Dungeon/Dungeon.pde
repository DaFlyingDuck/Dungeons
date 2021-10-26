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
color black = #000000;

// Fonts
PFont dungeon;

// Map
PImage map;
color nRoom, wRoom, eRoom, sRoom;

AnimatedGIF introGIF;

Button startBut;

ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Hero myHero;

void setup() {

  rectMode(CENTER);
  imageMode(CENTER);
  map = loadImage("map.png");

  size(800, 600);
  mode = intro;

  dungeon = loadFont("LatinWide-48.vlw");

  introGIF = new AnimatedGIF(3, "frame_", "_delay-0.1s.gif"); 
  startBut = new Button("START", width/2, height/2, 250, 100, mentalAsylum5, mentalAsylum2, 30);
  
  // Create Objects
  myObjects = new ArrayList<GameObject>();
  myHero = new Hero();
  myObjects.add(myHero);
  
  //Create Darkness
  darkness = new ArrayList<DarknessCell>(10000);
  float size = 100;
  for (int i = 0; i < 10000; i ++) {
    for(int j = 0; j < width / size; j ++) {   //messed up and replace later if not work
     if(i <= width/size * (j + 1) && i > width * j) darkness.add(new DarknessCell(i * size - size/2, size/2, size));
     if(i <= width/size * (j + 1) && i > width/size * (j + 1)) darkness.add(new DarknessCell((i - width/size * (j + 1)) * size - size/2, 3 * size/2, size));
     if(i <= width/size * (j + 1) && i > width/size * (j + 1)) darkness.add(new DarknessCell((i - width/size * (j + 1)) * size - size/2, 5 * size/2, size));
     if(i <= width/size * (j + 1) && i > width/size * (j + 1)) darkness.add(new DarknessCell((i - width/size * (j + 1)) * size - size/2, 7 * size/2, size));
     if(i <= width/size * (j + 1) && i > width/size * (j + 1)) darkness.add(new DarknessCell((i - width/size * (j + 1)) * size - size/2, 9 * size/2, size));
     if(i <= width/size * (j + 1) && i > width/size * (j + 1)) darkness.add(new DarknessCell((i - width/size * (j + 1)) * size - size/2, 11 * size/2, size));
   }
  
  }
  
}

void draw() {

  click();

  if (mode == intro) intro();
  if (mode == game) game();
  if (mode == pause) pause();
  if (mode == gameover) gameover();
}
