int border = 50;
int repetitions = 5;
PVector rectSize = new PVector(100,100);
PVector origin = new PVector(0,0);
int c = 0;

void setup() {
  size(800,800);
  rectMode(CORNER);
  noStroke();
  frameRate(0.5);
}

void draw() {
  
  background(240);

  for (int i=0; i<repetitions; i++){
    for (int n=0; n<repetitions; n++) {
      int x = (int) random(-5, 5); 
      int y = (int) random(-5, 5); 
      int c = (int) random (0,5);
      
      if (c < 1) {
        fill(22,213,236,200);
      } else {
        fill(217,40,73,200);
      }
              
      rect((width/2-(5*origin.x/2))+(origin.x*i)+rectSize.x, (height/2-(5*rectSize.y/2))+(rectSize.y*n)+origin.y, rectSize.x, rectSize.y);
    }
  }
}