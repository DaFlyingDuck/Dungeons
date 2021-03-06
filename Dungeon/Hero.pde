class Hero extends GameObject {


  Weapon myWeapon;
  int currentGun;
  Weapon[] myGuns;
  int immune;

  int xp;
  float livesTop;
  float livesMax;
  float dmg;
  float dmgMax;
  float speed;
  float speedMax;

  AnimatedGIF currentAction;
  int changeTimer;

  int sBoostC;
  float sBoost;

  Hero() {

    lives = 100;
    immune = 90;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    size = 30;
    roomX = 1;
    roomY = 1;

    livesTop = HERO_LIVES_TOP;
    livesMax = HERO_LIVES_MAX;
    dmg = HERO_DMG_MULTIPLIER;
    dmgMax = HERO_DMG_MULTIPLIER_MAX;
    speed = HERO_SPEED;
    speedMax = HERO_SPEED_MAX;

    currentAction = manDown;
    sBoostC = 0;
    sBoost = 1;

    myGuns = new Weapon[10];
    myGuns[1] = new SniperRifle();
    myGuns[2] = new AutoPistol();
    myGuns[3] = new shotgun();
    myGuns[4] = new icecream();
    myGuns[5] = new icecream();
    myGuns[6] = new icecream();
    myGuns[7] = new icecream();
    myGuns[8] = new icecream();
    myGuns[9] = new icecream();
    currentGun = 3;
  }

  void act() {

    super.act();

    // Change Guns
    if (key1) changeGun(1);
    if (key2) changeGun(2);
    if (key3) changeGun(3);
    if (key4) changeGun(4);
    if (key5) changeGun(5);
    if (key6) changeGun(6);
    if (key7) changeGun(7);
    if (key8) changeGun(8);
    if (key9) changeGun(9);
    
    changeTimer ++;
    if (scroll == 1 && currentGun != 3 && changeTimer > 30) {
      currentGun ++;
      changeTimer = 0;
    }
    if (scroll == 1 && currentGun == 3 && changeTimer > 30) { 
      currentGun = 1;
      changeTimer = 0;
    }
    if (scroll == -1 && currentGun != 1 && changeTimer > 30) { 
      currentGun --;
      changeTimer = 0;
    }
    if (scroll == -1 && currentGun == 1 && changeTimer > 30) {
      currentGun = 3;
      changeTimer = 0;
    }
    

    // Update and Shoot Gun
    myGuns[currentGun].update();
    if (mousePressed) myGuns[currentGun].shoot();

    //Movement Code
    sBoostC --;
    if (sBoostC > 0) {
      sBoost = 1.7;
    } else {
      sBoost = 1;
    }

    if (wkey) vel.y = -speed * sBoost;
    if (skey) vel.y = speed * sBoost;
    if (akey) vel.x = -speed * sBoost;
    if (dkey) vel.x = speed * sBoost;

    if ((wkey && akey) || (wkey && dkey) || (skey && akey) || (skey && dkey)) vel.setMag(speed * sBoost);

    if (!wkey && !skey) vel.y = vel.y * 0.85;
    if (!akey && !dkey) vel.x = vel.x * 0.85;

    if (abs(vel.x) < 0.001) vel.x = 0;
    if (abs(vel.y) < 0.001) vel.y = 0;

    if (abs(vel.y) >= abs(vel.x)) {
      if (vel.y >= 0) currentAction = manDown;
      else currentAction = manUp;
    } else {
      if (vel.x > 0) currentAction = manRight;
      else currentAction = manLeft;
    }

    // Border Walls
    if (loc.x < width/2 - 3 * width/8 + size/2) loc.x = width/2 - 3 * width/8 + size/2;
    if (loc.x > width/2 + 3 * width/8 - size/2) loc.x = width/2 + 3 * width/8 - size/2;
    if (loc.y < height/2 - 3 * height/8 + size/2)loc.y = height/2 - 3 * height/8 + size/2;
    if (loc.y > height/2 + 3 * height/8 - size/2)loc.y = height/2 + 3 * height/8 - size/2;

    // Collision with Enemies
    immune --;
    if (lives <= 0) {
      for (int j = 0; j < 100; j ++) myObjects.add(new Particles(loc.x, loc.y, HERO_BLOOD));
      mode = gameover;
    }

    //Collision with Dropped Items
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof DroppedItem && isCollidingWith(myObj)) {
        DroppedItem item = (DroppedItem) myObj;
        if (item.type == HEALTH) {
          lives = lives + item.healthType;
          if (lives > livesTop) lives = livesTop;
          item.lives = 0;
        } else if (item.type == RFIRE) {
          myGuns[currentGun].fireRateC = 600;
          item.lives = 0;
        } else if (item.type == DBOOST) {
          myGuns[currentGun].dBoostC = 600;
          item.lives = 0;
        } else if (item.type == SBOOST) {
          sBoostC = 600;
          item.lives = 0;
        }
        //print(item.type);
      }
      i ++;
    }


    // Collision With Doors
    if (nRoom != white && loc.y == height/2 - 3 * height/8 + size/2 && loc.x > width/2 - 50 && loc.x < width/2 + 50) {
      roomY --;
      loc = new PVector(width/2, height/2 + 3 * height/8 - size/2 - 10);
      
      cleanUp();
      
    }
    if (wRoom != white && loc.x == width/2 - 3 * width/8 + size/2 && loc.y > height/2 - 50 && loc.y < height/2 + 50) {
      if (roomX == 8 && roomY == 6 && bossBeat && !exitedBRoom) {
        
      } else {
        roomX --;
        loc = new PVector(width/2 + 3 * width/8 - size/2 - 10, height/2);
        cleanUp();
      }
      
    }
    if (sRoom != white && loc.y == height/2 + 3 * height/8 - size/2 && loc.x > width/2 - 50 && loc.x < width/2 + 50) {
      if (roomX == 8 && roomY == 6 && !bossBeat) {
        
      } else if (roomX == 8 && roomY == 6 && bossBeat) {
        exitedBRoom = true;
        roomY ++;
        loc = new PVector(width/2, height/2 - 3 * height/8 + size/2 + 10);
        cleanUp();
      } else {
        roomY ++;
        loc = new PVector(width/2, height/2 - 3 * height/8 + size/2 + 10);
        cleanUp();
      }
      
    }
    if (eRoom != white && loc.x == width/2 + 3 * width/8 - size/2 && loc.y > height/2 - 50 && loc.y < height/2 + 50) {
      roomX ++;
      loc = new PVector(width/2 - 3 * width/8 + size/2 + 10, height/2);

      cleanUp();
      
    }
  }

  void show() {

    // Show Hero
    stroke(mentalAsylum5);
    fill(mentalAsylum5);
    currentAction.show(loc.x, loc.y, size * 1.3, size * 1.5);

    // Show Health Bar
    rectMode(CORNER);
    noStroke();
    fill(red);
    rect(loc.x - 20, loc.y - 32, 40, 4, 7);
    fill(green);
    float z = map(lives, 0, livesTop, 0, 40);
    rect(loc.x - 20, loc.y - 32, z, 4, 7);
    rectMode(CENTER);
    strokeWeight(2);
    stroke(black);
    fill(black, 0);
    rect(loc.x, loc.y - 30, 40, 6, 7);
  }

  void changeGun(int g) {
    myGuns[g].fireRateC = myGuns[currentGun].fireRateC;
    myGuns[g].dBoostC = myGuns[currentGun].dBoostC;
    currentGun = g;
  }

  void cleanUp() {
    int r = 0;
    while (r < myObjects.size()) {
      GameObject myObj = myObjects.get(r);
      if (myObj instanceof Bullet || myObj instanceof Message) {
        myObj.lives = 0;
      }
      r ++;
    }
  }
  
  
}
