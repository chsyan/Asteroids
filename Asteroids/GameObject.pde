abstract class GameObject {
  float hp, size, speed, alpha, inc;
  PVector position, rotation, velocity;
  float rmin, rmin2, rmax, rmax2;

  GameObject() {
  }

  void display() {
  }

  void update() {
    position.add(velocity.copy());
    if (position.x > width + size/2) position.x = -size/2;
    if (position.x < -size/2) position.x = width + size/2;
    if (position.y > height + size/2) position.y = -size/2;
    if (position.y < -size/2) position.y = height + size/2;
  }

  void sShake() {
    camOff += 0.5;
    //PVector shakeAmount = PVector.random2D();
    PVector shakeAmount = new PVector(noise(camOff), noise(1+camOff)).mult(random(-1, 1));
    float roll = radians(1) * sMag * noise(2+camOff) * random(-1, 1);
    shakeAmount.mult(sMag);
    position.add(shakeAmount);
    rotation.rotate(roll);
  }

  void dead() {
  }

  float[] getVertices() {
    return null;
  }

  boolean isDead() {
    return hp<=0;
  }
}
