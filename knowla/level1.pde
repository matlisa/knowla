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
      int g = (int)map(h, height, 0, l0_range2, 255);
      //int b = (int)ang;
      int b = 230;
      
      fill(r, g, b);
      upperLeftText("r: "+r + " g:"+g+" b:" +b, 48, color(r, g, b));
      
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
        
        
        
        saveFrame("level1.jpg"); 
        level = 1.5;
        alpha = 0;
        countDown = 24;
        //reset("Doors_test.jpg");
      }
      else {

        if (!(w > 1260-rad && h > 465-rad)){ 
          //noStroke();
          stroke(255);
          
          ellipse(w, h, rad, rad);
          
          //fill(r_match, g_match, b_match);
          //ellipse(600, 100, 100, 100);
          //background(bg);
        }
      }
    }
    else {
      upperLeftText("try another power", 36, color(0));
      lowerLeftText("Hey look, we are in Tunisia. This door has a unique color...", 30, color(0));
    }
  }
}
