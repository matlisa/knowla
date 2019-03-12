void upperLeftText(String str, int size, color col){
  fill(255);
  //stroke(0);
  noStroke();
  rect(80,50,600,75);
  fill(col);
  textAlign(LEFT);
  textSize(size);
  text(str, 100, 100);
}

void upperRightText(String str, int size, color col) {
  fill(255);
  //stroke(0);
  noStroke();
  rect(880,50,700,75);
  fill(col);
  textAlign(LEFT);
  textSize(size);
  text(str, 900, 100);
}
