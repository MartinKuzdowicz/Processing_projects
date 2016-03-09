class Ball {

  int startX;
  int startY;
  int speedOfXMovement = 2;
  int speedOfYMovement = 6;
  
  public Ball(int x, int y) {
    startX = x;
    startY = y;
  }
  
  
  void existAndBehave() {
  display();
  move();
  bounce();
  
  }
  
  void move(){
     
    startX += speedOfXMovement;
    startY += speedOfYMovement;
    
  }
  
  void bounce() {
    
    if(startX >= width || startX <= 0) {
      speedOfXMovement *= -1;
    }
    
    if(startY >= width || startY <= 0) {
      speedOfYMovement *= -1;
    }
    
  }
  
  void display(){
   
    ellipse(startX, startY, 20, 20);
    
  }
  
}