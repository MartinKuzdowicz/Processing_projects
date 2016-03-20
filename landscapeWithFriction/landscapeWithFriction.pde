
BoxMover bMover;
Ground ground;
ObstacleWithFriction obstacle;

void setup() {

  size(830, 600);

  bMover = new BoxMover();
  ground = new Ground();
  obstacle = new ObstacleWithFriction();
}


void draw() {

  background(0);

  fill(255, 255, 0);
  ellipse(780, 50, 50, 50);

  ground.display();

  obstacle.display();

  PVector obstLoc = obstacle.location;

  bMover.display();
  bMover.update();

  PVector fuelForce = new PVector(0.001, 0);

  bMover.applayForce(fuelForce);
  bMover.behaveIfInVectorArea(obstLoc);
}