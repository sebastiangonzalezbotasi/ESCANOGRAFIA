// Autor: "Sebastian G. Botasi" <sgonzalez@bionimio.com.ar>
//=====================================================================


import processing.video.*;

Scan scan;

int w = 1024;
int h = 600;

int wR = 320;
int hR = 240;

PFont font;
PImage logo, imagen;
int controlPanelWidth = 250;


void infoPrograma() {
  println(frame.getTitle());
  println ();
  println (" ********************************************************");
  println (" *                                                      *"); 
  println (" *  COMANDOS                                            *"); 
  println (" *  >> S = Stop                                         *"); 
  println (" *  >> P = Play                                         *");
  println (" *  >> R = Reset                                        *");
  println (" *  >> ESC = Salir                                      *");
} 
//=====================================================================

void setup() {
  size(w, h);
  background(255);
  
  infoPrograma();
  
  scan = new Scan( new Capture(this, wR, hR, 30) );
  scan.setTime( 2 );
  scan.setGrosor( 7 );
  scan.setPosition( (w/2)-5, h/2 );
  scan.setLoop(true);
  
  setupGUI(); // ver Gui.pde
}
//-----------------------------------------------
void draw() {
  background(255); 
  drawPanelConfig(); 
  scan.procesar();
  scan.draw();
}
//-----------------------------------------------
void keyPressed() {
  if ( (key == 'p') || (key == 'P') ) {
    scan.active( true );
  }
  else if ((key == 's') || (key == 'S')) {
    scan.active( false );
  }
  else if ((key == 'r') || (key == 'R')) {
    scan.reset();
    scan.active( false );
    drawPanel();
  }
}

