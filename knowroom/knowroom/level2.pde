void level2() {
  for (TuioObject o : tuioClient.getTuioObjectList()) {
    if (o.getSymbolID()==84) {
      
      // get location and rotation
      int w = o.getScreenX(width);
      int h = o.getScreenY(height);
      
      int x_pos = width - w;
      //int x_pos = w;
      int y_pos = h;

      fill(255, 100, 125, 25);
      variableEllipse(w, y_pos, screenPX, screenPY);
      screenPX = x_pos;
      screenPY = h;
      
      
      ellipse(300,200,200,200);
      fill(255);
      text(x_pos, 300, 200);
      if (x_pos == 500) {
        level = 3;
      }
    }
  }
}
