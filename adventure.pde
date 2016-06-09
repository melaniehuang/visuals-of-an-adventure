Table adventure;
StringList countries = new StringList();

PVector latMinMax;
PVector longMinMax;

StringList places = new StringList();
FloatList latitudes = new FloatList();
FloatList longitudes = new FloatList();

float r = 5;
float g = 27;
float b = 72;

enum Mix {
  Tint,
  Shade,
  Tone
}

void setup() {
  //Set up canvas
  size(1600, 900);
  background(r,g,b);
  ellipseMode(CENTER);
  rectMode(CORNERS);
  
  // Set up table
  adventure = loadTable("adventure.csv", "header");
  latMinMax = findMaxMin("Latitude");
  longMinMax = findMaxMin("Longitude");

  getCoords("Country");
  paintLayer();
  
  getCoords("City");
  paintLayer();
  
  getCoords("Home");
  paintLayer();
  
  getCoords("Moment");
  paintLayer();
} 

void draw(){
}

PVector findMaxMin(String rowTitle) {
  PVector minMax = new PVector(0, 0);
  FloatList values = new FloatList();
  
  for (TableRow row : adventure.rows()) {  
    float valNum = row.getFloat(rowTitle);
    values.append(valNum);
  }
  
  minMax.x = values.min();
  minMax.y = values.max();
  return minMax;
}

void getCoords(String rowType){
  for (TableRow row : adventure.rows()) {  
    String checkCountryOrCity = row.getString("Type"); 
    
    if (checkCountryOrCity.equals(rowType)){
    //execute this
     String place = row.getString("Place"); 
     places.append(place);
     
     float latitude = row.getFloat("Latitude"); 
     latitude = map(latitude, latMinMax.x, latMinMax.y, 100, width-100);
     latitudes.append(latitude);
     
     float longitude = row.getFloat("Longitude");
     longitude = map(longitude, longMinMax.y, longMinMax.x, 100, height-100);
     longitudes.append(longitude);
    }
  }
}

void paintLayer(){
  noStroke();
  
  r = calcMix(r, 0.05, Mix.Tint);
  g = calcMix(g, 0.05, Mix.Tint);
  b = calcMix(b, 0.05, Mix.Tint);
  fill(r, g, b, 100);
  
  for (int i = 0; i < places.size(); i++){
    println(places.get(i));
    for (int r = 0; r < 400; r++) {   
      float lat2 = latitudes.get(i) + random(-1,1)*random(200,400);
      float long2 = longitudes.get(i) + random(-1,1)*random(50,100);
      rect(latitudes.get(i),longitudes.get(i),lat2,long2);
    }
  }
  places.clear();
  latitudes.clear();
  longitudes.clear();
}

float calcMix(float c, float amount, Mix mixType){
  switch (mixType) {
    case Tint:
      return c + (amount * (255 - c));  
    case Shade:
      return c * amount;
    case Tone:
      return 0;
    default:
      return 0;
  }
}

// Note to self: To reference a String - 
// String goobley = row.getString("Type"); 
// if (goobley.equals("Attraction")){
// x = latitude, y = longitude