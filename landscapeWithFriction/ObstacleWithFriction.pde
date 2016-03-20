class ObstacleWithFriction {

  PVector location;
  float widthSize;
  float heightSize;
  
  ObstacleWithFriction() {
    
    location = new PVector(520, height/1.5);
    widthSize = 150;
    heightSize = 20;
    
  }


  void display() {

    noStroke();
    fill(255, 0, 0);
    rect(location.x, location.y, widthSize, heightSize);
  }
}