Table countryList;
Table eventList;

String country = "Australia";
StringList countriesVisited = new StringList();

int color1, color2, color3;

PVector latMinMax, longMinMax;
FloatList latitudes = new FloatList();
FloatList longitudes = new FloatList();
int flashCount = 0;

void setup(){
  size(1600,900);
  background(230);
  
  countryList = loadTable("countries.csv", "header");
  for (TableRow cList : countryList.rows()) { 
    countriesVisited.append(cList.getString("Place"));
  }
  
  eventList = loadTable("events.csv", "header");
  defaultStyles();
  frameRate(10);
}

void draw(){  
  setColors(country);
  int[] colorList = { color1, color2, color3 };
  
  for (int c = 0; c < height; c++){
    int rIndex = int(random(0,3));  
    int colorSelected = colorList[rIndex];
    stroke(colorSelected,40);
    line(0,c,width,c);
  }
  
  latMinMax = findMaxMin("Latitude", country);
  longMinMax = findMaxMin("Longitude", country);
  flashCount++;
  if (flashCount % 2 == 0){
    getCoords(country, 0);
  } else {
    getCoords(country, 20);
  }
}

void mousePressed(){
  float randCountry = random(0,countriesVisited.size()-1);
  String countrySelected = countriesVisited.get(floor(randCountry));
  country = countrySelected;
  println(country);
}