import processing.video.*;
Capture cam;

void setupVideo() {
  
    // if you have several cameras, select your resolution, name and framerate from the list!
    // println(Capture.list());
    // cam = new Capture(this, 1280, 720, "Microsoft® LifeCam Cinema(TM)", 30);
    
    cam = new Capture(this);
    cam.start();
    
}

void drawVideo() {
  
  if (cam != null && cam.available() == true) {
    
    // get an image from the camera
    cam.read();
    
    // scale to full screen - ignoring aspect ratio
    image(cam, 0, 0, width, height);
  }
  
}
