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



//Random Variables
int BULLET_SIZE = 10;
int SHOTGUN_BULLET_SIZE = 7;
int SHOTGUN_BULLET_DMG = 2;

int SNIPER_RELOAD = 100;
int SNIPER_SPEED = 20;

int PISTOL_RELOAD = 12;
int PISTOL_SPEED = 3;

int ICECREAM_RELOAD = 2;
int ICECREAM_SPEED = 30;

int SHOTGUN_RELOAD = 100;
int SHOTGUN_SPEED = 6;

int WWALL = 1;
int EWALL = 2;
int NWALL = 3;
int SWALL = 4;

int BULLET_EXPLOSION = 1;
int HERO_BLOOD = 2;
float HERO_BLOOD_SPEED = 3.3;

int HERO_DMG_IMMUNE = 60;
int HERO_SPWN_IMMUNE = 90;
float HERO_SPEED = 2;

float TURRET_BULLET_SPEED = 2.5;
float FOLLOWER_SPEED = 1.5;
int FOLLOWER_LIVES = 30;
int FOLLOWER_SIZE = 50;

int TURRET_LIVES = 45;
int TURRET_SIZE = 60;


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
  myObjects.add(new Follower(1, 2));
  myObjects.add(new Follower(2, 1));
  myObjects.add(new Turret(3,1));
  
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
