
// Simplified + beuatified version of the TUIO demo
// @bitcraftlab 2017

// also shows the video stream (experimental)

import TUIO.*;
TuioProcessing tuioClient;
String person;

PFont font;

PGraphics buffer;

PImage bg;
PImage cur;

Animation sidi, dy;

int screenPX, screenPY = 0;

float level = 0;

//int frame = 0;
int countDown = 24;
int transparency = 255;
int alpha = 0;
int l0_range1, l0_range2;

color colorPicker;

float t = abs(sin(frameCount*0.005));

String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  person = "eszter";
  frameRate(24);
  size(1600, 900);
  //fullScreen();
  
  background(255);
  fill(0);
  font = createFont("Bahnschrift", 48);
  //textAlign(CENTER, CENTER);
  textFont(font);
 
  // level 0 opening
  update("door_landing.png");
  cur = loadImage("key.png");
  
  size(1600,900);
  //buffer = createGraphics(width, height, JAVA2D); 
  
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
  
  pas=TWO_PI/nReflections; 
  colorPicker = color(100, 255, 50, 25);
}

void reset(String image) {

  //background(255);
  tint(255,255);
  bg = loadImage(image);
  background(bg);
}

void update(String image) {
  background(255);
  tint(255,255);
  bg = loadImage(image);
  image(bg, 0, 0);
  //background(bg);
  
}
  

void draw() {
  playLevel(level);
}

void playLevel(float i) {
  

  if (i == 0) {
    level0();
  }
  else if (i == 0.5) {
    explanation("explanation_level0.jpg");
  }
  else if (i == 1) {
    PImage l0 = loadImage("level0.jpg");
    //if (transparency > 0) { transparency -= 10; }
    //tint(255, transparency);
    //image(l0, 0, 0);
    
    if (countDown == 0) {
      //tint(255,100);
      
      lowerLeftText("Hey look, we are in Tunisia. This door has a unique color...", 30, color(0));
      level1();
    }
    else if (countDown == 1) {
      reset("sidi/door_sidi00.jpg");
      countDown--;
    }
    else {
      transparency = transparency-10;
      background(255);
      tint(255,transparency);
      image(l0, 0,0);
      lowerLeftText("Teleporting...", 30, color(random(155,255)));
      countDown--;
    }
  }
  else if (i == 1.5) {
    explanation("explanation_level1.jpg");
  }
  else if (i == 2) {
    
    sidi.display(0,0);
    //pushMatrix();
    //rotate(radians(180));
    //image(cur, 1377, 666, 45, 100);
    //popMatrix();

    if (countDown == 0) {
      //tint(255,100);
      lowerLeftText("And now we are in China! Look at how the pattern on the door repeats...", 28, color(0));
      level2();
    }
    else if (countDown == 1) {
      reset("dy/door_dy00.jpg");
      countDown--;
    }
    else {
      lowerLeftText("Teleporting...", 30,  color(random(155,255)));
      countDown--;
      //pushMatrix();
      //translate(780, 400);
      //rotate(PI);
      //image(cur, 0, 0, 45, 100);
      //popMatrix();
    }
  }
  else if (i == 2.5) {
    explanation("explanation_level2.jpg");
  }
  else if (i == 3) {
    dy.display(0,0);
    if (countDown == 0) {
      tint(255,100);
      level3();
    }
    else if (countDown == 1) {
      background(255);
      countDown--;
    }
    else {
      lowerLeftText("Teleporting...", 30,  color(random(155,255)));
      countDown--;
    }
  }
}

void keyPressed() {
  int d = day();    // Values from 1 - 31
  int m = month();  // Values from 1 - 12
  int y = year();
  int h = hour();
  int mi = minute();
  saveFrame("screenshot/screenshot"+y+m+d+h+mi+".png"); 
}


void refresh(TuioTime t) {
  println(
    "frame", 
    "#" + t.getFrameID(), 
    " (" + t.getTotalMilliseconds() + ")"
  );
}

void variableEllipse(int x,int y,int px,int py, color col) {
  int speed = abs(x - px) + abs(y - py);
  stroke(col, 255-speed);
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
        tint(255,100);
      }
  }
  
  //int getWidth() {
  //  return images[0].width;
  //}
}

void explanation(String imagePath){
  PImage exp0 = loadImage(imagePath);
  
  if (countDown == 0) {
    next();
  }
  else {
    alpha += 10;
    background(255);
    tint(255,alpha);
    image(exp0, 0,0);
    countDown--;
  }
}
