
Liquid liquid;

Mover m;

void setup() {

  size(600, 600);
  smooth();
  background(255);
  liquid = new Liquid();
  m = new Mover();
}

void draw() {

  background(255);
  liquid.display();

  m.display();
  m.update();
  m.edges();

  PVector gravityForce = new PVector(0.0, 0.1);

  m.applayForce(gravityForce);

  if (m.isInside(liquid)) {
    m.applayForce(liquid.drag(m));
  }
}