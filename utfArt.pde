PFont font;
String word = "word";

String charset;
PGraphics[] charTiles;
PImage[][] imgTiles;
int[][] charGrid;

PGraphics wb;

float fontWidth;
float fontSize = 20;
//float fontHeight;

int fontpointer = 0;
boolean fontPointerPause = false;

float tilewidth, tileheight;
float paddL = 0;
float paddR = 0;
float paddT = 3;
float paddB = 0;
float kern = 5;
float lead = 2;

void setup() {

  pixelDensity(2);
  fullScreen();

  wb = createGraphics(pixelWidth,pixelHeight);
  
  println(" pixelWidth: " + pixelWidth);
  println("      width: " + width);
  println("pixelHeight: " + pixelHeight);
  println("     height: " + height);
  initImages();


  //font = loadFont("PerfectDOSVGA437-48.vlw");
  font = createFont( "Monaco", fontSize);
  textSize(fontSize);
  //fontHeight = textAscent();// + textDescent();
  //println("fh: " + fontHeight);
  println("fs: " + fontSize);
  textFont(font);

  fill(255);

  prepareFont();
  background(0);
}


void draw() {
  background(0);
  

  /// draw char tiles in a simple line

  for ( int i = 0; i < charTiles.length; i++) {
    //image(charTiles[i], (charTiles[i].width * i)+(kern*i), height - 200);
  }
  image(wb,0,0);
  displayCommandline();
}




void keyPressed() {
  
  commandKeyPressed(); 

  if (key == CODED) {
    if ( keyCode == LEFT ) fontpointer--;
    if ( keyCode == RIGHT) fontpointer++;
  }
  if ( fontpointer >= charset.length() ) fontpointer = 0;
  if ( fontpointer < 0 ) fontpointer = charset.length()-1;
  if ( key == ' ' ) fontPointerPause = ! fontPointerPause;
}
