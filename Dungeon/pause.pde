void pause() {
  
  pTimer --;
  if (pkey && pTimer < 0) {
    mode = game;
    pTimer = 10;
  }
  
  background(mentalAsylum6);
  
  // Shop Title
  stroke(mentalAsylum4);
  fill(mentalAsylum4);
  textFont(dungeon);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("Upgrade Shop", width/2, height/4);
  
  // Back Button
  backBut.show(10);
  if(mouseReleased && mouseX > backBut.position.x - backBut.w/2 && mouseX < backBut.position.x + backBut.w/2 && mouseY > backBut.position.y - backBut.h/2 && mouseY < backBut.position.y + backBut.h/2) {
    mode = game;
  }
  
  make it so it only lets you buy if you have enough xp and make it so that it takes away xp
  
  // Hero Health Upgrade
  stroke(mentalAsylum4);
  fill(mentalAsylum7);
  textSize(30);
  text("Hero Health:", width/4 + 60, height/2);
  if (myHero.livesTop == myHero.livesMax || myHero.xp < hUpgCost) {
    hUpgBut.normal = lgrey;
    hUpgBut.highlight = dgrey;
    stroke(hUpgBut.highlight);
  }
  hUpgBut.show(50);
  if(mouseReleased && myHero.xp >= hUpgCost && mouseX > hUpgBut.position.x - hUpgBut.w/2 && mouseX < hUpgBut.position.x + hUpgBut.w/2 && mouseY > hUpgBut.position.y - hUpgBut.h/2 && mouseY < hUpgBut.position.y + hUpgBut.h/2) {
    myHero.livesTop = myHero.livesTop + 20;
    if (myHero.livesTop > myHero.livesMax) {
      myHero.livesTop = myHero.livesMax;
    } else {
      subtract upgcost and increase it and incerase upgnum
      hUpgNum ++;
    }
  }
  
  // Damage Upgrade
  stroke(mentalAsylum4);
  fill(mentalAsylum7);
  textSize(30);
  text("Gun Damage:", width/4 + 60, height/2 + 80);
  if (myHero.dmg == myHero.dmgMax) {
    dUpgBut.normal = lgrey;
    dUpgBut.highlight = dgrey;
    stroke(dUpgBut.highlight);
  }
  dUpgBut.show(50);
  if(mouseReleased && mouseX > dUpgBut.position.x - dUpgBut.w/2 && mouseX < dUpgBut.position.x + dUpgBut.w/2 && mouseY > dUpgBut.position.y - dUpgBut.h/2 && mouseY < dUpgBut.position.y + dUpgBut.h/2) {
    myHero.dmg = myHero.dmg + 0.2;
    if (myHero.dmg > myHero.dmgMax) {
      myHero.dmg = myHero.dmgMax;
    } else {
      dUpgNum ++;
    }
  }
  
  // Speed Upgrade
  stroke(mentalAsylum4);
  fill(mentalAsylum7);
  textSize(30);
  text("Hero Speed:", width/4 + 60, height/2 + 160);
  if (myHero.speed == myHero.speedMax) {
    sUpgBut.normal = lgrey;
    sUpgBut.highlight = dgrey;
    stroke(sUpgBut.highlight);
  }
  sUpgBut.show(50);
  if(mouseReleased && mouseX > sUpgBut.position.x - sUpgBut.w/2 && mouseX < sUpgBut.position.x + sUpgBut.w/2 && mouseY > sUpgBut.position.y - sUpgBut.h/2 && mouseY < sUpgBut.position.y + sUpgBut.h/2) {
    myHero.speed= myHero.speed + 0.4;
    if (myHero.speed > myHero.speedMax) {
      myHero.speed = myHero.speedMax;
    } else {
      sUpgNum ++;
    }
  }
  
  
  
  
}
