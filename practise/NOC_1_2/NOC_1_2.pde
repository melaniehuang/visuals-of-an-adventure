int border = 50;
int repetitions = 5;
PVector rectSize = new PVector(100,100);
PVector origin  = new PVector(0,0);
int c = 0;

void setup() {
  size(800,800);
  rectMode(CORNER);
  noStroke();
  frameRate(10);
}

void draw() {
  
  background(#0000aa);

  for (int i=0; i<repetitions; i++){
    for (int n=0; n<repetitions; n++) {
      int x = (int) random(-5, 5); 
      int y = (int) random(-5, 5); 
      int c = (int) random (0,5);
      
      if (c < 1) {
        fill(255,200);
      } else {
        fill(255,50);
      }
              
      rect((width/2-(5*rectSize.x/2))+(rectSize.x*i)+origin.x, (height/2-(5*rectSize.y/2))+(rectSize.y*n)+origin.y, rectSize.x, rectSize.y);
    }
  }
}