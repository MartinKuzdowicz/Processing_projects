class Liquid {

  PVector location;
  float c;
  float liqWidth;
  float liqHeight;

  Liquid() {

    location = new PVector(0, height/2); 
    c = 0.1;
    liqWidth = width;
    liqHeight = height/2;
  }

  void display() {
    noStroke();
    fill(175);
    rect(location.x, location.y, liqWidth, liqHeight);
  }

  PVector drag(Mover m) {
    
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;

    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);

    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
}