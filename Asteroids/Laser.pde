class Laser extends GameObject {

  Laser(PVector pos, PVector dir, int health) {
    speed = 20;
    this.position = pos;
    this.rotation = dir;
    velocity = dir.copy().mult(speed);
    this.hp = health;
    size = 5;
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotation.heading());

    fill(255, 0, 0);
    noStroke();
    ellipse(0, 0, size, size);

    popMatrix();
  }

  void update() {
    position.add(velocity.copy());
    hp--;

    checkCollision();
  }

  void checkCollision() {
    for (int k = gameObjects.size()-1; k>=0; k--) {
      GameObject o = gameObjects.get(k);
      if (o instanceof Asteroid) {
        PVector[] vertices = new PVector[3];
        vertices[0] = new PVector(this.size/2, 0).rotate(this.rotation.heading()).add(this.position.copy());
        vertices[1] = new PVector(-this.size/2, -this.size/2).rotate(this.rotation.heading()).add(this.position.copy());
        vertices[2] = new PVector(-this.size/2, this.size/2).rotate(this.rotation.heading()).add(this.position.copy());
        float[] asteroid_vertices = o.getVertices();
        for (int i=0; i<vertices.length; i++) {
          float x = vertices[i].copy().x;
          float y = vertices[i].copy().y;
          if (contains(x, y, asteroid_vertices)) {
            o.hp --;
            this.hp = 0;
            for (int j=0; j<5; j++) gameObjects.add(new Particle(position.copy(), PVector.random2D(), 
              new PVector(0, 0), 30, false, false));
            break;
          }
        }
      }
    }
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
