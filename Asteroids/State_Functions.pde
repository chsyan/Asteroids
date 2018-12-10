void mainMenu() {
  background(0);
  // Text
  pushStyle();
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(50);
  text("Asteroids", width/2, height/2 - 100);
  textSize(25);
  text("Play", width/2, height/2 +50);
  text("Help", width/2, height/2 +100);
  text("Settings", width/2, height/2 + 150);

  // Menustates
  if (pressed[upKey] && menuState > MENU_PLAY) {
    menuState--;
    pressed[upKey] = false;
  } else if (pressed[downKey] && menuState < MENU_SETTINGS) {
    menuState++;
    pressed[downKey] = false;
  }


  noFill();
  stroke(255);
  rectMode(CENTER);
  if (menuState==MENU_PLAY) { 
    rect(width/2 -2, height/2 +52, 75, 50);
    if (pressed[spaceKey]) {
      state = PLAY;
      newLevel();
      resetPressed();
    }
  } else if (menuState==MENU_HELP) { 
    rect(width/2 -2, height/2 +102, 75, 50);
    if (pressed[spaceKey]) {
      state = HELP;
      resetPressed();
    }
  } else if (menuState==MENU_SETTINGS) { 
    rect(width/2 -2, height/2 + 152, 150, 50);
    if (pressed[spaceKey])
      state = SETTINGS;
    resetPressed();
  }
  popStyle();
}

