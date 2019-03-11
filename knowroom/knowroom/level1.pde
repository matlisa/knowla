void level1() {
  
  for (TuioObject o : tuioClient.getTuioObjectList()) {
    if (o.getSymbolID()==89) {
      
      // get location and rotation
      int w = o.getScreenX(width);
      int h = o.getScreenY(height);
      
      //int x_pos = width - w;
      //int x_pos = w;
      //int y_pos = h;
      
      //float ang = o.getAngle();
      //float d = 60;
  
      int r_match = 20;
      int g_match = 150;
      int b_match = 230;
      
      int rad = 50;
      
      int r = (int)map(w, 0, width, 0, l0_range1); 
      int g = (int)map(h, 0, height, l0_range2, 255);
      //int b = (int)ang;
      int b = 230;
      
      fill(255);
      //stroke(0);
      rect(80,50,500,75);
      fill(0);
      
      text("r: "+r + " g:"+g+" b:" +b, 100, 100);
      
      if (abs(r - r_match) < 10 &&
        abs(g - g_match) < 10 &&
        abs(b - b_match) < 10) {
        //background(r, g, b);
        //background(bg);
        //font = createFont("Arial", 60);
        //textFont(font); 
        //text("ya did it", w, h);
        
        r = r_match;
        g = g_match;
        b = b_match;
        
        
        level = 2;
        saveFrame("level1.jpg"); 
        countDown = 24;
        //reset("Doors_test.jpg");
      }
      else {

        if (!(w > 1260-rad && h > 465-rad)){ 
          noStroke();
          fill(r, g, b);
          ellipse(w, h, rad, rad);
          
          //fill(r_match, g_match, b_match);
          //ellipse(600, 100, 100, 100);
          //background(bg);
        }
      }
    }
    else {
      text("try another fiducial", 100, 100);
    }
  }
}
