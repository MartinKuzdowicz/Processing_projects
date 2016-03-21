class BoxMover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  PVector friction;

  float size;

  BoxMover() {

    size = 50;
    location = new PVector(0, height/1.5-size);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }


  void update() {
    velocity.add(acceleration);
    velocity.limit(8);
    location.add(velocity);

    comeBackWhenDisepare();
  }

  void applayForce(PVector f) {

    acceleration.add(f);
  }

  void display() {
    fill(255, 100, 0);
    rect(location.x, location.y, size, size);
  }

  void comeBackWhenDisepare() {

    if (location.x > width) {
      location.x = 0;
      velocity.mult(0);
      acceleration.mult(0);
    }
  }

  void behaveIfInVectorArea(PVector vec) {

    if (location.x >= vec.x && location.x <= vec.mag()) {

      firctionBehavor();
    }
  }


  void firctionBehavor() {

    friction = velocity.copy();
    friction.normalize();
    friction.mult(-1);
    float c = 0.02;
    friction.mult(c);
    applayForce(friction);
  }
}