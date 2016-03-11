 int xCoordStart = 25;
 int yCoordStart = 25;
 
 int xOffset = 120;
 int yOffset = 100;
 
 int drawCounter = 0;

void setup(){
  
  size(800,800);
  frameRate(30);
  
}

void draw() {
  
  background(0);

  for (int x = 1; x < 20; x++){
    for(int y = 1; y < 20; y++) {
      
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
  
  if(drawCounter < 40) {
    
     xCoordStart++;
    yCoordStart++;
    
  } else if (drawCounter > 40) {
    
     xCoordStart--;
     yCoordStart--;
    
  }
  
  if(drawCounter == 80) {
    
    drawCounter = 0;
    
  }

  
}