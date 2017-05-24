void mouseClicked(){
  if ( mouseButton == LEFT && mouseX >120 && mouseX <570 && mouseY >75 && mouseY<115 ){
    commandLock = true;
    commandFill = 230;
    a = true;
  }
  else{
    commandLock = false;
    a = false;
    commandFill = 255;
    mapState = true;
  }
  if(sqrt(pow(mouseX-1260, 2)+pow(mouseY-672, 2)) <= 65){
    emergencyState=true;
    emergencySound.play();
    engineState = 0;
    land = false;
    liftOff = false;
    scroolData = 0;
  }
  if (mouseButton == LEFT && mouseX >40 && mouseX <120 && mouseY >500 && mouseY<530){
    if(armState == true ){
      armState = false;
      engineState = 0;
      land = false;
      liftOff = false;
      scroolData = 0;
    }
    else if(armState == false )armState = true;
  }
  if (mouseButton == LEFT && mouseX >40 && mouseX <120 && mouseY >540 && mouseY<580&&armState == true){
    engineState=1;
  }
  if (mouseButton == LEFT && mouseX >40 && mouseX <120 && mouseY >580 && mouseY<610){
    engineState=0;
    liftOff = false;
    land = false;
  }
  if (mouseButton == LEFT && mouseX >40 && mouseX <120 && mouseY >620 && mouseY<650 && armState == true){
    if(liftOff == false) liftOff = true;
    else if(liftOff == true) liftOff = false;
  }
  if (mouseButton == LEFT && mouseX >40 && mouseX <120 && mouseY >660 && mouseY<690 && armState == true){
    if(land == false) land = true;
    else if(land == true) land = false;
  }
  if (mouseButton == LEFT && mouseX >562 && mouseX <618 && mouseY >62 && mouseY<92&&scroolData<8198 && armState == true )scroolData++;
  if (mouseButton == LEFT && mouseX >562 && mouseX <618 && mouseY >408 && mouseY<438&&scroolData>0 && armState == true )scroolData--;
  
 
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e==-1&&zoom!=20&&mouseX>680&&mouseX<1320&&mouseY>50&&mouseY<530){
    zoom++;
  }
  if(e==1&&zoom!=1&&mouseX>680&&mouseX<1320&&mouseY>50&&mouseY<530){
    zoom--;
  }
  if(e==-1&&scroolData<8192&&mouseX>520&&mouseX<660&&mouseY>50&&mouseY<450 && armState == true){
    if(scroolData<8100 && scroolData>100)scroolData+=15;
    else{
      scroolData++;
    }
  }
  if(e==1&&scroolData>0&&mouseX>520&&mouseX<660&&mouseY>50&&mouseY<450 && armState == true){
    if(scroolData>100)scroolData-=15;
    else{
      scroolData--;
    }
  }
}
void keyPressed() {
  if(commandLock == true){
    
    if(keyCode == ENTER ){
      commandProcess(command);
      command = "";
      mapState = true;
    }
    else{
      if(keyCode == BACKSPACE){
        if(command.length()>0)command = command.substring(0,command.length()-1);
      }  
      else{
        command = command + str(key);
      }
    }
  }
}