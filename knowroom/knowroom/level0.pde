ArrayList<Particle> particles;

void level0() {
  
  for (TuioObject o : tuioClient.getTuioObjectList()) {
    
    // get location and rotation
    int w = o.getScreenX(width);
    int h = o.getScreenY(height);
    
    float ang = o.getAngle();
    //float d = 60;    
    int deg = (int)degrees(ang);
    
    int r = (int)random(0, 255);
    int g = (int)random(0, 255);
    int b = 255;
   
    //filter(BLUR, 5);
    
    //buffer.beginDraw(); 
    //Particle p;
    //p = new Particle(new PVector(w, h));
    //particles.add(p);

    //buffer.endDraw();
    
    // overlay the buffer on the applet
    //image(buffer, 0, 0);
    
    
    pushMatrix();
    translate(w, h);
    rotate(ang);
    image(cur, 0, 0, 45, 100);
    stroke(255);
    tint(r, g, b, 25);
    // triangle, representing the upwards direction
    //stroke(255);
    //fill(138, 182, 252, 20);
    //triangle(-d/4, -d/4, 0, -d, d/4, -d/4);
    popMatrix();
    
    fill(255);
    //stroke(0);
    rect(80,50,275,75);
    fill(0);
    
    text("angle: "+deg, 100, 100);
    
    //rect(1355, 480, 45, 100);
    if ((abs(deg - 180) < 10)&&
        (abs(w - 1355) < 45) &&
        (abs(h - 480) < 100)){
      tint(255, 255);

      level = 1;
      l0_range1 = (int)random(200,255);
      l0_range2 = (int)random(0, 55);
      //countDown = 100;

      saveFrame("level0.jpg"); 
    }
    
  }
  //if (particles.size() > 15) {
  //  particles.remove(0);
  //}
  //for (int i = particles.size()-1; i >= 0; i--) {
  //  Particle p = particles.get(i);
  //  p.run();
  //  if (p.isDead()) {
  //    particles.remove(i);
  //  }
  //  println("PARTICLE ", i, p.isDead());
  //}
  
  
}
