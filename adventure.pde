Table adventure;
String title;

void setup() {
  adventure = loadTable("adventure.csv", "header");

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

  size(1600, 900);
  background(44, 48, 255);
  fill(255, 100);
  
  StringList countryList;
  countryList = new StringList();

  for (TableRow row : adventure.rows()) {    
    fill(255, 100);
    // Note to self: To reference a String - 
    // String goobley = row.getString("Type"); 
    // if (goobley.equals("Attraction")){
    // I know that I probably want to eventually map values lat = 70,0 and long = -15,110
    
    float latitude = row.getFloat("Latitude");    
    latitude = map(latitude, latMin, latMax, 100, width-100); 

    float longitude = row.getFloat("Longitude");
    longitude = map(longitude, longMax, longMin, 100, height-100); 

    float elevation = row.getFloat("Elevation");
    //5m to 1078m

    noStroke();
    ellipse(latitude,longitude, 8, 8);
    
    String type = row.getString("Type"); 
    String placeName = row.getString("Place"); 
    
    if (type.equals("Country")){
       countryList.append(placeName);
       fill(255,60);
       textAlign(CENTER, CENTER);
       textSize(28);
       text(placeName, latitude, longitude-30);
    }
    println(countryList);
  }
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