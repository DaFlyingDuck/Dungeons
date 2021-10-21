void game() {
  
  background(0);
  
  // Room Background
  noStroke();
  fill(mentalAsylum3);
  rect(width/2, height/2, width, height);
  
  //Room X cross lines
  strokeWeight(4);
  stroke(mentalAsylum2);
  line(0, height, width, 0);
  line(0, 0, width, height);
  
  // Room floor square
  stroke(mentalAsylum2);
  strokeWeight(5);
  fill(mentalAsylum3);
  rect(width/2, height/2, 3 * width/4, 3 * height/4);
  
  myHero.act();
  myHero.show();
  
}
