Table adventure;
FloatList paintLatitudes;
FloatList paintLongitudes;
StringList countries = new StringList();

void setup() {
  size(1600, 900);
  background(#051b48);
  ellipseMode(CENTER);
  rectMode(CORNERS);
  adventure = loadTable("adventure.csv", "header");
} 

void draw(){
  for (int i = 0; i < 100; i++){
    compileLongLat();
  }
}

FloatList findMaxMin(String rowTitle) {
  FloatList values = new FloatList();
  FloatList minMax = new FloatList();
  
  for (TableRow row : adventure.rows()) {  
    float valNum = row.getFloat(rowTitle);
    values.append(valNum);
  }
  
  float minNum = values.min();
  minMax.append(minNum);
  float maxNum = values.max();
  minMax.append(maxNum);
  
  return minMax;
}

void compileLongLat(){
  FloatList latitudes = findMaxMin("Latitude");
  FloatList longitudes = findMaxMin("Longitude");

  for (TableRow row : adventure.rows()) {  
    float latitude = row.getFloat("Latitude");   
    latitude = map(latitude, latitudes.get(0), latitudes.get(1), 100, width-100); 
    float longitude = row.getFloat("Longitude");
    longitude = map(longitude, longitudes.get(1), longitudes.get(0), 100, height-100);
    
    String getType = row.getString("Type");
    if (getType.equals("Country")){
      String countryName = row.getString("Place");   
      countries.append(countryName);      
      println(countryName,latitude,longitude);
      
      fill(255);
      noStroke();
      ellipse(latitude,longitude,6,6);
      
      fill(255,10);
      float lat2 = latitude + random(-1,1)*random(300,500);
      float long2 = longitude + random(-1,1)*random(100,200);
      rect(latitude,longitude,lat2,long2);
    }
  }
}

    // Note to self: To reference a String - 
    // String goobley = row.getString("Type"); 
    // if (goobley.equals("Attraction")){
      
    // x = latitude, y = longitude
    
    // TO DO: Create multiple PVectors dynamically for each country