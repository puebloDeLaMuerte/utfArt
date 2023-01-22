public void prepareFont() {
  
  charset = loadStrings("charset.txt")[0];
  //word = charset;
  charTiles = new PGraphics[charset.length()];

  for ( int i = 0; i < charset.length(); i++ ) {
    float fWidth = textWidth( charset.charAt(i));
    //println(fWidth);
    fontWidth = fWidth;
  }

  for ( int i = 0; i < charTiles.length; i++ ) {
    charTiles[i] = createGraphics(ceil(fontWidth+paddL+paddR), ceil(fontSize+paddT+paddB));
    charTiles[i].beginDraw();
    //charTiles[i].background(50,10,20);
    charTiles[i].textSize(fontSize);
    charTiles[i].textFont(font);
    charTiles[i].fill(0, 255, 0);
    charTiles[i].text(charset.charAt(i), paddL, charTiles[i].height-textDescent()-paddB );
    charTiles[i].endDraw();
  }
}
