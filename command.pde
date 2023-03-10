ArrayList<String> commandHistory = new ArrayList<String>();
String command = "enter command!";
boolean commandActive = true;


void evaluateCommand() {
  
  println("command: " + command);
  boolean commandFail = false;
  
  if( command.startsWith("clear") ) {
    clear(command);
  }
  else
  if( command.startsWith("drawCharGrid") ) {
    drawCharGrid(command);
  }
  else
  if( command.startsWith("drawImageGrid") ) {
    drawImageGrid(command);
  }
  else
  if( command.startsWith("inImage") ) {
    setInputImage(command);
  }
  else
  if( command.startsWith("exit") ) {
    exitUtfArt();
  }
  else
  if( command.startsWith("gridifyImage") ) {
    gridifyImage(command);
  }
  else
  if( command.startsWith("translate") ) {
    translateGrid(command);
  }
  else
  if( command.startsWith("drawInImage") ) {
    drawInImage(command);
  }
  
  else {
    commandFail = true;
      println("unknownCommand: " + command);
  }
  
  if( !commandFail ) commandActive = false; 
}


void displayCommandline() {
  if( ! commandActive ) return;
  pushStyle();
  fill(10);
  stroke(0);
  rect(0,0,width, 40 );
  fill(0,40,10);;
  text( command, 50, textAscent() + 10 );
  popStyle();
  
}


void commandKeyPressed() {
  
  if ( key == TAB ) {
    println("ca");
    commandActive = !commandActive;
    return;
  }
  
  if( !commandActive ) return;
  
  if( key == CODED ) {
    
  }
  else {
    if( key == ENTER || key == RETURN ) {
      evaluateCommand();
      command = "";
      return;
    }
    if( key == BACKSPACE && command != "") {
      command = command.substring(0,command.length()-1);
      return;
    }
    if( command == "enter command!" ) command = "";
    command += key; 
    
  }
  
}
