class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float mSize;

  int counter = 0;

  Mover() {
    location = new PVector(width/2, 50);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mSize = 50;
  }


  void display() {
    stroke(0);
    fill(230);
    ellipse(location.x, location.y, mSize, mSize);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void edges() {
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }


  void applayForce(PVector f) {
    acceleration.add(f);
  }

  boolean isInside(Liquid liq) {

    if (location.x > liq.location.x && location.y > liq.location.y && 
      location.x < liq.location.x+liq.liqWidth &&
      location.y < liq.location.y+liq.liqHeight) {

      return true;
    }

    return false;
  }
}