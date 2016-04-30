PVector location = new PVector(100,100);
PVector velocity = new PVector(2,5.2);
int ballSize = 20;
 
void setup() {
  size(640,360);
  background(#0000aa);
  noStroke();
}
 
void draw() {
  background(#0000aa);
  
  location.add(velocity);
 
  fill(255);
  
  if ((location.x > width - ballSize/2) || (location.x < ballSize/2)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height - ballSize/2) || (location.y < ballSize/2)) {
    velocity.y = velocity.y * -1;
  }

  ellipse(location.x,location.y,ballSize,ballSize);
}