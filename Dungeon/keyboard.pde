void keyPressed() {
  
  if (keyCode == 'W') wkey = true;
  if (keyCode == 'S') skey = true;
  if (keyCode == 'A') akey = true;
  if (keyCode == 'D') dkey = true;
  if (keyCode == ' ') spacekey = true;
  if (keyCode == SHIFT) shiftkey = true;
  
}

void keyReleased() {
  
  if (keyCode == 'W') wkey = false;
  if (keyCode == 'S') skey = false;
  if (keyCode == 'A') akey = false;
  if (keyCode == 'D') dkey = false;
  if (keyCode == ' ') spacekey = false;
  if (keyCode == SHIFT) shiftkey = false;
  
}
