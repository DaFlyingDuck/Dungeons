class Particles extends GameObject {
  
 float t;
 int wall; 
 // 1 = West Wall, 2 = East Wall, 3 = North Wall, 4 = South Wall
 int c; 
 // 1 = Grey Bullet Explosion 2 = Red Hero Blood
  
 Particles(float j, float k, int _wall, int _c) {
   
   roomX = myHero.roomX;
   roomY = myHero.roomY;
   lives = 1;
   t = random(255,355);
   size = int(random(3,7));
   loc = new PVector(j, k);
   wall = _wall;   
   if (wall == 1) vel = new PVector(random(.5,3), random(-3,3));
   if (wall == 2) vel = new PVector(random(-3,-.5), random(-3,3));
   if (wall == 3) vel = new PVector(random(-3,3), random(.5,3));
   if (wall == 4) vel = new PVector(random(-3,3), random(-3,-.5));
   
   c = _c;
   
 }
 
  Particles(float j, float k, int _c) {
   
   roomX = myHero.roomX;
   roomY = myHero.roomY;
   lives = 1;
   t = random(255,355);
   size = int(random(3,7));
   loc = new PVector(j, k);
   vel = new PVector(random(-3,3), random(-3,3));
   if (vel.mag() > HERO_BLOOD_SPEED) {
     vel.setMag(HERO_BLOOD_SPEED);
   }
   
   c = _c;
   
 }

  
 void act() {
   
   loc.add(vel);
   t = t - 4;
   if (t <= 0) lives = 0;

 }
 
 void show() {
   
   if (c == BULLET_EXPLOSION) {
     fill(180, 180, 180, t);
     noStroke();
     square(loc.x, loc.y, size);
   }
   
   if (c == HERO_BLOOD) {
     fill(222, 9, 9, t);
     noStroke();
     square(loc.x, loc.y, size);   
   }
   
 }
  
}
