//-------------------------------------------------------------
//FLIP IMAGE HORIZONTAL
PImage flipImage( Capture _src  ) {
  PImage camFlip  =  createImage( _src.width, _src.height, RGB );
  camFlip.loadPixels();
  for (int i = 0; i < camFlip.width; i++) {
    for (int j = 0; j < camFlip.height; j++) {    
      int id = i + ( j * camFlip.width );
      int loc = (camFlip.width - i - 1) + j*camFlip.width; // Reversing x to mirror the image

      float r = red(_src.pixels[loc]);
      float g = green(_src.pixels[loc]);
      float b = blue(_src.pixels[loc]);

      camFlip.pixels[id] = color(r, g, b);
    }
  }
  camFlip.updatePixels();
  return camFlip;
}
//-------------------------------------------------------------
