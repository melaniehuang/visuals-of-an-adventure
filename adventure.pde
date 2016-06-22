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

String country = "Slovenia";

void setup() {
  //Set up canvas
  size(1600, 900);
  background(r,g,b);
  ellipseMode(CENTER);
  rectMode(CORNERS);  
  
  // Set up table
  adventure = loadTable("events.csv", "header");
  latMinMax = findMaxMin("Latitude", country);
  longMinMax = findMaxMin("Longitude", country);
  
  getCoords(country);
  paintLayer();
} 

void draw(){
}

PVector findMaxMin(String rowTitle, String countryName) {
  PVector minMax = new PVector(0, 0);
  FloatList values = new FloatList();
  
  for (TableRow row : adventure.rows()) {  
    String selectCountry = row.getString("Country");
 
    if (selectCountry.equals(countryName)){   
      float valNum = row.getFloat(rowTitle);
      values.append(valNum);
    }
  }
  
  minMax.x = values.min();
  minMax.y = values.max();
  
  return minMax;
}

void getCoords(String countryName){
  for (TableRow row : adventure.rows()) {  
    String selectCountry = row.getString("Country"); 
    
    if (selectCountry.equals(countryName)){
    //execute this
     String place = row.getString("Place"); 
     places.append(place);
     
     float longitude = row.getFloat("Longitude"); 
     longitude = map(longitude, longMinMax.x, longMinMax.y, 100, width-100);
     longitudes.append(longitude);
     
     float latitude = row.getFloat("Latitude");
     latitude = map(latitude, latMinMax.y, latMinMax.x, 100, height-100);
     latitudes.append(latitude);
    }
  }
}

void paintLayer(){
  noStroke();
  
  r = calcMix(r, 0.10, Mix.Tint);
  g = calcMix(g, 0.10, Mix.Tint);
  b = calcMix(b, 0.10, Mix.Tint);
  fill(r, g, b, 100);
  
  for (int i = 0; i < places.size(); i++){
    println(places.get(i));
    for (int r = 0; r < 400; r++) {   
      float long2 = longitudes.get(i) + random(-1,1)*random(200,400);
      float lat2 = latitudes.get(i) + random(-1,1)*random(50,100);
      rect(longitudes.get(i),latitudes.get(i),long2,lat2);
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