// Mode Framework
int mode;
final int intro = 0;
final int game = 1;
final int pause = 2;
final int gameover = 3;

// Mouse and Keyboard Variables
boolean mouseReleased;
boolean wasPressed;
float scroll;

boolean wkey, skey, akey, dkey, pkey, spacekey, shiftkey;
boolean key1, key2, key3, key4, key5, key6, key7, key8, key9;

// Colours
color mentalAsylum1 = #443939;
color mentalAsylum2 = #302222;
color mentalAsylum3 = #473B2B;
color mentalAsylum4 = #5D360A;
color mentalAsylum5 = #6B5B45;
color mentalAsylum6 = #598901;
color mentalAsylum7 = #956524;
color dpink = #C45C90;
color lpink = #F0D8D8;
color black = #000000;
color white = #FFFFFF;

color lgrey = #898787;
color dgrey = #585858;
color red = #FF0000;
color green = #00FF00;
color blue = #0000FF;
color pink = #FF00FF;
color golden = #FFDC00;

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
PImage speedboost;

PImage sniperRifle;
PImage shotgun;
PImage pistol;

// Start Button
Button startBut;

// XP Shop Buttons
Button shopBut;
Button backBut;
Button hUpgBut;
Button dUpgBut;
Button sUpgBut;

//XP Shop 
int hUpgNum;
int dUpgNum;
int sUpgNum;

int hUpgCost;
int dUpgCost;
int sUpgCost;

final int lv2Upg = 1;
final int lv3Upg = 2;
final int lv4Upg = 5;
final int lv5Upg = 8;
final int lv6Upg = 12;



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
final float HERO_LIVES_TOP = 100;
final float HERO_LIVES_MAX = 200;
final float HERO_DMG_MULTIPLIER = 1;
final float HERO_DMG_MULTIPLIER_MAX = 2;
final float HERO_SPEED = 2;
final float HERO_SPEED_MAX = 4;


// Enemy Attributes
final int   BOSS_LIVES = 300;
final int   BOSS_SIZE = 75;
final int   BOSS_XP = 12;
final float BOSS_SPEED = 1;
final float BOSS_BULLET_SPEED = 2.5;

final int   SPAWNER_LIVES = 50;
final int   SPAWNER_SIZE = 60;
final int   SPAWNER_XP = 3;
final int   MINION_LIVES = 15;
final int   MINION_SIZE = 25;
final int   MINION_XP = 0;
final float MINION_SPEED = 1.75;
final float TURRET_BULLET_SPEED = 2.5;
final int   TURRET_LIVES = 45;
final int   TURRET_SIZE = 60;
final int   TURRET_XP = 3;
final float FOLLOWER_SPEED = 1.5;
final int   FOLLOWER_LIVES = 30;
final int   FOLLOWER_SIZE = 50;
final int   FOLLOWER_XP = 2;
final int   DUMMY_LIVES = 20;
final int   DUMMY_SIZE = 50;
final int   DUMMY_XP = 100;


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
  speedboost = loadImage("items/SpeedBoost/SpeedBoost.png");
  
  sniperRifle = loadImage("guns/sniperRifle.png");
  shotgun = loadImage("guns/shotgun.png");
  pistol = loadImage("guns/pistol.png");
  
  startBut = new Button("START", width/2, height/2, 250, 100, mentalAsylum5, mentalAsylum2, 30);
  shopBut = new Button("SHOP", 62, 119, 64, 15, dpink, lpink, 5);
  backBut = new Button("BACK", width/12, width/12, 70, 70, pink, lpink, 35);
  hUpgBut = new Button("+", width/2 + 150, height/2, 40, 40, mentalAsylum4, mentalAsylum7, 20);
  dUpgBut = new Button("+", width/2 + 150, height/2 + 80, 40, 40, mentalAsylum4, mentalAsylum7, 20);
  sUpgBut = new Button("+", width/2 + 150, height/2 + 160, 40, 40, mentalAsylum4, mentalAsylum7, 20);
  
  
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
    if (roomC == pink) {
      myObjects.add(new Spawner(x,y));
    }
    x ++;
    if (x == map.width) {
      x = 0;
      y ++;
    } 
  }
  
  myObjects.add(new Boss(8,6));
  
}

void draw() {

  click();

  if (mode == intro) intro();
  if (mode == game) game();
  if (mode == pause) pause();
  if (mode == gameover) gameover();
}
