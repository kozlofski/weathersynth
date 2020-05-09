public class UserInterface
{
  PImage map;
  String image = "mapa.jpg";
  
  public UserInterface()
  {
    this.map = loadImage(image);
  }

  public void drawUI()
  {
    image(map, 0, 0, width, height);
  }
  
  
  
}
