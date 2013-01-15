class Barra {

  int x, y;
  int w, h;
  int anchoBarra = 2;

  int tamBase = 20;
  int velocidad;
  boolean toroidal = false;
  int paso = 0;

  //--------------------------------------

  Barra(  ) {
  }

  //--------------------------------------

  void iniciar(Scan _scan) {

    w = _scan.src.width;
    h = _scan.src.height;
    x = (_scan.x) - (w/2);
    y = _scan.y;
    velocidad = 1;
  }

  //--------------------------------------

  void setGrosor( int _grosor) {
    anchoBarra = _grosor;
  }

  //--------------------------------------

  void mover() {

    if ( paso > (w-anchoBarra) ) {
      return;
    }

    paso += anchoBarra;
  }

  //--------------------------------------
 //--------------------------------------
  boolean isFinished() {
    boolean termino = false;
    if ( paso > (w-anchoBarra) ) {
      termino = true;
    }
    return termino;
  }

  //--------------------------------------

  void draw() {
    pushMatrix();
    rectMode(CENTER);
    translate( (x+anchoBarra/2)+paso, y );
    fill( 255, 0, 0);
    noStroke();
    rect( 0, 0, anchoBarra, h );

    fill( 123);
    noStroke();

    rect( 0, (h/2) + (tamBase/2), tamBase, tamBase);
    popMatrix();
  }

  //--------------------------------------

  void reset() {
    paso = 0;
  }

  //--------------------------------------
  
}

