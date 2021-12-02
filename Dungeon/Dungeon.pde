// Mode Framework
int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameover = 3;

// Mouse and Keyboard Variables
boolean mouseReleased;
boolean wasPressed;

boolean wkey, skey, akey, dkey, pkey, spacekey, shiftkey;
boolean key1, key2, key3, key4, key5, key6, key7, key8, key9;

// Colours
color mentalAsylum1 = #443939;
color mentalAsylum2 = #302222;
color mentalAsylum3 = #473B2B;
color mentalAsylum4 = #5D360A;
color mentalAsylum5 = #6B5B45;
color mentalAsylum6 = #7DA027;
color black = #000000;
color white = #FFFFFF;

color red = #FF0000;
color green = #00FF00;
color blue = #0000FF;

// Fonts
PFont dungeon;

// Map
PImage map;
color nRoom, wRoom, eRoom, sRoom;

// Sprites
AnimatedGIF introGIF;
AnimatedGIF manUp;
AnimatedGIF manDown;
AnimatedGIF manLeft;
AnimatedGIF manRight;

AnimatedGIF healthPotion;
PImage rapidfire;
PImage damageboost;

// Start Button
Button startBut;

// XP Shop Buttons
Button Shop;


// Create Objects
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Hero myHero;



//Random Variables
final int BULLET_SIZE = 10;
final int SHOTGUN_BULLET_SIZE = 7;
final int SHOTGUN_BULLET_DMG = 2;

final int SNIPER_RELOAD = 100;
final int SNIPER_SPEED = 20;

final int PISTOL_RELOAD = 12;
final int PISTOL_SPEED = 3;

final int ICECREAM_RELOAD = 2;
final int ICECREAM_SPEED = 30;

final int SHOTGUN_RELOAD = 100;
final int SHOTGUN_SPEED = 6;

final int WWALL = 1;
final int EWALL = 2;
final int NWALL = 3;
final int SWALL = 4;

final int BULLET_EXPLOSION = 1;
final int HERO_BLOOD = 2;
final float HERO_BLOOD_SPEED = 3.3;

final int HERO_DMG_IMMUNE = 60;
final int HERO_SPWN_IMMUNE = 90;

// Upgradable Hero Attributes
final float HERO_LIVES_MAX = 160;
final float HERO_DMG_MULTIPLIER = 1;
final float HERO_DMG_MULTIPLIER_MAX = 2;
final float HERO_SPEED = 2;
final float HERO_SPEED_MAX = 4;

final float TURRET_BULLET_SPEED = 2.5;
final int TURRET_LIVES = 45;
final int TURRET_SIZE = 60;
final float FOLLOWER_SPEED = 1.5;
final int FOLLOWER_LIVES = 30;
final int FOLLOWER_SIZE = 50;
final int DUMMY_LIVES = 20;
final int DUMMY_SIZE = 50;



// Types of Dropped Items
final int HEALTH = 1;
final int RFIRE = 2;
final int DBOOST = 3;
final int SBOOST = 4;

int pTimer;



void setup() {
  
  rectMode(CENTER);
  imageMode(CENTER);
  map = loadImage("map.png");

  size(800, 600);
  mode = intro;

  dungeon = loadFont("LatinWide-48.vlw");

  // Load GIFs
  introGIF = new AnimatedGIF(3, "frame_", "_delay-0.1s.gif"); 
  
  // Hero GIFS
  manUp = new AnimatedGIF(4, 10, "man/up/sprite_", ".png");
  manDown = new AnimatedGIF(4, 10, "man/down/sprite_", ".png");
  manLeft = new AnimatedGIF(4, 10, "man/left/sprite_", ".png");
  manRight = new AnimatedGIF(4, 10, "man/right/sprite_", ".png");
  
  // Dropped Items GIFS
  healthPotion = new AnimatedGIF(4, 10, "items/health/_", ".png");
  rapidfire = loadImage("items/RapidFire/RapidFire.png");
  damageboost = loadImage("items/DamageBoost/DamageBoost.png");
  
  
  
  startBut = new Button("START", width/2, height/2, 250, 100, mentalAsylum5, mentalAsylum2, 30);
  
  // Create Objects
  myObjects = new ArrayList<GameObject>();
  myHero = new Hero();
  myObjects.add(myHero);
  
  //Create Darkness
  darkness = new ArrayList<DarknessCell>(10000);
  float size = 8;
  int numRow = 0, numCol = 0;
  for (int i = 0; i < 10000; i ++) {
    while (numRow <= width/size && numCol <= height/size) {
      //println(numRow, numCol);
      darkness.add(new DarknessCell(numRow * size + size/2, numCol * size + size/2, size));
      numRow ++;
      if (numRow > width/size) {
        numRow = 0;
        numCol ++;
      }
    }     
  }
  
  //Create Rooms and Load Enemies in Map
  int x = 0;
  int y = 0;

  while (y < map.height) {
    color roomC = map.get(x,y);
    if (roomC == green) {
      myObjects.add(new Dummy(x, y));
    }
    if (roomC == blue) {
      myObjects.add(new Turret(x,y));  
    }
    if (roomC == red) {
      myObjects.add(new Follower(x,y));
    }
    x ++;
    if (x == map.width) {
      x = 0;
      y ++;
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
