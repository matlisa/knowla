

//float offset = 0;

void level2() {
  for (TuioObject o : tuioClient.getTuioObjectList()) {
    if (o.getSymbolID()==88) {
      int totalColor = 0;
      // get location and rotation
      int w = o.getScreenX(width);
      int h = o.getScreenY(height);
      
      //int x_pos = width - w;
      //int x_pos = w;
      //int y_pos = h;
      
      //float ang = o.getAngle();
      //float d = 60;
      
      noStroke();
      fill(
          map(h,0,height,200, 255), map(h,0,height,0,200),map(w,0,height,0,100),200);
      ellipse(w, h, 20, 20);
      ellipse(w, height-h, 20, 20);
      ellipse(height-w, h, 20, 20);
      ellipse(height-w, height-h, 20, 20);
      ellipse(h, w, 20, 20);
      ellipse(h, height-w, 20, 20);
      ellipse(height-h, w, 20, 20);
      ellipse(height-h, height-w, 20, 20);
      
      loadPixels();
      for (int i = 0; i < height; i++) {
        for (int j = 0; j < height; j++){
          if (pixels[j*width+i]!=-1) {
            totalColor++;
          }
        }
      }
      if (totalColor > 405000) {
        level = 3;
        saveFrame("level2.jpg"); 
        countDown = 24;
      }
    }
    else {
      //background(255);
      reset("dy/door_dy00.jpg");
      text("try another fiducial", 100, 100);
    }
  }
}
