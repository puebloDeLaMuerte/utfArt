public void gridifyImage(String c) {
  
  int imgW = imgs[currentImage].width;
  int imgH = imgs[currentImage].height;

  int h = 1;
  float hpos = 0;
  while ( hpos < imgH ) {
    int w = 1;
    float wpos = 0;
    while ( wpos < imgW ) {
      
      
      imgTiles[w][h] = imgs[currentImage].get(wpos,hpos,charTiles[0].width,charTiles[0].height);
      
      wb.image(charTiles[ (int)random(charTiles.length) ], wpos, hpos);
      
      
      wpos = (charTiles[0].width * w)+(kern*w);
      w++;
    }
    hpos = (charTiles[0].height * h)+(lead*h);
    h++;
  }
  
}



public void drawGrid(String c) {

  wb.beginDraw();
  //wb.background(33,44,55);
  wb.rectMode(CORNER);
  wb.textAlign(LEFT);
  
  /// draw char tiles
  int imgW = imgs[currentImage].width;
  int imgH = imgs[currentImage].height;

  int h = 1;
  float hpos = 0;
  while ( hpos < imgH ) {
    int w = 1;
    float wpos = 0;
    while ( wpos < imgW ) {
      wb.image(charTiles[ (int)random(charTiles.length) ], wpos, hpos);
      wpos = (charTiles[0].width * w)+(kern*w);
      w++;
    }
    hpos = (charTiles[0].height * h)+(lead*h);
    h++;
  }
  wb.endDraw();
}


void cls(String c) {
  
  wb.beginDraw();
  wb.background(0);
  wb.endDraw();
}


void setInputImage(String c) {
  String ns = c.substring( c.lastIndexOf(" ")+1, c.length() );
  int n = parseInt(ns);
  println("n detected: " + n);
  currentImage = n;
}


void exitUtfArt() {
  exit();
}
