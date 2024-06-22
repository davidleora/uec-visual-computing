void setup(){
  size(700, 700);
  background(0);
  drawGrid();
  simpleBezier();
}


void drawGrid(){
  int maxVal = 35; // -10 <= x, y <= 10
  int unitPixels = width / maxVal / 2; // grid interval(pixels/unit) = 600 / 10 / 2 = 30
  int xc = width / 2, yc = height / 2; // xc = 300, yc = 300

  stroke(255, 255, 255, 150);
  strokeWeight(0.5);
  for(int i = 1 - maxVal; i < maxVal; i++){
    line(0, unitPixels * i + xc, width, unitPixels * i + yc);  // horizontal grid : 0, 30, 600, 30
    line(unitPixels * i + xc, 0, unitPixels * i + yc, height); // vertical grid : 30, 0, 30, 600
  }
}

void simpleBezier(){
  noFill();
  stroke(0, 255, 0);
  strokeWeight(4);
  int x1 = 50, y1 = 400, x2 = 150, y2 = 150, x3 = 600, y3 = 50, x4 = 450, y4 = 400;
  
  bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  
  stroke(0, 0, 255);
  strokeWeight(3);
  line(x1, y1, x2, y2);
  line(x2, y2, x3, y3);
  line(x3, y3, x4, y4);
  
  fill(255, 0, 0);
  noStroke();
  float dotSize = 10;
  ellipse(x1, y1, dotSize, dotSize);
  ellipse(x2, y2, dotSize, dotSize);
  ellipse(x3, y3, dotSize, dotSize);
  ellipse(x4, y4, dotSize, dotSize);
}
