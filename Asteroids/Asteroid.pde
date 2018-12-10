class Asteroid extends GameObject {

  float r, speed, offMax;
  int v;
  float[] off;

  Asteroid(PVector position, float r, boolean isNew) {
    speed = random(1.5, 2.5) * level;
    this.position = position.copy();
    this.r = r;
    if (isNew) {
      position = new PVector(random(width), random(height));
      this.r = int(random(7, 12));
      while (PVector.dist(position.copy(), player.position.copy()) < 200)
        position = new PVector(random(width), random(height));
    }
    this.rotation = PVector.random2D();
    this.velocity = rotation.copy().mult(speed);

    size = r*12;
    v = int(random(5, 10));
    off = new float[v];
    offMax = 0;
    for (int i=0; i<v; i++) {
      off[i] = random(-r*3, r*3);
      offMax = max(off[i], offMax);
    }

    rmin = this.size + min(this.off);
    rmin2 = this.rmin * this.rmin;
    rmax = this.size + max(this.off);
    rmax2 = this.rmax * this.rmax;
    hp = r/2;
  }

  void display() {
    pushMatrix();

    translate(this.position.x, this.position.y);
    noFill();
    stroke(255);

    beginShape();
    for (int i=0; i<v; i++) {
      float angle = map(i, 0, v, 0, 2*PI);
      float x = (off[i] + size) * cos(angle);
      float y = (off[i] + size) * sin(angle);
      vertex(x, y);
    }
    endShape(CLOSE);

    popMatrix();
  }

  void update() {
    float bit = offMax + size/2;
    position.add(velocity.copy());
    if (position.x > width + size/2 + bit) position.x = -size/2;
    if (position.x < -size/2 - bit) position.x = width + size/2;
    if (position.y > height + size/2 + bit) position.y = -size/2;
    if (position.y < -size/2 - bit) position.y = height + size/2;
  }

  void dead() {
    score += r*10;
    trauma += 0.7;
    for (int j=0; j<v/2; j++) { 
      gameObjects.add(new BrokenPart(position.copy(), color(255, 255, 255), int(random(size-10, size+20)), false));
    }
    if (r>3)
      for (int i=0; i<2; i++) gameObjects.add(new Asteroid(position.copy(), r-2, false));
  }

  float[] getVertices() {
    float[] vert = new float[v*2];
    for (int i=0; i<v; i++) {
      float angle = map(i, 0, v, 0, 2*PI);
      float x = (off[i] + size) * cos(angle);
      float y = (off[i] + size) * sin(angle);
      vert[i*2] = x + position.copy().x;
      vert[i*2+1] = y + position.copy().y;
    }
    return vert;
  }
}
