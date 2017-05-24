import controlP5.*;
import processing.sound.*;
import processing.serial.*;

SoundFile file;
SoundFile emergencySound;
ControlP5 cp5;
Serial arduino;
 

PImage map, closed, landing, liftOffSymbol, quad, droneSymbol,altitude, powerSymbol, button, buttonDark, konum, home, roll, pitch, yaw;
String url = "", command = "";
double latitude, longitude, rotX, rotY, rotZ, voltage, current;
int satellites, HDOP, heightCM, heightCMMap, engineState = 0, ledState=2, zoom = 18, scroolValue, scroolData = 0, nextCharNumber = 0, commandFill = 255;
boolean serialState = false, armState = false,a = true, liftOff = false, land = false, mapState = false, emergencyState = false, readState = false, emergencyColor = false, commandLock = false;
int[] ultrasonicData = new int[5];
int[] ultrasonicDataMap = new int[5];
char[] SerialText = new char[600];
String[] commandArray = new String[20];


void setup(){
  fullScreen();
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your por
  arduino = new Serial(this, portName, 115200);
  for(int b = 0; b <20; b++){
    commandArray[b] = " ";
  }  
  file = new SoundFile(this, "planeSound.mp3");
  emergencySound = new SoundFile(this, "emergency.mp3");
  file.play(4);
  //url = "https://maps.googleapis.com/maps/api/staticmap?&zoom="+zoom+"&size=640x400&maptype=hybrid&markers=color:green%7Clabel:D%7C"+latitude+","+longitude+"&key=AIzaSyAmePBKn14t_tOWMsb7CfBDhMTA4-27kTU";
  //if(mapState == true)map = loadImage(url, "jpg");
  landing  = loadImage("land.jpg");
  liftOffSymbol  = loadImage("liftOff.jpg");
  droneSymbol  = loadImage("drone.JPG");
  quad = loadImage("quadsymbol.jpg");
  powerSymbol = loadImage("power.jpg");
  konum = loadImage("konumSimge.jpg");
  home = loadImage("homeSymbol.jpg");
  altitude = loadImage("altitudeSymbol.jpg");
  button = loadImage("buttonSymbol.png");
  buttonDark = loadImage("buttonDarkSymbol.png");
  roll = loadImage("rollSymbol.JPG");
  pitch = loadImage("pitchSymbol.JPG");
  yaw = loadImage("yawSymbol.JPG");
  MapRefresh T1 = new MapRefresh( "Thread-1");
  T1.start();
}
void draw(){  
  if(millis()<5000){
    quad.resize(width,height);
    image(quad,0,0);
    serialListener();
  }
  else{
    serialListener();
    face();
  }
}
