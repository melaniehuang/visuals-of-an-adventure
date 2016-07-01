/*

- TODO: ADD COUNTRY SIZE CONTEXT
- Population size
- Country shape etc.

- TODO: DYNAMIC COLOUR TINT AND SHADE

DECLARE ENUM
enum Mix {
Tint,
Shade,
Tone
}

ADD THIS TO PAINTLAYER
r = calcMix(r, 0.05, Mix.Tint);
g = calcMix(g, 0.05, Mix.Tint);
b = calcMix(b, 0.05, Mix.Tint);

MIX COLOR FUNCTION
float calcMix(float c, float amount, Mix mixType){
 switch (mixType) {
   case Tint:
     return c + (amount * (255 - c));  
   case Shade:
     return c * amount;
   case Tone:
     return 0;
   default:
     return 0;
 }
}

- TODO: ADD A WAY TO CHANGE COUNTRY IN CANVAS
void mouseClicked() {
 clear();
  
 StringList getNewCountry = new StringList();
    
 for (TableRow row : countryList.rows()) {     
   String placeName = row.getString("Place");
   getNewCountry.append(placeName);
 }
  
 float pickRandom = random(0,getNewCountry.size());
 country = getNewCountry.get(int(pickRandom));
 println(country);

 getCoords(country);
 paintLayer();
}

NOTES - 

To reference a String - 
String goobley = row.getString("Type"); 
if (goobley.equals("Attraction")){

x = latitude, y = longitude

*/