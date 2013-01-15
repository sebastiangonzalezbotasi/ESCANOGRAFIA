void setupGUI() {

  logo = loadImage("logo/modelo.png");
  font = loadFont("ArialMT-14.vlw"); 
  textFont(font, 12);
}

void drawPanelConfig() {
  rectMode(CORNER);
  noStroke();
  fill( 100 );
  rect( 0, 0, controlPanelWidth, height);
  image( logo, controlPanelWidth/2, (height - (logo.height/2)) - 20);

  String comandos = "\n";
  comandos += "********************************************\n";
  comandos += " COMANDOS                                   \n";
  comandos += " >> S = Stop                                \n";
  comandos += " >> P = Play                                \n";
  comandos += " >> R = Reiniciar                           \n";
  comandos += " >> ESC = Salir                             \n";
  comandos += "********************************************\n";

  fill( 255 );
  text( comandos, 10, 10 );


}

void drawPanel(){
  rectMode(CORNER);
  noStroke();
  fill( 255 );
  rect( controlPanelWidth, 0, (width-controlPanelWidth), height);

}

