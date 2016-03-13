class Ball {

  float startX;
  float startY;
  float speedOfXMovement = random(-2, 2);
  float speedOfYMovement = random(-2, 2);

  float GRAVITY = 0.2;

  public Ball(float x, float y) {
    startX = x;
    startY = y;
  }


  void existAndBehave() {
    display();
    move();
    bounce();
    gravity();
  }

  void move() {

    startX += speedOfXMovement;
    startY += speedOfYMovement;
  }

  void bounce() {

    if (startX >= width || startX <= 0) {
      speedOfXMovement *= -1.0;
    }

    if (startY >= width || startY <= 0) {
      speedOfYMovement *= -1.0;
    }
  }

  void display() {

    ellipse(startX, startY, 20, 20);
  }

  void gravity() {


    speedOfYMovement += GRAVITY;
  }
}