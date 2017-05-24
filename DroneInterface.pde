void face(){
  if(mapState == true){
    map.resize(width,height);
    image(map, 0, 0);
    mapState = false;
    a = true;
    
  }
  

  
  ///////////////////////////////////////////////////boxes
  fill(255);
  rect(60, 60, 1250, 70);// below maps notification box
  stroke(220);
  fill(commandFill);
  rect(120, 75, 450, 40);
  if(commandLock == true && a == true){
    fill(commandFill,80);
    rect(120, 125, 450, 310);
    a = false;
  }
  /*
  fill(100);
  stroke(100);
  rect(801, 95, 7, 6);
  triangle(798,95,811,95,805,88);
  strokeWeight(2);
  line(798,105,811,105);
  
  line(908,98,910,98);
  line(930,98,932,98);
  line(920,88,920,85);
  line(920,108,920,110);
  
  fill(80);
  stroke(80);
  ellipse(920,98,18,18);
  fill(255);
  ellipse(920,98,14,14);
  fill(80);
  ellipse(920,98,4,4);
 
  */
  
  ////////////////////////////////////////////////////altitude
  fill(250);
  rect(1270, 160, 40, 380, 7);
  rect(1272, 162, 36, 30, 7);//up
  rect(1272, 508, 36, 30, 7);//down
  scroolValue = int(map(scroolData, 8192, 0, 195, 475));
  fill(180);
  rect(1272, scroolValue, 36, 30, 7);
  stroke(0);
  
  /////////////////////////////////////////////buttons
  stroke(255);
  fill(255);
  ellipse(90,180,50,50);//arm disarm
  ellipse(90,245,50,50);
  ellipse(90,310,50,50);
  ellipse(90,375,50,50);
  ellipse(90,440,50,50);
  if(armState == false){
    fill(255);
    stroke(70);
    ellipse(90,175,16,20);
    fill(70);
    rect(80,178,20,17);
  }
  if(armState == true){
    
    stroke(70);
    ellipse(103,175,16,20);
    fill(70);
    rect(80,178,20,17);
    fill(255);
    stroke(255);
    rect(102,178,9,10);
  }
  /*
  fill(200);
  stroke(200);
  rect(80,438,20,17);
  triangle(79,438,101,438,90,429);
  fill(255);
  stroke(255);
  rect(88,447,4,5);*/
  ////////////////////////////////////////////////stop button
  fill(200);
  stroke(200);
  ellipse(1260,670,140,140);
  fill(150,0,0);
  if(sqrt(pow(mouseX-1260, 2)+pow(mouseY-672, 2)) <= 65){
    //fill(255,0,0);
    button.resize(130,130);
    image(button,1195,607);
  }
  else{
    //fill(100,0,0);
    buttonDark.resize(130,130);
    image(buttonDark,1195,607);
  }
  //ellipse(1260,670,120,120);
  /*
  button.resize(140,140);
  image(button,1190,600);
  */
  //button.resize(100,100);
  //image(button,1210,612);
  /////////////////////////////////////////////////ultrasonic value
  
  fill(177,204,255);
  ultrasonicDataMap[0] = int(map(ultrasonicData[0], 0, 255, 0 , 20));//forward
  ultrasonicDataMap[1] = int(map(ultrasonicData[1], 0, 3, 0 , 20));//back
  ultrasonicDataMap[2] = int(map(ultrasonicData[2], 0, 3, 0 , 20));//left
  ultrasonicDataMap[3] = int(map(ultrasonicData[3], 0, 3, 0 , 20));//right
  ultrasonicDataMap[4] = int(map(ultrasonicData[4], 0, 3, 0 , 100));//up
  arc(1179, 105, ultrasonicDataMap[1], ultrasonicDataMap[1], radians(45), radians(135), PIE);//back
  arc(1179, 85, ultrasonicDataMap[0], ultrasonicDataMap[0], radians(225), radians(315), PIE);//forward
  arc(1169, 95, ultrasonicDataMap[2], ultrasonicDataMap[2], radians(135), radians(225), PIE);//left
  arc(1189, 95, ultrasonicDataMap[3], ultrasonicDataMap[3], radians(-45), radians(45), PIE);//right
  ////////////////////////////////////////////////Connection status led
  if(ledState == 0){
    fill(200,0,0);
  }
  if(ledState == 1){
    fill(255,204,51);
  }
  if(ledState == 2){
    fill(#005500);
  }
  
  if(serialState == true ){
    fill(#00ff00);
    if(millis()-time>200)serialState = false;
  }
  ellipse(40,730,30,30);
  ////////////////////////////////////////////////print map
  texts();
  landing.resize(35,35);
  image(landing,73,293);
  liftOffSymbol.resize(35,35);
  image(liftOffSymbol,73,358);
  droneSymbol.resize(20,20);
  image(droneSymbol,1170,85);
  konum.resize(32,32);
  image(konum,680,80);
  altitude.resize(20,28);
  image(altitude,610,82);
  powerSymbol.resize(30,30);
  image(powerSymbol,830,80);
  home.resize(30,30);
  image(home,77,425);
  pitch.resize(15,15);
  image(pitch,980,90);
  roll.resize(15,15);
  image(roll,980,70);
  yaw.resize(15,15);
  image(yaw,980,110);
}