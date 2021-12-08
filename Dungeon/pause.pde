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
  
  //make it so it only lets you buy if you have enough xp and make it so that it takes away xp
  
  // Hero Health Upgrade
  stroke(mentalAsylum4);
  fill(mentalAsylum7);
  textSize(30);
  text("Lv " + (hUpgNum + 2) + "Hero Health:", width/4 + 60, height/2);
  if (myHero.livesTop == myHero.livesMax || myHero.xp < hUpgCost) {
    hUpgBut.normal = lgrey;
    hUpgBut.highlight = dgrey;
    stroke(hUpgBut.highlight);
  }
  hUpgBut.show(50);
  if(mouseReleased && myHero.xp >= hUpgCost && hUpgNum < 6 && mouseX > hUpgBut.position.x - hUpgBut.w/2 && mouseX < hUpgBut.position.x + hUpgBut.w/2 && mouseY > hUpgBut.position.y - hUpgBut.h/2 && mouseY < hUpgBut.position.y + hUpgBut.h/2) {
    myHero.livesTop = myHero.livesTop + 20;
    if (myHero.livesTop > myHero.livesMax) {
      myHero.livesTop = myHero.livesMax;
    } else {
      hUpgNum ++;
      myHero.xp = myHero.xp - hUpgCost;
      if (hUpgCost == lv2Upg) {
        hUpgCost = lv3Upg;
      } else if (hUpgCost == lv3Upg) {
        hUpgCost = lv4Upg;
      } else if (hUpgCost == lv5Upg) {
        hUpgCost = lv6Upg;
      } else if (hUpgCost == lv6Upg) {
        hUpgCost = 1000;
      }
    }
  }
  
  // Damage Upgrade
  stroke(mentalAsylum4);
  fill(mentalAsylum7);
  textSize(30);
  text("Lv " + (dUpgNum + 2) + "Gun Damage:", width/4 + 60, height/2 + 80);
  if (myHero.dmg == myHero.dmgMax || myHero.xp < dUpgCost) {
    dUpgBut.normal = lgrey;
    dUpgBut.highlight = dgrey;
    stroke(dUpgBut.highlight);
  }
  dUpgBut.show(50);
  if(mouseReleased && myHero.xp >= dUpgCost  && dUpgNum < 6  && mouseX > dUpgBut.position.x - dUpgBut.w/2 && mouseX < dUpgBut.position.x + dUpgBut.w/2 && mouseY > dUpgBut.position.y - dUpgBut.h/2 && mouseY < dUpgBut.position.y + dUpgBut.h/2) {
    myHero.dmg = myHero.dmg + 0.2;
    if (myHero.dmg > myHero.dmgMax) {
      myHero.dmg = myHero.dmgMax;
    } else {
      dUpgNum ++;
      myHero.xp = myHero.xp - dUpgCost;
      if (dUpgCost == lv2Upg) {
        dUpgCost = lv3Upg;
      } else if (dUpgCost == lv3Upg) {
        dUpgCost = lv4Upg;
      } else if (dUpgCost == lv4Upg) {
        dUpgCost = lv5Upg;
      } else if (dUpgCost == lv5Upg) {
        dUpgCost = lv6Upg; 
      } else if (hUpgCost == lv6Upg) {
        dUpgCost = 1000;
      }
    }
  }
  
  // Speed Upgrade
  stroke(mentalAsylum4);
  fill(mentalAsylum7);
  textSize(30);
  text("Lv " + (sUpgNum + 2) + "Hero Speed:", width/4 + 60, height/2 + 160);
  if (myHero.speed == myHero.speedMax || myHero.xp < sUpgCost) {
    sUpgBut.normal = lgrey;
    sUpgBut.highlight = dgrey;
    stroke(sUpgBut.highlight);
  }
  sUpgBut.show(50);
  if(mouseReleased && myHero.xp >= sUpgCost && sUpgNum < 6  && mouseX > sUpgBut.position.x - sUpgBut.w/2 && mouseX < sUpgBut.position.x + sUpgBut.w/2 && mouseY > sUpgBut.position.y - sUpgBut.h/2 && mouseY < sUpgBut.position.y + sUpgBut.h/2) {
    myHero.speed= myHero.speed + 0.4;
    if (myHero.speed > myHero.speedMax) {
      myHero.speed = myHero.speedMax;
    } else {
      sUpgNum ++;
      myHero.xp = myHero.xp - sUpgCost;
      if (sUpgCost == lv2Upg) {
        sUpgCost = lv3Upg;
      } else if (sUpgCost == lv3Upg) {
        sUpgCost = lv4Upg;
      } else if (sUpgCost == lv4Upg) {
        sUpgCost = lv5Upg;
      } else if (sUpgCost == lv5Upg) {
        sUpgCost = lv6Upg;
      } else if (hUpgCost == lv6Upg) {
        sUpgCost = 1000;
      }
    }
  }
  
  
  
  
}
