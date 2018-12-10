class Player extends GameObject {

  float timeInvincible, rotSpeed, gunCd, gunThresh;

  Player() {
    position = new PVector(width/2, height/2);
    rotation = new PVector(0, -1);
    velocity = new PVector(0, 0);

    hp = 1;
    size = 30;
    speed = 0.1;

    alpha = 255;
    inc = -8;
    timeInvincible = 120;
    rotSpeed = PI/64;

    gunThresh = 10;
    gunCd = gunThresh;
    timeInvincible = 180;
  }

  void display() {
    pushMatrix();

    translate(position.x, position.y);
    rotate(rotation.heading());

    stroke(255, 0, 0, alpha);
    fill(0);
    beginShape();
    vertex(size/2, 0);
    vertex(-size/2, -size/2);
    vertex(-size/2, size/2);
    endShape(CLOSE);

    line(0, 0, size/2, 0);

    popMatrix();
  }

  void move(boolean[] pressed, int _upKey, int _downKey, int _leftKey, int _rightKey, int _spaceKey) {
    boolean up = pressed[_upKey];
    boolean down = pressed[_downKey];
    boolean left = pressed[_leftKey];
    boolean right = pressed[_rightKey];
    boolean space = pressed[_spaceKey];

    if (hp>0 && up) {
      velocity.add(rotation.copy().mult(speed));
      for (int i=0; i<10; i++)
        gameObjects.add(new Particle(position.copy(), rotation.copy(), velocity.copy(), 
          30, left, right));
    }

    if (down) {
      velocity.lerp(new PVector(0, 0), 0.01);
    }

    if (left) {
      rotation.rotate(-rotSpeed);
    }
    if (right) {
      rotation.rotate(rotSpeed);
    }

    if (hp > 0 && space && gunCd <= 0) {
      gunCd = gunThresh;
      shoot();
    }
    gunCd--;
  }

  void dead() {
    for (int i=0; i<3; i++) {
      gameObjects.add(new BrokenPart(position.copy(), color(255, 0, 0), 50, true));
    }
    shipDead = true;
    life--;
    for (int i=0; i<pressed.length; i++)
      pressed[i] = false;
  }

  void update() {
    super.update();
    velocity.lerp(new PVector(0, 0), 0.005);
    if (timeInvincible<=0) {
      collisions();
      alpha = 255;
    } else {
      alpha += inc;
      if (alpha>=255 || alpha<=50)
        inc *= -1;
    }
    timeInvincible--;
  }

  void shoot() {
    gameObjects.add(new Laser(position.copy(), rotation.copy().rotate(-PI/64), 70));
    gameObjects.add(new Laser(position.copy(), rotation.copy().rotate(PI/64), 70));
    gameObjects.add(new Laser(position.copy(), rotation.copy(), 70));
  }

  boolean collisions() {
    for (GameObject asteroid : gameObjects) {
      if (asteroid instanceof Asteroid) {

        PVector[] vertices = new PVector[3];
        vertices[0] = new PVector(this.size/2, 0).rotate(this.rotation.heading()).add(this.position.copy());
        vertices[1] = new PVector(-this.size/2, -this.size/2).rotate(this.rotation.heading()).add(this.position.copy());
        vertices[2] = new PVector(-this.size/2, this.size/2).rotate(this.rotation.heading()).add(this.position.copy());
        float[] asteroid_vertices = asteroid.getVertices();
        for (int i=0; i<vertices.length; i++) { 
          float x = vertices[i].copy().x;
          float y = vertices[i].copy().y;
          if (contains(x, y, asteroid_vertices)) {
            this.hp = 0;
            asteroid.hp = 0;
            trauma += 0.5;
          }
        }
      }
    }
    return false;
  }

  boolean contains(float x, float y, float[] v) {
    final float[] vertices = v; 
    final int numFloats = vertices.length;           
    int intersects = 0;                                

    for (int i = 0; i < numFloats; i += 2) {
      float x1 = vertices[i];                   
      float y1 = vertices[i + 1];               
      float x2 = vertices[(i + 2) % numFloats];  
      float y2 = vertices[(i + 3) % numFloats];   
      if (((y1 <= y && y < y2) || (y2 <= y && y < y1)) 
        && x < ((x2 - x1) / (y2 - y1) * (y - y1) + x1)) intersects++;
    }
    return (intersects & 1) == 1;
  }
}
