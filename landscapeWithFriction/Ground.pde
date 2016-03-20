class Ground {

  PVector horizon;

  Ground() {
    horizon = new PVector(0, height/1.5);
  }


  void display() {

    fill(0, 255, 0);
    rect(horizon.x, horizon.y, width, horizon.y);
  }
}