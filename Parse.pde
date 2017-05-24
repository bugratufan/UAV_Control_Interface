void parse( String inputData ){
  String inputDataNoSpace = "";
  for( int a = 0; a < inputData.length(); a++){
   if(inputData.charAt(a) != ' '){
     inputDataNoSpace = inputDataNoSpace + inputData.charAt(a); 
   }
  }
  int lineCounter = 0;
  for(int b = 0; b<inputDataNoSpace.length(); b++){
    if(inputDataNoSpace.charAt(b) == '|'){     
      lineCounter++;
    }
  }
  int linePosition[] = new int[lineCounter];
  lineCounter = 0;
  for(int c = 0; c<inputDataNoSpace.length(); c++){
    if(inputDataNoSpace.charAt(c) == '|'){     
      linePosition[lineCounter] = c;
      lineCounter++;
    }
  }
  if(lineCounter >5 && millis()>4000){
  String parseArray[] = new String[lineCounter-1];
  for( int d = 0; d<lineCounter-1; d++){
    parseArray[d] = inputDataNoSpace.substring(linePosition[d]+1,linePosition[d+1]);
  }
  for(int e = 0; e<lineCounter-1; e++){
////////////////////////////////////////////////////////////GPS parse/////
    if(parseArray[e].substring(0,4).equals("GPS:")){
      int gpsCommaCounter = 0, gpsPointCounter = 0;
      for(int f = 0; f<parseArray[e].length(); f++){
        if(parseArray[e].charAt(f) == '.' )gpsPointCounter++;
        if(parseArray[e].charAt(f) == ',' )gpsCommaCounter++;
      }
      int gpsPointPosition[] = new int[gpsPointCounter];
      int gpsCommaPosition[] = new int[gpsCommaCounter];
      gpsCommaCounter = 0;
      gpsPointCounter = 0;
      for(int g = 0; g<parseArray[e].length(); g++){
        if(parseArray[e].charAt(g) == '.' ){
          gpsPointPosition[gpsPointCounter] = g;
          gpsPointCounter++;
        }
        if(parseArray[e].charAt(g) == ',' ){
          gpsCommaPosition[gpsCommaCounter] = g;
          gpsCommaCounter++;
        }
      }
      if( gpsCommaCounter == 3 && gpsPointCounter == 2 ){
        double a;
        double b;
        if( parseArray[e].charAt(4) != '-' ){
          a = float(parseArray[e].substring(4,gpsPointPosition[0]));
          b = float(parseArray[e].substring(gpsPointPosition[0]+1,gpsCommaPosition[0]));
          longitude = a+(b/1000000);
        }
        else if( parseArray[e].charAt(4) == '-' ){
          a = float(parseArray[e].substring(5,gpsPointPosition[0]));
          b = float(parseArray[e].substring(gpsPointPosition[0]+1,gpsCommaPosition[0]));
          longitude = (a+(b/1000000))*-1;
        }
        
        if( parseArray[e].charAt(gpsCommaPosition[0]+1) != '-' ){
          a = float(parseArray[e].substring(gpsCommaPosition[0]+1,gpsPointPosition[1]));
          b = float(parseArray[e].substring(gpsPointPosition[1]+1,gpsCommaPosition[1]));
          latitude = a+(b/1000000);
        }
        else if( parseArray[e].charAt(gpsCommaPosition[0]+1) == '-' ){
          a = float(parseArray[e].substring(gpsCommaPosition[0]+2,gpsPointPosition[1]));
          b = float(parseArray[e].substring(gpsPointPosition[1]+1,gpsCommaPosition[1]));
          latitude = (a+(b/1000000))*-1;
        }
        satellites = int(parseArray[e].substring(gpsCommaPosition[1]+1,gpsCommaPosition[2]));
        HDOP = int(parseArray[e].substring(gpsCommaPosition[2]+1,parseArray[e].length()));
      }
    }
////////////////////////////////////////////////////////////Height parse/////
    if(parseArray[e].substring(0,4).equals("HGT:"))heightCM = int(parseArray[e].substring(4,parseArray[e].length()-2));
//////////////////////////////////////////////////////////// ORT parse/////
    if(parseArray[e].substring(0,4).equals("ORT:")){
      int ortCommaCounter = 0, ortPointCounter = 0;
      for(int f = 0; f<parseArray[e].length(); f++){
        if(parseArray[e].charAt(f) == '.' )ortPointCounter++;
        if(parseArray[e].charAt(f) == ',' )ortCommaCounter++;
      }
      int ortPointPosition[] = new int[ortPointCounter];
      int ortCommaPosition[] = new int[ortCommaCounter];
      ortCommaCounter = 0;
      ortPointCounter = 0;
      for(int g = 0; g<parseArray[e].length(); g++){
        if(parseArray[e].charAt(g) == '.' ){
          ortPointPosition[ortPointCounter] = g;
          ortPointCounter++;
        }
        if(parseArray[e].charAt(g) == ',' ){
          ortCommaPosition[ortCommaCounter] = g;
          ortCommaCounter++;
        }
      }
      if( ortCommaCounter == 2 && ortPointCounter == 3 ){
        float c,d;
        if( parseArray[e].charAt(4) != '-' ){
          c = float(parseArray[e].substring(4,ortPointPosition[0]));
          d = float(parseArray[e].substring(ortPointPosition[0]+1,ortCommaPosition[0]));
          rotX = c+(d/1000000);
        }
        else if( parseArray[e].charAt(4) == '-' ){
          c = float(parseArray[e].substring(5,ortPointPosition[0]));
          d = float(parseArray[e].substring(ortPointPosition[0]+1,ortCommaPosition[0]));
          rotX = (c+(d/1000000))*-1;
        }
        if( parseArray[e].charAt(ortCommaPosition[0]+1) != '-' ){
          c = float(parseArray[e].substring(ortCommaPosition[0]+1,ortPointPosition[1]));
          d = float(parseArray[e].substring(ortPointPosition[1]+1,ortCommaPosition[1]));
          rotY = c+(d/1000000);
        }
        else if( parseArray[e].charAt(ortCommaPosition[0]+1) == '-' ){
          c = float(parseArray[e].substring(ortCommaPosition[0]+2,ortPointPosition[1]));
          d = float(parseArray[e].substring(ortPointPosition[1]+1,ortCommaPosition[1]));
          rotY = (c+(d/1000000))*-1;
        }
        if( parseArray[e].charAt(ortCommaPosition[1]+1) != '-' ){
          c = float(parseArray[e].substring(ortCommaPosition[1]+1,ortPointPosition[2]));
          d = float(parseArray[e].substring(ortPointPosition[2]+1,parseArray[e].length()));
          rotZ = c+(d/1000000);
        }
        else if( parseArray[e].charAt(ortCommaPosition[1]+1) == '-' ){
          c = float(parseArray[e].substring(ortCommaPosition[1]+2,ortPointPosition[2]));
          d = float(parseArray[e].substring(ortPointPosition[2]+1,parseArray[e].length()));
          rotZ = (c+(d/1000000))*-1;
        }
      }
    }
    //////////////////////////////////////////////////////////////////////////////////Ultrasonic parse
    if(parseArray[e].substring(0,4).equals("ULT:")){
      int ultCommaCounter = 0;
      for(int a = 0; a<parseArray[e].length(); a++){
        if(parseArray[e].charAt(a) == ',')ultCommaCounter++;
      }
      if(ultCommaCounter == 4 ){
        int ultCommaPosition[] = new int[ultCommaCounter];
        ultCommaCounter = 0;
        for(int a = 0; a<parseArray[e].length(); a++){
          if(parseArray[e].charAt(a) == ','){
            ultCommaPosition[ultCommaCounter] = a;
            ultCommaCounter++;
          }
        }
        ultrasonicData[0] = int(parseArray[e].substring(4,ultCommaPosition[0]));
        ultrasonicData[1] = int(parseArray[e].substring(ultCommaPosition[0]+1,ultCommaPosition[1]));
        ultrasonicData[2] = int(parseArray[e].substring(ultCommaPosition[1]+1,ultCommaPosition[2]));
        ultrasonicData[3] = int(parseArray[e].substring(ultCommaPosition[2]+1,ultCommaPosition[3]));
        ultrasonicData[4] = int(parseArray[e].substring(ultCommaPosition[3]+1,parseArray[e].length()));
      }
    }
    ///////////////////////////////////////////////////////////////////////////////////power parse
    if(parseArray[e].substring(0,4).equals("PWR:")){
      int pwrCommaPosition = 0;
      for(int a = 0; a<parseArray[e].length();a++){
        if(parseArray[e].charAt(a) == ',')pwrCommaPosition = a;
      }
      voltage = float(parseArray[e].substring(4,pwrCommaPosition-1));
      current = float(parseArray[e].substring(pwrCommaPosition+1,parseArray[e].length()-1));
    }
  }
  }

}