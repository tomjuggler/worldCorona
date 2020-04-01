import http.requests.*;
JSONArray values;
JSONObject corona;
String[] countries = {"ZA", "GB", "US"};
public void setup() 
{
	size(480,640);
surface.setTitle("CORONAVIRUS STATS");
	smooth();
background(0);
for(int i = 0; i < countries.length; i++){
  GetRequest get3 = new GetRequest("http://thevirustracker.com/free-api?countryTotal=" + countries[i]); 
  //GetRequest get3 = new GetRequest("http://thevirustracker.com/free-api?countryNewsTotal=" + countries[i]);
  get3.send(); // program will wait untill the request is completed
  //println("response: " + get3.getContent());
  corona = parseJSONObject(get3.getContent()); 
    //println(corona);
    values = corona.getJSONArray("countrydata");
   JSONObject valueObj = values.getJSONObject(0);
   
    int total = valueObj.getInt("total_cases");
    println(countries[i] + ": " + total);
}
}

public void draw(){
  
}
