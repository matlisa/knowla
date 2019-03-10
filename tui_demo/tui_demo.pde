
// Simplified + beuatified version of the TUIO demo
// @bitcraftlab 2017

// also shows the video stream (experimental)

import TUIO.*;
TuioProcessing tuioClient;

PFont font;

String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

int screenPX, screenPY = 0;

void setup() {
  
  frameRate(60);
  
  size(750, 500);
  //fullScreen();
  background(255);
  
  noCursor();
  noStroke();
  fill(0);
  
  font = createFont("Roboto", 12);
  textFont(font); 
  tuioClient  = new TuioProcessing(this);
  
  //setupVideo();
  //drawVideo();
  
  // Create the font
  textAlign(CENTER, CENTER);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}


void draw() {

  drawBlobs();
  drawCursors();
  drawObjects();
  drawGrid();
  
  // test
  //stroke(200, 200, 255);
  //fill(200, 200, 255);
  //ellipse(mouseX,mouseY,10,10);
}

void keyPressed() {
  saveFrame("screenshot.png"); 
}

void refresh(TuioTime t) {
  println(
    "frame", 
    "#" + t.getFrameID(), 
    " (" + t.getTotalMilliseconds() + ")"
  );
}

void variableEllipse(int x,int y,int px,int py) {
  int speed = abs(x - px) + abs(y - py);
  stroke(speed);
  ellipse(x, y, speed, speed);
}
