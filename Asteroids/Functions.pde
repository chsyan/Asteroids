void resetPressed() {
  for (int i=0; i<pressed.length; i++)
    pressed[i] = false;
}

int getPressedFirstTrue() {
  if (pressed[' ']) return int(' ');
  for (int i=0; i<pressed.length; i++) {
    if (pressed[i]) {
      return i;
    }
  }
  return 0;
}

boolean pressedNotNull() {
  for (int i=0; i<pressed.length; i++) {
    if (pressed[i]) return true;
  }
  return false;
}

void newLevel() {
  levelAlpha = 255;
  PVector tempPos = new PVector(random(width), random(height));
  for (int i=0; i<level; i++) 
    gameObjects.add(new Asteroid(tempPos, random(7, 12), true));
}

void screenShake() {
  if (trauma>1) 
    trauma = 1;
  if (trauma>0)
    trauma -= 0.03;
  screenShake = trauma * trauma;
  sMag = SMAGT * screenShake;
  if (trauma<0) {
    sMag = 0;
    trauma = 0;
  }

  camOff += 0.5;
  //PVector shakeAmount = PVector.random2D();
  PVector shakeAmount = new PVector(noise(camOff), noise(1+camOff)).mult(random(-1, 1));
  float roll = radians(1) * sMag * noise(2+camOff) * random(-1, 1);
  shakeAmount.mult(sMag);
  translate(shakeAmount.x, shakeAmount.y);
  rotate(roll);
}

void Ui() {
  textAlign(CORNER, CORNER);
  textSize(35);
  fill(255);
  text("Lives: " + life, 50, 75);
  text("Score: " + score, 50, 125);
  text("Highscore: " + highScore, 50, 175);
  if (score>highScore) highScore = score;

  textAlign(RIGHT, CORNER);
  text("Level: " + level, width-50, 75);

  //// Display trauma
  //noStroke();
  //rectMode(CORNER);
  //fill(100);
  //rect(50, 200, 25, height-250);
  //float ry = map(trauma, 0, 1, 0, height-250);
  //fill(#FF5F24);
  //rect(50, height-50-ry, 25, ry);

  //// Display screenshake
  //fill(100);
  //rect(100, 200, 25, height-250);
  //ry = map(screenShake, 0, 1, 0, height-250);
  //fill(#249EFF);
  //rect(100, height-50-ry, 25, ry);
}

void checkOver() {
  if (life <= 0) {
    state = GAMEOVER;
  }
}

void newPlayer() {
  player = new Player();
  gameObjects.add(player);
  shipDead = false;
}

void reset() {
  state = MAINMENU;

  for (int i=gameObjects.size()-1; i>=0; i--)
    gameObjects.remove(i);

  player = new Player();
  gameObjects.add(player);

  if (score>highScore)
    highScore = score;
  score = 0;
  life = 3;
}
