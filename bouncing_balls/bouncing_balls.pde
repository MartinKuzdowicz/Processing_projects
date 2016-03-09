
Ball[] listOfBalls;

void setup() {
  
  size(800, 800);
  smooth();
 
  
  listOfBalls = new Ball[5];
  listOfBalls[0] = new Ball(200, 150);
  listOfBalls[1] = new Ball(300, 50);
  listOfBalls[2] = new Ball(200, 300);
  listOfBalls[3] = new Ball(400, 200);
  listOfBalls[4] = new Ball(500, 150);
  
}

void draw() {
  
   background(0);
   for (int i = 0; i < listOfBalls.length; i++) {
     listOfBalls[i].existAndBehave();
   }
  
}