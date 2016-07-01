Table adventure;
StringList countries = new StringList();

Table countryList;
int[] color1;
int[] color2;
int[] color3;

float r = 5;
float g = 27;
float b = 100;

PVector latMinMax;
PVector longMinMax;

StringList places = new StringList();
FloatList latitudes = new FloatList();
FloatList longitudes = new FloatList();

int counter = 0;

enum Mix {
  Tint,
  Shade,
  Tone
}

String country = "Thailand";

void setup() {
  //Set up canvas
  size(1600, 900);
  ellipseMode(CENTER);
  rectMode(CORNERS);  
  
  // Set up table
  adventure = loadTable("events.csv", "header");
  latMinMax = findMaxMin("Latitude", country);
  longMinMax = findMaxMin("Longitude", country);
  
  countryList = loadTable("countries.csv", "header");
  
  for (TableRow row : countryList.rows()) { 
    String checkCountry = row.getString("Place");
    
    if (checkCountry.equals(country)){
      String getColor1 = row.getString("Color1");
      color1 = convertColor(getColor1);
      println(color1);
      background(color1[0],color1[1],color1[2]);
      
      for (int i = 0; i < height; i++){
       stroke(255,50+random(-50,50));
       line(0,i,width,i);
      }
      
      if (row.getString("Color2") != ""){
        String getColor2 = row.getString("Color2");
        color2 = convertColor(getColor2);
        println(color2);
        
        fill(color2[0],color2[1],color2[2],100);
        noStroke();
        rect(0,0,width,height);
      }
      
      for (int i = 0; i < height; i++){
        stroke(255,20+random(-20,20));
        line(0,i,width,i);
      }
      
      if (row.getString("Color3") != ""){
        String getColor3 = row.getString("Color3");
        color3 = convertColor(getColor3);
        println(color3);
        
        fill(color3[0],color3[1],color3[2],50);
        noStroke();
        rect(0,0,width,height);
      }
    } 
  }
  //getCoords(country);
  //paintLayer();
} 

void draw(){
}

int[] convertColor (String countryColor){
  int[] getHexColors = new int[3];
  
  for (int i = 0; i < 3; i++){
    String cHex = countryColor.substring(i*2,(i*2)+2);
    int c = unhex(cHex);
    getHexColors[i] = c;
  }
  
  return getHexColors;
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
  fill(r, g, b, 20);
  
  for (int i = 0; i < places.size(); i++){
    //println(places.get(i));
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