void setColors(String countryName){
  TableRow countryRow = countryList.findRow(countryName, "Place");
  
  String c1 = countryRow.getString("Color1");
  color1 = unhex(c1);
  
  String c2 = countryRow.getString("Color2");
  if (c2.equals("")){
    color2 = 230;
  } else {
    color2 = unhex(c2);
  }
  
  String c3 = countryRow.getString("Color3");  
  if (c3.equals("")){
    color3 = 230;
  } else {
    color3 = unhex(c3);
  }
}

void drawTest(int cx, int cy, int c1, int c2, int c3){
  fill(c1);
  rect(cx,cy,100,100);
  
  if (c2 != 0){
    fill(c2);
    rect(cx + 100,cy,100,100);
  }
  
  if (c3 != 0){
    fill(c3);
    rect(cx + 200,cy,100,100);
  }
}

//search table eventList
//if countryname matches, draw a rectangle particle that flashes at (long, lat)
PVector findMaxMin(String rowTitle, String countryName) {
  PVector minMax = new PVector(0, 0);
  FloatList values = new FloatList();
  
  for (TableRow row : eventList.rows()) {  
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

void getCoords(String countryName, int fillAlpha){
  for (TableRow countryRow : eventList.rows()) {  
    
    String selectCountry = countryRow.getString("Country");
    
    if (selectCountry.equals(countryName)){     
      float longitude = countryRow.getFloat("Longitude"); 
      longitude = map(longitude, longMinMax.x, longMinMax.y, 100, width-100);
      float latitude = countryRow.getFloat("Latitude");
      latitude = map(latitude, latMinMax.y, latMinMax.x, 100, height-100);
      noStroke();
      fill(255,fillAlpha);
      rect(0,longitude-5,width,10);
      rect(latitude-2,0,4,height);
    }
  }
}



void defaultStyles(){
  noStroke();
  noFill();
}