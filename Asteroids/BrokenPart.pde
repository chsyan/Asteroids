class BrokenPart extends GameObject {

  color col;
  boolean isPlayer;

  BrokenPart(PVector position, color col, int size, boolean isPlayer) {
    hp = 255;
    speed = 1;
    this.size = size;
    this.col = col;
    this.position = position;
    this.rotation = new PVector(random(-1, 1), random(-1, 1));
    this.velocity = rotation.mult(speed);
    this.isPlayer = isPlayer;
  }

  void display() {
    pushMatrix();

    translate(position.x, position.y);
    rotate(rotation.heading());

    stroke(col, hp);
    line(0, 0, size/2, 0);
    popMatrix();
  }

  void update() {
    super.update(); 
    hp -= 2;
  }

  void dead() {
    if (shipDead && isPlayer) {
      newPlayer();
    }
  }
}
