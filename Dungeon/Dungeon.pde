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
boolean key1, key2, key3, key4, key5, key6, key7, key8, key9;

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
  myObjects.add(new Enemy());
  
  //Create Darkness
  darkness = new ArrayList<DarknessCell>(10000);
  float size = 8;
  int numRow = 0, numCol = 0;
  for (int i = 0; i < 10000; i ++) {
    while (numRow <= width/size && numCol <= height/size) {
      println(numRow, numCol);
      darkness.add(new DarknessCell(numRow * size + size/2, numCol * size + size/2, size));
      numRow ++;
      if (numRow > width/size) {
        numRow = 0;
        numCol ++;
      }
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
