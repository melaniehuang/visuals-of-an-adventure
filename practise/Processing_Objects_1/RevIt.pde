class RevIt {
  //data  
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  //constructor
  RevIt(color tc, float txpos, float typos, float txspeed){
   c = tc;
   xpos = txpos;
   ypos = typos;
   xspeed = txspeed;
  }
  
  //functionality
  void display(){
   rectMode(CENTER);
   fill(c);
   rect(xpos, ypos, 20, 10);
  }

  void drive(){
   xpos = xpos + xspeed;
   if (xpos > width){
    xpos = 0;
   }
  }
}