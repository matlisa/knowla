float oldAngle=-100, oldDist, pas;
int  nReflections=8; 
//boolean see=false;

void level2() {
  for (TuioObject o : tuioClient.getTuioObjectList()) {
    if (o.getSymbolID()==88) {

      // get location
      int w = o.getScreenX(width);
      int h = o.getScreenY(height);
      int rad = 15;
      
      float an=atan2(h-height/2, w-height/2); 
      float d=dist(w, h, height/2, height/2); 
      
      if ((oldAngle != -100)){
        pushMatrix();
        translate(height/2, height/2);
        for (float a=0; a<TWO_PI; a+=pas) {
          strokeWeight(rad);
          stroke(
      map(h,0,height,200, 255), map(h,0,height,0,200),map(w,0,height,0,100),200);
          float x1 = cos(oldAngle+a)*oldDist;
          float y1 = sin(oldAngle+a)*oldDist;
          float x2 = cos(an+a)*d;
          float y2 = sin(an+a)*d;
          line(x1, y1, x2, y2);
        }
        popMatrix();
      }
      oldAngle = an;
      oldDist=d; 
      
      int totalColor = 0;
      loadPixels();
      for (int i = 0; i < pixels.length; i++) {
        if (pixels[i]!=color(255)){
          pixels[i] = color(255);
          totalColor++;
        }
      }
      //for (int i = 0; i < height; i++) {
      //  for (int j = 0; j < height; j++){
      //    if (pixels[j*width+i]!=-1){
      //      totalColor++;
      //    }
      //  }
      //}
      if ((totalColor > 0.5*height*height)&&
      (nReflections==4)) {
        
        saveFrame("level2.jpg"); 
        level = 2.5;
        alpha = 0;
        countDown = 24;
      }
      else {
        upperLeftText("number of mirrors: "+nReflections, 36, color(0));
        upperRightText((int)(100*(totalColor/(0.5*height*height)))+" % pixels filled to reach goal", 36, color(0));
      }
    }
    else if (o.getSymbolID()==0) {

      float ang = o.getAngle();
      nReflections = (int)(degrees(ang)/30);
      pas=TWO_PI/nReflections; 
      
      reset("dy/door_dy00.jpg");
      upperLeftText("number of mirrors: "+nReflections, 36, color(0));
      lowerLeftText("And now we are in China! Look at how the pattern on the door repeats...", 28, color(0));
      
    }
    else {
      //background(255);
      reset("dy/door_dy00.jpg");
      upperLeftText("try another power", 36, color(0));
      lowerLeftText("And now we are in China! Look at how the pattern on the door repeats...", 28, color(0));
    }
  }
}

void drawKaleidoscope() {
  println("hihi");
  float an=atan2(mouseY-height/2, mouseX-width/2); 
  float d=dist(mouseX, mouseY, width/2, height/2); 
  
  if (oldAngle != -100) {
    
    translate(width/2, height/2);
    for (float a=0; a<TWO_PI; a+=pas) {
      stroke(0);
      float x1 = cos(oldAngle+a)*oldDist;
      float y1 = sin(oldAngle+a)*oldDist;
      float x2 = cos(an+a)*d;
      float y2 = sin(an+a)*d;
      line(x1, y1, x2, y2);
    }
  }
  oldAngle = an;
  oldDist=d; 
      
}

void oldKal(int w, int h){
  int totalColor = 0;
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
