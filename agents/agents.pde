import toxi.geom.*;

ArrayList listOfBalls = new ArrayList();

void setup() {

  size(800, 800);
  smooth();


  for (int i = 0; i < 100; i++) {
    Ball newBall = new Ball(new Vec3D(random(0, width), random(0, 400), 0));
    listOfBalls.add(newBall);
  }
}

void draw() {

  background(0);
  for (int i = 0; i < listOfBalls.size(); i++) {
    ((Ball) listOfBalls.get(i)).existAndBehave();
  }
}