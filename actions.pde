

public void translateGrid(String c) {
  
  charGrid = new int[imgTiles.length][imgTiles[0].length];
  
  for(int w = 0; w < imgTiles.length; w++) {
    for(int h = 0; h < imgTiles[0].length; h++) {
      
      PImage imgTile = imgTiles[w][h]; //<>//
      if( imgTile != null ) {   /////////////// This is a workaround! Need to find out why some Images are null!!!!
        
        //println("analysing image tile: " + w + ":"+h);
        //println("tileWidth : " + imgTile.width);
        //println("tileHeight: " + imgTile.height);
        imgTile.loadPixels();
        
        int charTilePenaltyMin = MAX_INT;
        int lowestPenaltyChar = 0;
        
        //print("char");
        
        int i = 0;
        for(PGraphics ct : charTiles) {
          //print(":"+i);
          int thisCharPenalty = 0;
          for(int x = 0; x < imgTile.width; x++) {
            for(int y = 0; y < imgTile.height; y++) {
              //println("x:" + x + " y:"+y);
              color imgPix = imgTile.get(x,y);
              color charPix = ct.get(x,y);
              thisCharPenalty += abs( red(imgPix)-red(charPix) );
              thisCharPenalty += abs( green(imgPix)-green(charPix) );
              thisCharPenalty += abs( blue(imgPix)-blue(charPix) );
            }
          }
          if( thisCharPenalty < charTilePenaltyMin ) {
            charTilePenaltyMin = thisCharPenalty;
            lowestPenaltyChar = i;
          }
          i++;
        }
        charGrid[w][h] = lowestPenaltyChar;
      }
    }
  }
}


public void gridifyImage(String c) {
  
  int imgW = imgs[currentImage].width;
  int imgH = imgs[currentImage].height;

  int widthTiles  = ceil( imgs[currentImage].width  / (charTiles[0].width  + kern) ) + 1;
  int heightTiles = ceil( imgs[currentImage].height / (charTiles[0].height + lead) ) + 1;

  imgTiles = new PImage[widthTiles][heightTiles];

  int h = 1;
  float hpos = 0;
  while ( hpos < imgH ) {
    int w = 1;
    float wpos = 0;
    while ( wpos < imgW ) {
      
      
      imgTiles[w][h] = imgs[currentImage].get((int)wpos,(int)hpos,charTiles[0].width,charTiles[0].height);
      
      //wb.image(charTiles[ (int)random(charTiles.length) ], wpos, hpos);
      
      
      wpos = (charTiles[0].width * w)+(kern*w);
      w++;
    }
    hpos = (charTiles[0].height * h)+(lead*h);
    h++;
  }  
}



public void drawImageGrid(String c) {
  
  
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
      wb.image(imgTiles[w][h], wpos, hpos);
      wpos = (charTiles[0].width * w)+(kern*w);
      w++;
    }
    hpos = (charTiles[0].height * h)+(lead*h);
    h++;
  }
  wb.endDraw();
  
}



public void drawCharGrid(String c) {

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
      //wb.image(charTiles[ (int)random(charTiles.length) ], wpos, hpos);
      wb.image(charTiles[ charGrid[w][h] ], wpos, hpos);
      wpos = (charTiles[0].width * w)+(kern*w);
      w++;
    }
    hpos = (charTiles[0].height * h)+(lead*h);
    h++;
  }
  wb.endDraw();
}


void clear(String c) {
  
  wb.beginDraw();
  wb.background(0);
  wb.endDraw();
}


void drawInImage(String c) {
  
  wb.beginDraw();
  wb.image(imgs[currentImage],0,0);
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
