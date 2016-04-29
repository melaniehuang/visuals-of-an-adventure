Table adventure;
String title;

void setup() {
  adventure = loadTable("adventure.csv", "header");
  
  fill(255,100);
  
  title = "Latitude";
  FloatList latitudes = findMaxMin(title);
  println(latitudes);
  
  title = "Longitude";
  FloatList longitudes = findMaxMin(title);
  println(longitudes);
  
  size(,720);
  background(44,48,255);
  
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
