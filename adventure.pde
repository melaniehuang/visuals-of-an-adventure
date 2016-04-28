Table adventure;

FloatList longitudes;
FloatList latitudes;

String title;

void setup() {
  size(1280,720);
  background(44,48,255);
  
  adventure = loadTable("adventure.csv", "header");
  println(adventure.getRowCount() + " total rows in table"); 
  
  fill(255,100);
  
  title = "Latitude";
  FloatList latitudes = new FloatList();
  latitudes = findMaxMin(latitudes, title);
  println(latitudes);
  
  title = "Longitude";
  FloatList longitudes = new FloatList();
  longitudes = findMaxMin(longitudes, title);
  println(longitudes);
  
  for (TableRow row : adventure.rows()) {    
    String goobley = row.getString("Type");
    
//    if (goobley.equals("Attraction")){
    
    float latitude = row.getFloat("Latitude");    
    latitude = map(latitude, 70, 0, 0, height); 
    
    float longitude = row.getFloat("Longitude");
    longitude = map(longitude, -15, 110, 0, width); 
    
    float elevation = row.getFloat("Elevation");
    //5m to 1078m
    
    noStroke();
    ellipse(longitude,latitude,10,10);
    
  }   
}

FloatList findMaxMin(FloatList longOrLat, String rowTitle){
  longOrLat = new FloatList();
  
  for (TableRow row : adventure.rows()) {  
    float latlongNum = row.getFloat(rowTitle);
    longOrLat.append(latlongNum); 
  }
  
  FloatList minMax;
  minMax = new FloatList();
  
  float minNum = longOrLat.min();
  minMax.append(minNum);
  
  float maxNum = longOrLat.max();
  minMax.append(maxNum);

  return minMax;
}
