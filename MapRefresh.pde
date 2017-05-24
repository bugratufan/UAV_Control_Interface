class MapRefresh implements Runnable {
  private Thread t;
  private String threadName;
  private double oldLatitude, oldLongitude;
  
  MapRefresh ( String input ) {
    threadName = input;
    oldLatitude = 0;
    oldLongitude = 0;
  }
  
  public void run() {
    while( true ) {
      if( latitude != oldLatitude || longitude != oldLongitude ) {
        url = "https://maps.googleapis.com/maps/api/staticmap?&zoom="+zoom+"&size="+640+"x"+ 400+"&maptype=hybrid&markers=color:green%7Clabel:D%7C"+latitude+","+longitude+"&key=AIzaSyAmePBKn14t_tOWMsb7CfBDhMTA4-27kTU";
        if(mapState == false){
          map = loadImage(url, "jpg");
          mapState = true;
        }
        map.resize(width,height);
        oldLatitude = latitude;
        oldLongitude = longitude;
      }
      delay(100);
    }
  }
  
  public void start() {
    if (t == null)
    {
         t = new Thread (this, threadName);
         t.start ();
    }
  }
}