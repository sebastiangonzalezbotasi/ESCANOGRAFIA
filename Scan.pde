class Scan {
  PImage img;
  PImage camFlip;

  Barra barra;
  Capture src;
  int x, y;
  boolean activo;
  int MARGEN = 10;

  int contador;
  int tiempoEspera;

  int posX;
  int posY;
  int ancho;
  int alto;

  boolean loopB;

  //--------------------------------------

  Scan( Capture _src ) {
    src = _src;
    barra = new Barra();
    barra.iniciar(this);
    img = createImage( src.width, src.height, RGB );
    contador = 0;

    vaciarIMG();
  }
  //--------------------------------------
  void setTime( int _time ) {
    tiempoEspera = _time;
  }
  //--------------------------------------

  void setGrosor( int _grosor) {
    barra.setGrosor( _grosor );
  }
  //--------------------------------------
  void active( boolean _active ) {
    activo = _active;
  }
  //--------------------------------------
  void reset() {
    barra.reset();
    vaciarIMG();
  }
  //--------------------------------------

  void setPosition( int _x, int _y ) {
    x = _x;
    y = _y;
    barra.iniciar(this);
  }

  //--------------------------------------
  void procesar() {
    src.read();
    camFlip = flipImage( src  );
    if ( activo ) {
      contador++;
      if (contador==tiempoEspera) {

        posX = barra.paso;//(barra.x + barra.paso);
        posY = (barra.y-(barra.h/2));
        ancho = barra.anchoBarra;
        alto = barra.h;


        barra.mover();
        contador = 0;
      }

      if ( loopB ) {
        if (barra.isFinished()) {
          barra.reset();
        }
      }
    }
  }
  //--------------------------------------

  void draw() {

    pushMatrix();

    translate(x, y);   

    imageMode(CENTER);
    image(camFlip, 0, 0);

    pushStyle();
    noFill();
    rectMode(CENTER);
    stroke(255, 0, 0);
    rect(camFlip.width + MARGEN, 0, camFlip.width+2, camFlip.height+2);
    popStyle();

    if ( activo ) {

      img.copy( camFlip,  posX, 0, ancho, alto, posX, 0, ancho, alto );
    }

    image(img, img.width + MARGEN, 0, img.width, img.height );

    popMatrix();



    barra.draw();
  }
  //--------------------------------------
  void setLoop( boolean _loop) {
    loopB = _loop;
  }
  //--------------------------------------

  void vaciarIMG() {
    //    loadPixels(); 
    img.loadPixels(); 
    for (int y = 0; y < img.height; y++) {
      for (int x = 0; x < img.width; x++) {
        int loc = x + y*img.width;

        img.pixels[loc] =  color(255);
      }
    }
    img.updatePixels();
  }
}

