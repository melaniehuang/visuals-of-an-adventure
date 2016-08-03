String country = "Australia";

Table countryList;
int[] color1, color2, color3 = new int[3];
float r,g,b;
PFont font;

Table adventure;
StringList countries = new StringList();
PVector latMinMax, longMinMax;
StringList places = new StringList();
FloatList latitudes = new FloatList();
FloatList longitudes = new FloatList();

void setup() {
  //Set up canvas
  size(1600, 900);
  ellipseMode(CENTER);
  rectMode(CORNER);  
  
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
      
      r = color1[0];
      g = color1[1];
      b = color1[2];
      background(r,g,b);
      
      for (int i = 0; i < height; i++){
       stroke(255,50+random(-50,50));
       line(0,i,width,i);
      }

      if (!row.getString("Color2").equals("")){
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
      
      if (!row.getString("Color3").equals("")){
        String getColor3 = row.getString("Color3");
        color3 = convertColor(getColor3);
        println(color3);
        
        fill(color3[0],color3[1],color3[2],50);
        noStroke();
        rect(0,0,width,height);
      }
    } 
  }
  
  font = loadFont("TitilliumWeb-Regular-32.vlw");
  fill(255);
  textAlign(RIGHT);
  textFont(font,22);
  //text(country, width-50, height - 50); 

  getCoords(country);
  paintLayer();
} 

void draw(){  
}

int[] convertColor (String countryColor){
  int[] getHexColors = new int[3];
  
  for (int i = 0; i < 3; i++){
    String cHex = countryColor.substring(i*2,2+(i*2));
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
    
  for (int i = 0; i < places.size(); i++){
    color p = get(int(longitudes.get(i)), int(latitudes.get(i)));
    fill(p,100);
    rect(longitudes.get(i), latitudes.get(i),width,20);
  }
  places.clear();
  latitudes.clear();
  longitudes.clear();
}