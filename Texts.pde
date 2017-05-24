
void texts(){
  /////////////////////////////////////////create fonts
  PFont mono = createFont( "Ubuntu", 40, true );
  PFont f = createFont( "Ubuntu", 10, true );
  PFont b = createFont( "Ubuntu", 13, true );
  /////////////////////////////////////////real altitude
  textFont(b);
  fill(80);
  text( heightCM +" cm", 630, 103);
  /////////////////////emergency button
  textFont(mono);
  fill(#cccccc);
  text("STOP",1206,685);
  textFont(b);
  ///////////////////////////////////////////altitude value
  fill(0);
  if(scroolData<10)text( scroolData, 1288, scroolValue+20 );
  if(scroolData<100 && scroolData>9 )text( scroolData, 1285, scroolValue+20 );
  if(scroolData<1000 && scroolData>99 )text( scroolData, 1280, scroolValue+20 );
  if(scroolData<10000 && scroolData>999 )text( scroolData, 1276, scroolValue+20 );
  ///////////////////////////////////////////Buttons

  /////////////////////////////////////////////Command Line
    if( commandLock == true ){
      fill(0);
      textFont(b);
      text(command,125,100);
      for(int c = 0; c<20; c++){
      textFont(b);
      text(commandArray[c], 145,140+(c*15));
      if(commandArray[c].equals(" ") == false)text(">>", 125, 140+(c*15));
      }
  }
  ////////////////////////////////////////////roll pitch yaw
  text("Roll: "+(float)rotX+ "°",1000,83);
  text("Pitch: "+(float)rotY+ "°",1000,103);
  text("Yaw: "+(float)rotZ+ "°",1000,123 );
  /////////////////////////////////////////////notifications
  textFont(b);
  text("Lat: "+(float)latitude,720,93);
  text("Lon: "+(float)longitude,720,113);
  
  text((float)voltage + " V" ,870,83);
  text((float)current +" A",870,103);
  text((float)(current*voltage)+" Watt",870,123);
  /////////////////////////////////////////////connection status
  textFont(f);
  if(ledState == 0){
    fill(200,0,0);
    text( "Not connected",70, 735 );
  }
  if(ledState == 1){
    fill(255,204,51);
    text( "Connection Lost",70, 735 );
  }
  if(ledState == 2){
    fill(46,184,0);
    text( "Connected",70, 735 );
  }  
}
void commandProcess(String commandData){
  for(int a = 19; a>0; a--){
  commandArray[a] = commandArray[a-1];
  }
  commandArray[0] = commandData;
  if(commandArray[0].equals("clear") == true){
    for(int b = 0; b <20; b++){
     commandArray[b] = " ";
     }
  }
}