
// callbacks for when objects are added, updated or removed

void addTuioObject(TuioObject o) {
  println(
    "add obj",
    o.getSymbolID(), 
    "(" + o.getSessionID() + ")", 
    o.getX(), 
    o.getY(), 
    o.getAngle()
  );
}

void updateTuioObject (TuioObject o) {
  println(
    "set obj ",
    o.getSymbolID(),
    "(" + o.getSessionID() + ")",
    o.getX(),
    o.getY(), 
    o.getAngle(),
    o.getMotionSpeed(),
    o.getRotationSpeed(),
    o.getMotionAccel(),
    o.getRotationAccel()
  );
}

void removeTuioObject(TuioObject o) {
  println(
    "del obj ",
    o.getSymbolID(), 
    "(" + o.getSessionID() + ")"
  );
}


void drawObjects() {
  
  for (TuioObject o : tuioClient.getTuioObjectList()) {
    
    // get location and rotation
    int w = o.getScreenX(width);
    int h = o.getScreenY(height);
    
    int x_pos = width - w;
    //int x_pos = w;
    int y_pos = h;
    
    float ang = o.getAngle();
    float d = 60;
   
    if (o.getSymbolID()==86) {
      
        stroke(206, 215, 229, 50);
        fill(138, 182, 252, 200);
    
        // rectangle, representing the fiducial
        pushMatrix();
        translate(w, h);
        //scale(-1,1); // You had it right!
        rotate(ang);
        rect(-d/2, -d/2, d, d);
        
        // triangle, representing the upwards direction
        stroke(206, 215, 229, 50);
        fill(138, 182, 252, 200);
        triangle(-d/2, -d/2, 0, -d, d/2, -d/2);
        popMatrix();
        // Instead of clearing the background, fade it by drawing
        // a semi-transparent rectangle on top
        fill(204, 120);
        rect(0, 0, width, height);
       
        // If the cursor is over the text, change the position
        if (abs(x_pos - x) < hr &&
            abs(y_pos - y) < vr) {
          x += random(-5, 5);
          y += random(-5, 5);
        }
        fill(0);
        //font = createFont("Roboto", 60);
        //textFont(font); 
        text("tickle", x, y);
    }
    //else if (o.getSymbolID()==88) {
    //  stroke(206, 215, 229, 50);
    //  fill(138, 182, 252, 200);
  
    //  // rectangle, representing the fiducial
    //  pushMatrix();
    //  translate(width-w, h);
    //  //scale(-1,1); // You had it right!
    //  rotate(ang);
    //  rect(-d/2, -d/2, d, d);
      
    //  // triangle, representing the upwards direction
    //  stroke(206, 215, 229, 50);
    //  fill(138, 182, 252, 200);
    //  triangle(-d/2, -d/2, 0, -d, d/2, -d/2);
    //  popMatrix();
      
    //  // draw label on top
    //  int id = o.getSymbolID();
    //  fill(0);
    //  text(id, x_pos, y_pos);
    
    //  fill(85, 100, 125, 25);
    //  ellipse(x_pos,y_pos, 30, 30);
    //}
    else if (o.getSymbolID()==84) {
      strokeWeight(1);
      fill(250, 150, 100, 25);
      
      variableEllipse(w, y_pos, screenPX, screenPY, color(200, 50, 25));
      screenPX = x_pos;
      screenPY = h;
    }
    else if (o.getSymbolID()==85) {
      strokeWeight(1);
      //fill(100, 255, 50, 25);
      fill(colorPicker, 100);
      variableEllipse(w, y_pos, screenPX, screenPY,color(0));
      screenPX = w;
      screenPY = y_pos;
    }
    else if (o.getSymbolID()==87) {
      background(0);
      //flower(150*t + 50, 4, 5, 100, 68, 0.45*t + 0.1, 0.6, PI*(1-t));
      //flower(150*t + 50, 4, 5, 100, (float)(0.25*Math.sqrt(w)), 0.45*t + 0.1, 0.6, PI*(1-w));
      //flower((float)(20*Math.sqrt(h)), 4, 5, 100,68,(float)(0.25*Mathlevel.sqrt(w)), 0.6, w);
      //flower((float)(11*Math.sqrt(h)), 4, 5, 10, 80,(float)(0.25*Math.sqrt(w)), 0.6, w);
      flower((float)(12*Math.sqrt(h)), 4, 5, 20,60,(float)(0.25*Math.sqrt(w)), 0.6, w);
    }
    else if (o.getSymbolID()==88) {
      int rad = 15;
      
      float an=atan2(h-height/2, w-width/2); 
      float distance=dist(w, h, width/2, height/2); 
      
      if ((oldAngle != -100)){
        pushMatrix();
        translate(width/2, height/2);
        for (float a=0; a<TWO_PI; a+=pas) {
          strokeWeight(rad);
          stroke(
      map(h,0,height,0, 255), map(h,0,height,0,255),map(w,0,width,0,255),200);
          float x1 = cos(oldAngle+a)*oldDist;
          float y1 = sin(oldAngle+a)*oldDist;
          float x2 = cos(an+a)*distance;
          float y2 = sin(an+a)*distance;
          line(x1, y1, x2, y2);
        }
        popMatrix();
      }
      oldAngle = an;
      oldDist=distance; 
    }
    else if (o.getSymbolID()==89) {  
      int rad = 50;
      fill(colorPicker, 100);
      //stroke(255);
      ellipse(w, h, rad, rad);
    }
    else if (o.getSymbolID()==90) {      
      int r = (int)map(w, 0, width, 0, 255); 
      int g = (int)map(h, height, 0, 0, 255);
      int b = (int)map(degrees(ang), 0, 360, 0, 255);
      //int b = 230;
      
      int rad = 100;
      colorPicker = color(r, g, b);
      fill(r, g, b);
      //stroke(255);
      
      ellipse(150, 700, rad, rad);
      //lowerLeftText("Color Picker", 36, color(0));
      textAlign(LEFT);
      textSize(36);
      text("Color Picker", 100, 840);
    }
    else if (o.getSymbolID()==0) {
      nReflections = (int)(degrees(ang)/30);
      pas=TWO_PI/nReflections; 
      reset("white_white.jpg");
      upperLeftText("Draw a door that shows where you want to go.", 36,color(0));
    }
    //screenPX = x_pos;
    //screenPY = y_pos;
    //screenPX = w;
    //screenPY = h;
  }
  
}

void next() {
  for (TuioObject o : tuioClient.getTuioObjectList()) {
    if (o.getSymbolID()==90) {
      level+=0.5;
      countDown = 24;
    }
  }
}
