 int xCoordStart = 25;
 int yCoordStart = 25;
 
 int xOffset = 120;
 int yOffset = 100;
 
 int drawCounter = 0;

void setup(){
  
  size(1000,800);
  frameRate(10);
  smooth();
  
}

void draw() {
  
  background(255);
  stroke(0);
  
  for (int x = 1; x < 15; x++){
    for(int y = 1; y < 15; y++) {
      
      if(y % 5 == 0){
        fill(200, 150, 0);
      } else if (x % 5 == 0) {
        fill(140, 100, 50);
      } else  {
        fill(255, 0, 0);
      }
      
      rect((xCoordStart * x) + xOffset,(yCoordStart * y) + yOffset, 20,20);
    }
  }
  
  drawCounter++;
  
  if(drawCounter < 30) {
    
     xCoordStart++;
    yCoordStart++;
    
  } else if (drawCounter > 30) {
    
     xCoordStart--;
     yCoordStart--;
    
  }
  
  if(drawCounter == 60) {
    
    drawCounter = 0;
    
  }

  
}