class Particle extends GameObject {

  Particle(PVector position, PVector rotation, PVector velocity, float inc, boolean left, boolean right) {

    hp = 255;
    size = 5;
    speed = random(2, 5);

    this.position = position.copy().sub(rotation.copy());
    this.rotation = rotation.rotate(PI + random(-PI/8, PI/8));
    if (left) rotation.rotate(-PI/7);
    if (right) rotation.rotate(PI/7);
    this.velocity = rotation.copy().mult(speed);
    this.velocity.add(velocity.copy());
    this.inc = inc;
  }

  void display() {
    pushMatrix();

    translate(position.x, position.y);
    rotate(rotation.heading());

    fill(255, 0, 0, hp);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, size, size);

    popMatrix();
  }

  void update() {
    super.update();
    hp -= inc;
  }
}
