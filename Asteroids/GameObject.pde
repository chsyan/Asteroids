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
