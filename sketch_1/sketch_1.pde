
void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  
  background(0);
  
  for(int i = 0; i < 15; i++){
   
      for(int j = 0; j < 20; j++){
        
        float randomRed = (float) Math.random()* 100 + 50;
        
        float randomGreen = (float) Math.random()* 100 + 30;
        
        if(j % 2 == 0 ){
          
           drawEllipse((i * 30)+190, (j * 30) + 110, randomRed, randomGreen);
          
          
        } else if(j % 3 == 0 ) {
          
           drawEllipse((i * 30)+130, (j * 30) + 110, randomRed);
          
        } else {
          
          drawEllipse((i * 30)+130, (j * 30) + 110, randomRed, randomGreen, 200);
          
        }
      }
     
  }
       
}

void drawEllipse(float x, float y, float r){
  
  fill(r,0,0);
  ellipse(x, y, 20, 20);
}

void drawEllipse(float x, float y, float r, float g){
  
  fill(r,g,0);
  ellipse(x, y, 20, 20);
}

void drawEllipse(float x, float y, float r, float g, float b){
  
  fill(r,g,b);
  ellipse(x, y, 20, 20);
}