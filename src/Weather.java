import java.io.InputStream;
import java.net.*;
import static com.sun.java.accessibility.util.AWTEventMonitor.addMouseListener;

class Weather {

    private String url = "http://api.openweathermap.org/data/2.5/weather?lat=";
    private String apikey = "5bc43eef2e2f88887082b1136b59491b";

    public Weather() {
        addMouseListener(new MouseEvents(this));


    }

    public void getWeatherData(int MouseX, int MouseY)
    {
        float longitude = (float(MouseX)/float(width)) * 360 - 180;
        float latitude = ((float(MouseY)/float(height)) * -180) + 90;
        //println("Longitude: " + longitude + ", latitude: " + latitude + "\n");
        sendRequest(longitude, latitude);
    }

    public static void main(String[] args) {
        try {
            URL weatherServiceURL = new URL("http://api.openweathermap.org/data/2.5/forecast?id=524901&APPID=5bc43eef2e2f88887082b1136b59491b\n");
            HttpURLConnection weatherService = (HttpURLConnection) weatherServiceURL.openConnection();

            int code = weatherService.getResponseCode();
            System.out.println("Response code: " + code);
            System.out.println(weatherService.getContentLength());
            InputStream in = weatherService.getInputStream();

            System.out.println(in);
            int c;
            while((c = in.read()) != -1) {
                System.out.print((char) c);
            }

            in.close();
        } catch(Exception e) {
            System.out.println("Cos sie zjebało, oto co:\n" + e);
        }
    }



}
