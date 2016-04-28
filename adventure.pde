Table adventure;

void setup() {
  size(1280,720);
  background(44,48,255);
  
  adventure = loadTable("adventure.csv", "header");
  println(adventure.getRowCount() + " total rows in table"); 
  
  fill(255,100);
  
  for (TableRow row : adventure.rows()) {    
    //String goobley = row.getString("Type");
      //<>//
    float latitude = row.getFloat("Latitude");
    latitude = map(latitude, 70, 0, 0, height); 
    //12.534347 to 46.432896
    
    float longitude = row.getFloat("Longitude");
    longitude = map(longitude, -15, 110, 0, width); 
    //12.492231 to 100.99254
    
    float elevation = row.getFloat("Elevation");
    //5m to 1078m
    
    noStroke();
    ellipse(longitude,latitude,10,10);
    
    println(longitude + ", " + latitude + ", " + elevation + "m");
  }   
}