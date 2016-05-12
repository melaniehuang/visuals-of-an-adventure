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

void compileLongLat(){
  FloatList latitudes = findMaxMin("Latitude");
  float latMin = latitudes.get(0);
  float latMax = latitudes.get(1);

  FloatList longitudes = findMaxMin("Longitude");
  float longMin = longitudes.get(0);
  float longMax = longitudes.get(1);

  for (TableRow row : adventure.rows()) {   
    fill(255);
    // Note to self: To reference a String - 
    // String goobley = row.getString("Type"); 
    // if (goobley.equals("Attraction")){
    float latitude = row.getFloat("Latitude");    
    latitude = map(latitude, latMin, latMax, 100, width-100); 

    float longitude = row.getFloat("Longitude");
    longitude = map(longitude, longMax, longMin, 100, height-100); 

    noStroke();
    ellipse(latitude,longitude, 4, 4);
    stroke(255);
    line(0,latitude,width,latitude);
    
    String placeName = row.getString("Place");
    println(placeName);
  }
}