import toxi.geom.*;

class Ball {

  Vec3D loc;

  Vec3D speed = new Vec3D(random(-2, 2), random(-2, 2), 0);
  float GRAVITY = 0.2;
  Vec3D acceleration = new Vec3D();

  int MIN_DISTANCE_TO_LINE_CONNECTION = 80;
  int MIN_DISTANCE_TO_COHESION = 80;
  int MIN_DISTANCE_TO_SEPARATE = 80;
  
  int agentWidthAndHeight = 10;


  Ball(Vec3D loc) {
    this.loc = loc;
  }


  void existAndBehave() {
    display();
    move();
    bounce();
    lineBetween();
    flock();
  }

  void move() {

    speed.addSelf(acceleration);
    speed.limit(2);

    loc.addSelf(speed);

    acceleration.clear();
  }

  void bounce() {

    if (loc.x > width || loc.x < 0) {
      speed.x *= -1.0;
    }

    if (loc.y > width || loc.y < 0) {
      speed.y *= -1.0;
    }
  }

  void display() {
    ellipse(loc.x, loc.y, agentWidthAndHeight, agentWidthAndHeight);
  }

  void flock() {
    separate(5);
    cohesion(0.001);
    allign(0.1);
  }
  void allign(float forceTuning) {

    Vec3D steer = new Vec3D();
    int counter = 0;

    for (int i = 0; i < listOfBalls.size(); i++) {

      Ball currentBall = (Ball) listOfBalls.get(i);

      float distance = this.loc.distanceTo(currentBall.loc);

      if (distance > 0 && distance < 40) {

        steer.addSelf(currentBall.speed);
        counter++;

      }
    }
    if (counter >0) {

      //arithmetic average
      steer.scaleSelf(1.0/counter);
    }
    steer.scaleSelf(forceTuning);
    acceleration.addSelf(steer);
  }

  void cohesion(float forceTuning) {

    Vec3D sum = new Vec3D();
    int count = 0;
    for (int i = 0; i < listOfBalls.size(); i++) {

      Ball currentBall = (Ball) listOfBalls.get(i);
      float distance = this.loc.distanceTo(currentBall.loc);

      if (distance > 0 && distance < MIN_DISTANCE_TO_COHESION) {
        sum.addSelf(currentBall.loc);
        count++;
      }
    }

    if (count > 0) {

      //arithmetic average
      sum.scaleSelf(1.0/count);
    }

    Vec3D steer = sum.sub(this.loc);
    steer.scaleSelf(forceTuning);
    acceleration.addSelf(steer);
  }

  void separate(float tuningMagnitude) {

    Vec3D steer = new Vec3D();
    int separateCounter = 0;

    for (int i = 0; i < listOfBalls.size(); i++) {

      Ball currentBall = (Ball) listOfBalls.get(i);

      float distance = this.loc.distanceTo(currentBall.loc);

      if (distance > 0 && distance < MIN_DISTANCE_TO_SEPARATE) {

        Vec3D diff = this.loc.sub(currentBall.loc);
        diff.normalizeTo(1.0/distance);
        steer.addSelf(diff);
        separateCounter++;
      }
    }
    if (separateCounter >0) {

      //arithmetic average
      steer.scaleSelf(1.0/separateCounter);
    }
    steer.scaleSelf(tuningMagnitude);
    acceleration.addSelf(steer);
  }

  void lineBetween() {

    for (int i = 0; i < listOfBalls.size(); i++) {

      Ball currentBall = (Ball) listOfBalls.get(i);

      float distance = this.loc.distanceTo(currentBall.loc);

      if (distance > 0 && distance < MIN_DISTANCE_TO_LINE_CONNECTION) {

        stroke(0, 0, 230);
        line(this.loc.x, this.loc.y, currentBall.loc.x, currentBall.loc.y);
      }
    }
  }
}