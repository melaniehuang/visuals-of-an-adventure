RevIt hotWheels;
RevIt racingStripes;

void setup(){
  size(1000,100);
  background(#0000aa);
  hotWheels = new RevIt(color(255), width/2, height/2, 2.0);
  racingStripes = new RevIt(color(0), 0, height/2, 5.0);
}

void draw(){
  background(#0000aa);
  hotWheels.display();
  racingStripes.display();  

  if (hotWheels.xpos == racingStripes.xpos){
    racingStripes.xspeed = 0.0;
    racingStripes.xpos = 0.0;
    println("Totalllledddd it");
    hotWheels.drive();
    racingStripes.drive();
  } else {
    hotWheels.drive();
    racingStripes.drive();
    racingStripes.xspeed = 4.0;
  } 
}


 