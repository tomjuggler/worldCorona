import http.requests.*;
JSONObject latest;
JSONObject locations;
String[] countries = {"ZA", "GB", "US"};
int[] data = {0, 0, 0};

public void setup() 
{
  size(480, 640);
  surface.setTitle("CORONAVIRUS STATS");
  smooth();
  background(0);
  for (int i = 0; i < countries.length; i++) {
    GetRequest get3 = new GetRequest("https://coronavirus-tracker-api.herokuapp.com/v2/locations?source=jhu&country_code=" + countries[i]);
    get3.send(); // program will wait untill the request is completed
    //println("response: " + get3.getContent());
    locations = parseJSONObject(get3.getContent()); 
    //println(locations);
    latest = locations.getJSONObject("latest");
    //println(latest);
    data[i] = latest.getInt("confirmed");
  }
  for (int i = 0; i < countries.length; i++) {
    println(countries[i] + ": " + data[i]);
  }
}

public void draw() {
}