void help() {
  background(0);
  pushStyle();
  noFill();
  stroke(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("HELP", width/2, height/2 - 175);
  rectMode(CENTER);
  //rect(width/2, height/2 - 35, 575, 200);
  textAlign(CORNER, CORNER);
  textSize(25);
  if (upKey == UP)
    text("Press 'UP ARROW' to accelerate", width/2-238, height/2 -100);
  else
    text("Press '" + upKey + "' to accelerate", width/2-238, height/2 -100);
  if (downKey == DOWN)
    text("Press 'DOWN ARROW' to deccelerate", width/2 -238, height/2-50);
  else
    text("Press '" + downKey + "' to deccelerate", width/2 -238, height/2-50);
  if (leftKey == LEFT || rightKey == RIGHT)
    text("Press 'LEFT ARROW' and 'RIGHT ARROW' to turn", width/2-238, height/2);
  else
    text("Press '" + leftKey + "' and '" + rightKey + "' to turn", width/2-238, height/2);
  if (spaceKey==' ')
    text("press 'Space' to shoot", width/2-238, height/2 + 50);
  else
    text("press '" + spaceKey + "' to shoot", width/2-238, height/2 + 50);
  text("Destroy asteroids to gain points", width/2-238, height/2+1000);
  textAlign(CENTER, CENTER);
  text("Press 'B' to return to the main menu", width/2, height/2+175);
  popStyle();

  for (int i=0; i<pressed.length; i++) {
    if (pressed['b'] == true) {
      state = MAINMENU;
      resetPressed();
      break;
    }
  }
}

void setting() {
  background(0);
  pushStyle();
  noFill();
  stroke(255);
  textSize(32);
  rectMode(CENTER);
  //rect(width/2, height/2 - 35, 300, 200);

  textAlign(CENTER, CENTER);
  text("Settings", width/2, height/2 - 175);

  textSize(25);
  textAlign(CORNER, CORNER);
  if (upKey == UP)
    text("Up: up arrow", width/2-125, height/2-100);
  else if (upKey ==LEFT)
    text("up: left arrow", width/2-125, height/2-100);
  else if (upKey == RIGHT)
    text("up: right arrow", width/2-125, height/2-100);
  else if (upKey == DOWN)
    text("Up: down arrow", width/2-125, height/2-100);
  else if (upKey == ' ')
    text("Up: space", width/2-125, height/2-100);
  else if (upKey == ENTER)
    text("Up: enter", width/2-125, height/2-100);
  else
    text("Up: " + char(upKey), width/2-125, height/2-100);
  if (leftKey == UP)
    text("Left: up arrow", width/2-125, height/2-50);
  else if (leftKey == LEFT)
    text("Left: left arrow", width/2-125, height/2-50);
  else if (leftKey == RIGHT)
    text("Left: right arrow", width/2-125, height/2-50);
  else if (leftKey == DOWN)
    text("Left: down arrow", width/2-125, height/2-50);
  else if (leftKey == ' ')
    text("Left: space", width/2-125, height/2-50);
  else if (leftKey == ENTER)
    text("Left: enter", width/2-125, height/2-50);
  else
    text("Left: " + char(leftKey), width/2-125, height/2 - 50);
  if (rightKey == UP)
    text("Right: up arrow", width/2-125, height/2);
  else if (rightKey == LEFT)
    text("Right: left arrow", width/2-125, height/2);
  else if (rightKey == RIGHT)
    text("Right: right arrow", width/2-125, height/2);
  else if (rightKey == DOWN)
    text("Right: down arrow", width/2-125, height/2);
  else if (rightKey == ' ')
    text("Right: space", width/2-125, height/2);
  else if (rightKey == ENTER)
    text("Right: ENTER", width/2-125, height/2);
  else
    text("Right: " + char(rightKey), width/2-125, height/2);
  if (downKey == UP)
    text("Down: up arrow", width/2-125, height/2+50);
  else if (downKey == LEFT)
    text("Down: left arrow", width/2-125, height/2+50);
  else if (downKey == RIGHT)
    text("Down: right arrow", width/2-125, height/2+50);
  else if (downKey == DOWN)
    text("Down: down arrow", width/2-125, height/2+50);
  else if (downKey == ' ')
    text("Down: space", width/2-125, height/2+50);
  else if (downKey == ENTER)
    text("Down: enter", width/2-125, height/2+50);
  else
    text("Down: " + char(downKey), width/2-125, height/2+50);
  if (spaceKey == UP)
    text("Shoot/Select: up arrow", width/2-125, height/2+100);
  else if (spaceKey == LEFT)
    text("Shoot/Select: left arrow", width/2-125, height/2+100);
  else if (spaceKey == RIGHT)
    text("Shoot/Select: right arrow", width/2-125, height/2+100);
  else if (spaceKey == DOWN)
    text("Shoot/Select: down arrow", width/2-125, height/2+100);
  else if (spaceKey == ' ')
    text("Shoot/Select: Space", width/2-125, height/2+100);
  else if (spaceKey == ENTER)
    text("Shoot/Select: enter", width/2-125, height/2+100);
  else 
  text("Shoot/select: " + char(spaceKey), width/2-125, height/2+100);

  textAlign(CENTER, CENTER);
  text("Press 'B' to return to main menu", width/2, height/2+150);
  popStyle();
  if (settingsSelected)
    stroke(255, 0, 0);
  else
    stroke(255);

  if (settingState == SETTINGS_UP) {
    line(width/2-135, height/2-120, width/2-135, height/2-100);
  }
  if (settingState == SETTINGS_LEFT) {
    line(width/2-135, height/2-70, width/2-135, height/2-50);
  }
  if (settingState == SETTINGS_RIGHT) {
    line(width/2-135, height/2-25, width/2-135, height/2);
  }
  if (settingState == SETTINGS_DOWN) {
    line(width/2-135, height/2+30, width/2-135, height/2+50);
  }
  if (settingState == SETTINGS_SPACE) {
    line(width/2-135, height/2+70, width/2-135, height/2+100);
  }

  if (pressed[spaceKey]) {
    settingsSelected = true;
    pressed[spaceKey] = false;
  }


  if (settingsSelected && pressedNotNull()) {
    if (settingState == SETTINGS_UP) {
      upKey = char(getPressedFirstTrue());
      pressed[upKey] = false;
      settingsSelected = false;
    }
    if (settingState == SETTINGS_LEFT) {
      leftKey = char(getPressedFirstTrue());
      pressed[leftKey] = false;
      settingsSelected = false;
    }
    if (settingState == SETTINGS_RIGHT) {
      rightKey = char(getPressedFirstTrue());
      pressed[rightKey] = false;
      settingsSelected = false;
    }
    if (settingState == SETTINGS_DOWN) {
      downKey = char(getPressedFirstTrue());
      pressed[downKey] = false;
      settingsSelected = false;
    }
    if (settingState == SETTINGS_SPACE) {
      spaceKey = char(getPressedFirstTrue());
      pressed[spaceKey] = false;
      settingsSelected = false;
    }
  } else {
    if (pressed[upKey] && settingState>0) {
      settingState--;
      pressed[upKey] = false;
      settingsSelected = false;
    }
    if (pressed[downKey] && settingState<SETTINGS_SPACE) {
      settingState++;
      pressed[downKey] = false;
      settingsSelected = false;
    }
  }

  for (int i=0; i<pressed.length; i++) {
    if (pressed['b'] == true) {
      state = MAINMENU;
      resetPressed();
      break;
    }
  }
}

void play() {
  background(0);

  int count = 0;
  for (int i=gameObjects.size()-1; i>=0; i--) {
    GameObject obj = gameObjects.get(i);
    if (obj instanceof Asteroid)
      count++;
    obj.display();
    obj.update();
    obj.sShake();
    if (obj.isDead()) {
      obj.dead();
      gameObjects.remove(i);
    }
  }

  if (count<=0) {
    level++;
    newLevel();
  }

  player.move(pressed, upKey, downKey, leftKey, rightKey, spaceKey);

  screenShake();
  Ui();
  checkOver();
}

void pause() {
  textAlign(CENTER, CENTER);
  fill(255);
  text("Paused", width/2, height/2);
}

void gameOver() {
  background(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(255);
  text("Game Over", width/2, height/2);
  textSize(25);
  text("Press any key to continue", width/2, height/2+50);

  for (int i=0; i<pressed.length; i++) {
    if (pressed[i]) {
      reset();
      for (int j=0; j<pressed.length; j++)
        pressed[i] = false;
      break;
    }
  }
}

void win() {
  background(0);
  textAlign(CENTER, CENTER);
  fill(255);
  text("You Win", width/2, height/2);
}
