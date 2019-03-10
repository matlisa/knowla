
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
    int y_pos = h;
    
    float ang = o.getAngle();
    float d = 60;

    if (o.getSymbolID()==86) {
      
        stroke(206, 215, 229, 50);
        fill(138, 182, 252, 200);
    
        // rectangle, representing the fiducial
        pushMatrix();
        translate(width-w, h);
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
        font = createFont("Roboto", 60);
        textFont(font); 
        text("tickle", x, y);
    }
    //else if (o.getSymbolID()==85) {
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
    else if (o.getSymbolID()==0) {
      fill(255, 100, 125, 25);
      variableEllipse(x_pos, y_pos, screenPX, screenPY);
      screenPX = w;
      screenPY = h;
    }
    else if (o.getSymbolID()==85) {
      fill(100, 255, 50, 25);
      variableEllipse(x_pos, y_pos, screenPX, screenPY);
      screenPX = x_pos;
      screenPY = y_pos;
    }
    //screenPX = x_pos;
    //screenPY = y_pos;
    //screenPX = w;
    //screenPY = h;
  }
  
}
