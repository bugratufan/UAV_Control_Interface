int time = 0;
void serialListener() {
  if( arduino.available() > 0 ) {
    char incomingChar = (char)arduino.read();
    if( incomingChar == '$' ) {
      readState = true;
      nextCharNumber = 0;
    }
    else if( readState == true && incomingChar == '%' ) {
      SerialText[nextCharNumber] = '\0';
      String outputString = new String(SerialText);
      parse( outputString );
      //printDatas();
      //println(outputString);
      readState = false;
      nextCharNumber = 0;
      serialState = true;
      time = millis();
      
    }
    else if( readState == true && nextCharNumber < 600 ) {
      SerialText[nextCharNumber] = incomingChar;
      nextCharNumber++; 
    }
    else if( readState == true && nextCharNumber >= 600 ){
      println("Invalid Syntax Length!");
      arduino.clear();
      readState = false;
      nextCharNumber = 0;
    }
  }
}