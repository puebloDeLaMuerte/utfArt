

public void drawGrid() {

  wb.beginDraw();
  //wb.background(33,44,55);
  wb.rectMode(CORNER);
  wb.textAlign(LEFT);
  
  /// draw char tiles
  int imgW = imgs[0].width;
  int imgH = imgs[0].height;

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


void cls() {
  
  wb.beginDraw();
  wb.background(0);
  wb.endDraw();
}
