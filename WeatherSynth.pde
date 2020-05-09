import http.requests.*;


UserInterface UI;
WeatherObject weather;

public void setup() 
{
  size(1000, 500);
  frameRate(1);
  UI = new UserInterface();
  weather = new WeatherObject();
}

void draw()
{
  UI.drawUI();
}

void mouseClicked() {
  weather.getWeatherData(mouseX, mouseY);
  weather.printWeatherData();
}
