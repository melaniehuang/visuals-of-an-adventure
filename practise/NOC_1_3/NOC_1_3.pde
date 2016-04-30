PVector origin;
PVector mouseVector;
PVector oppVector;

void setup(){
  size(1200, 600);
  background(#0000aa);
  origin = new PVector(width/2, height/2);
  stroke(255);
  strokeWeight(2);
}

void draw(){
  background(#0000aa);
  mouseVector = new PVector(mouseX, mouseY);
  oppVector = new PVector(mouseX, -mouseY);
  
  mouseVector.sub(origin);
  
  mouseVector.normalize();
  mouseVector.mult(200);
  
  oppVector.normalize();
  oppVector.mult(200);
  
  translate(width/2,height/2);
  line(0,0, mouseVector.x, mouseVector.y);
  line(mouseVector.x,mouseVector.y, oppVector.x, oppVector.y);
  
}