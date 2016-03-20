BoxMover bMover;

Ground ground;

void setup() {

  size(800, 600);

  bMover = new BoxMover();
  ground = new Ground();
}


void draw() {

  background(0);
  
  fill(255,255,0);
  ellipse(750, 50, 50,50);

  ground.display();

  bMover.display();
  bMover.update();

  PVector fuelForce = new PVector(0.001, 0);

  bMover.applayForce(fuelForce);
}