
// Simplified + beuatified version of the TUIO demo
// @bitcraftlab 2017

// also shows the video stream (experimental)

import TUIO.*;
TuioProcessing tuioClient;

PFont font;

PGraphics buffer;

PImage bg;
PImage cur;

Animation sidi, dy;

int screenPX, screenPY = 0;

int level = 0;

//int frame = 0;
int countDown = 24;
int transparency = 255;
int l0_range1, l0_range2;

float t = abs(sin(frameCount*0.005));

String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text


PImage img;
int slices = 12;
float angle = PI/slices;
PShape mySlice;
float radius;


void setup() {
  
  frameRate(24);
  size(1600, 900);
  //fullScreen();
  //background(255);
  fill(0);
  font = createFont("Bahnschrift", 50);
  //textAlign(CENTER, CENTER);
  textFont(font);
 
  // level 0 opening
  reset("door_landing.jpg");
  cur = loadImage("key.png");
  //text("test", 100, 100);
  
  size(1600,900);
  buffer = createGraphics(width, height, JAVA2D); 
  
  //particles = new ArrayList<Particle>();
  
  smooth();
  
  // door 1
  sidi = new Animation("sidi/door_sidi", countDown+1);
  dy = new Animation("dy/door_dy", countDown+1);


  tuioClient  = new TuioProcessing(this);
  
  //setupVideo();
  //drawVideo();
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
  

}

void reset(String image) {
  bg = loadImage(image);
  background(bg);
  
}

void draw() {

  playLevel(level);
  
  
  // test
  //stroke(200, 200, 255);
  //fill(200, 200, 255);
  //ellipse(mouseX,mouseY,10,10);
}

void playLevel(int i) {
  if (i == 0) {
    level0();
  }
  else if (i == 1) {

    PImage l0 = loadImage("level0.jpg");
    
    //if (transparency > 0) { transparency -= 10; }
    //tint(255, transparency);
    //image(l0, 0, 0);
    
    if (countDown == 0) {
      tint(255,100);
      level1();
    }
    else if (countDown == 1) {
      reset("sidi/door_sidi00.jpg");
      countDown--;
      //frame = 0;
    }
    else {
      
      transparency = transparency-10;
      background(255);
      tint(255,transparency);
      image(l0, 0,0);
      
      countDown--;
    }
  }
  else if (i == 2) {
    
    sidi.display(0,0);
    //pushMatrix();
    //rotate(radians(180));
    //image(cur, 1377, 666, 45, 100);
    //popMatrix();

    if (countDown == 0) {
      level2();
    }
    else if (countDown == 1) {
      //background(255);
      reset("dy/door_dy00.jpg");
      countDown--;
      //frame = 0;
    }
    else {
      countDown--;
      //pushMatrix();
      //translate(780, 400);
      //rotate(PI);
      //image(cur, 0, 0, 45, 100);
      //popMatrix();

    }
  }
  else if (i == 3) {
    dy.display(0,0);
    if (countDown == 0) {
      level3();
    }
    else if (countDown == 1) {
      background(255);
      countDown--;
    }
    else {
      countDown--;
    }
  }
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

// Class for animating a sequence of GIFs
// https://processing.org/examples/animatedsprite.html
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i,2) + ".jpg";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
      if (frame < imageCount-1) {
        frame = (frame+1) % imageCount;
        image(images[frame], xpos, ypos);
      }
  }
  
  //int getWidth() {
  //  return images[0].width;
  //}
}
