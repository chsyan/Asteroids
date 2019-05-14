void keyPressed(KeyEvent e) {
  if (key==CODED)
    pressed[keyCode] = true;
  else pressed[key] = true;


  //println(String.valueOf(Character.getName(keyCode)));
}

void keyReleased() {
  if (key==CODED)
    pressed[keyCode] = false;
  else pressed[key] = false;
}
