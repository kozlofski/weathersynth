private class WeatherObject
{
  private float longitude;
  private float latitude;
  private int timezone;
  private String weatherDescription;
  private String locationName;
  private float temperature;
  private int humidity;
  private int pressure;
  private float feelsLike;
  private int clouds;
  private int windDeg;
  private float windSpeed;

  private String url = "http://api.openweathermap.org/data/2.5/weather?lat=";
  private String apikey = "5bc43eef2e2f88887082b1136b59491b";

  public WeatherObject()
  {
    //println("Utforzyłem");
  }

  public void getWeatherData(int MouseX, int MouseY)
  {
    float longitude = (float(MouseX)/float(width)) * 360 - 180;
    float latitude = ((float(MouseY)/float(height)) * -180) + 90;
    //println("Longitude: " + longitude + ", latitude: " + latitude + "\n");
    sendRequest(longitude, latitude);
  }

  private void parseWeatherData(String weatherString)
  {
    JSONObject weatherData = parseJSONObject(weatherString);

    JSONObject coord = weatherData.getJSONObject("coord");
    JSONArray weatherDescrArray = weatherData.getJSONArray("weather");
    JSONObject weatherDescr = weatherDescrArray.getJSONObject(0);
    JSONObject main = weatherData.getJSONObject("main");
    JSONObject cloudsJSON = weatherData.getJSONObject("clouds");
    JSONObject wind = weatherData.getJSONObject("wind");

    this.longitude = coord.getFloat("lon");
    this.latitude = coord.getFloat("lat");
    this.timezone = weatherData.getInt("timezone");
    this.weatherDescription = weatherDescr.getString("description");
    this.locationName = weatherData.getString("name");
    this.temperature = main.getFloat("temp") - 273.15;
    this.humidity = main.getInt("humidity");
    this.pressure = main.getInt("pressure");
    this.feelsLike = main.getFloat("feels_like") - 273.15;
    this.clouds = cloudsJSON.getInt("all");
    this.windDeg = wind.getInt("deg");
    this.windSpeed = wind.getFloat("speed");
  }

  public void printWeatherData()
  {
    println(" Weather for coords: " + this.longitude + ", " + this.latitude + " (" + this.locationName + ") is " + this.weatherDescription);
    println(" Temp is: " + this.temperature + " C, it feels like: " + this.feelsLike + " C");
    println(" Humidity is: " + this.humidity + " %");
    println(" Air pressure is: " + this.pressure + " hPa");
    println(" Wind speed: " + this.windSpeed + " m/s, deg. " + windDeg);
  }  

  private void sendRequest(float longitude, float latitude)
  {
    String call = url + latitude + "&lon=" + longitude + "&APPID=" + apikey + "\n";
    try {
      String weatherStrings[] = loadStrings(call);
      parseWeatherData(weatherStrings[0]);
      //printWeatherData();
    } 
    catch (Exception e) {
      println("Nie da się, cholera, bo " + e);
    }
  }
}
