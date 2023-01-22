PFont font;
String word = "word";

String charset;

float fontwidth;
float fontSize = 48;
float fontHeight;

int fontpointer = 0;
boolean fontPointerPause = false;

void setup() {

  pixelDensity(2);
  fullScreen();




  charset = loadStrings("charset.txt")[0];
  word = charset;
  //font = loadFont("PerfectDOSVGA437-48.vlw");
  font = createFont( "Monaco", 48);
  textSize(fontSize);
  fontHeight = textAscent();// + textDescent();
  println("fh: " + fontHeight);
  println("fs: " + fontSize);
  textFont(font);
  
  fill(255);

  for ( int i = 0; i < charset.length(); i++ ) {
    float fWidth = textWidth( charset.charAt(i));
    println(fWidth);
    fontwidth = fWidth;
  }
}


void draw() {
  background(0);
  textAlign(LEFT);
  text(word, 50, 200);


  stroke(200);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);


  rectMode(CORNER);
  textAlign(LEFT);

  fill(80);
  rect(width/2 - fontwidth, height/2-fontHeight, fontwidth, fontSize);
  fill(255);
  text(charset.charAt(fontpointer), width/2-fontwidth, height/2-textDescent());

  if ( !fontPointerPause ) {
    fontpointer++;
    if ( fontpointer >= charset.length())fontpointer = 0;
  }
}




void keyPressed() {
  /*
  if (key == BACKSPACE) {
    word = word.substring(0, word.length()-1);
  } else {
    word += key;
  }
  */
  
  if (key == CODED) {
    if( keyCode == LEFT ) fontpointer--;
    if( keyCode == RIGHT) fontpointer++;
  }
  if ( key == ' ' ) fontPointerPause = ! fontPointerPause;
}
