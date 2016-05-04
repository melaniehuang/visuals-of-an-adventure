Table adventure;
String title;

void setup() {
  adventure = loadTable("adventure.csv", "header");
  
  fill(255,100);
    
  title = "Latitude";
  FloatList latitudes = findMaxMin(title);
  println(latitudes);
  
  float latMin = latitudes.get(0);
  float latMax = latitudes.get(1);
  
  title = "Longitude";
  FloatList longitudes = findMaxMin(title);
  println(longitudes);
  
  float longMin = longitudes.get(0);
  float longMax = longitudes.get(1);
  
  size(1200,600);
  background(44,48,255);
  
  for (TableRow row : adventure.rows()) {    
    String goobley = row.getString("Type");
    
    // Note to self: To reference a String - if (goobley.equals("Attraction")){
    // I know that I want to eventually map values lat = 70,0 and long = -15,110
    
    float latitude = row.getFloat("Latitude");    
    latitude = map(latitude, latMin, latMax, 20, height-20); 
    
    float longitude = row.getFloat("Longitude");
    longitude = map(longitude, longMax, longMin, 20, width-20); 
    
    float elevation = row.getFloat("Elevation");
    //5m to 1078m
    
    noStroke();
    ellipse(longitude,latitude,10,10);
  }
}

FloatList findMaxMin(String rowTitle){
  FloatList values = new FloatList();
  
  for (TableRow row : adventure.rows()) {  
    float valNum = row.getFloat(rowTitle);
    values.append(valNum); 
  }
  
  FloatList minMax;
  minMax = new FloatList();
  
  float minNum = values.min();
  minMax.append(minNum);
  
  float maxNum = values.max();
  minMax.append(maxNum);

  return minMax;
}