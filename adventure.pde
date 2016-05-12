Table adventure;

void setup() {
  size(1600, 900);
  background(44, 48, 255);
  fill(255, 100);
  adventure = loadTable("adventure.csv", "header");
  compileLongLat();
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
    // Note to self: To reference a String - 
    // String goobley = row.getString("Type"); 
    // if (goobley.equals("Attraction")){
    
    fill(255);
    float latitude = row.getFloat("Latitude");   
    latitude = map(latitude, latitudes.get(0), latitudes.get(1), 100, width-100); 
    float longitude = row.getFloat("Longitude");
    longitude = map(longitude, longitudes.get(1), longitudes.get(0), 100, height-100); 

    noStroke();
    ellipse(latitude,longitude, 4, 4);
  }
}