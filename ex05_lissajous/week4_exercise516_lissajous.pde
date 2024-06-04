// FOLIUM OF DESCARTES IS NOT DONE YET !!!!!!

void setup(){
   size(600, 600); // height must be equal to width
   background(255);
   drawGrid();
   drawLissajous();
}

void drawGrid(){ // draw grids
  int maxVal = 10; // -10 <= x, y <= 10
  int unitPixels = width / maxVal / 2; // grid interval(pixels/unit) = 600 / 10 / 2 = 30
  int xc = width / 2, yc = height / 2; // xc = 300, yc = 300
  
  strokeWeight(1);
  stroke(144, 238, 144, 120); // set the grid color other than x-axis and y-axis
  
  // line syntax : line(x1, y1, x2, y2);
  // x1, y1 : starting point of the line
  // x2, y2 : ending point of the line
  for(int i = 1 - maxVal; i < maxVal; i++){
    line(0, unitPixels * i + xc, width, unitPixels * i + yc);
    line(unitPixels * i + xc, 0, unitPixels * i + yc, height);
  }
  
  stroke(0);
  strokeWeight(2);
  line(0, yc, width, yc); // x-axis
  line(xc, 0, xc, height);  // y-axis
  
  textSize(15);
  fill(0);
  
  // Set text characteristics for x-axis
  textAlign(CENTER, TOP);
  text("0", 300 - 6, 300 + 6);
  for(int i = -maxVal+1; i < maxVal; i++) {
    if (i != 0){
      text(i, unitPixels * i + xc, yc + 6);
    }
  }
  
  // Set text characteristics for y-axis
  textAlign(RIGHT, CENTER);
  for(int i = -maxVal+1; i < maxVal; i++) {
    if (i != 0){
      text(i, xc - 6, unitPixels * i + yc);
    }
  }
}

void drawLissajous() {
  int A = width / 2; // amplitude of X
  int B = height / 2; // amplitude of Y
  int a = 6; // frequency of X ( Ratio is 5:6 )
  int b = 5; // frequency of Y
  float delta = PI / 2; // phase difference
  
  stroke(0);
  strokeWeight(2);
  noFill();
  
  translate(width / 2, height / 2); // Center the drawing coordinates (300, 300)
  rotate(PI/2); // rotate the lissajous by 90 degrees
  
  // start drawing the lissajous
  beginShape();
  for (float t = 0; t < TWO_PI; t += 0.01) {
    float x = A * sin(a * t + delta); // Compute X using Lissajous formula
    float y = B * sin(b * t); // Compute Y using Lissajous formula
    vertex(x, y);
  }
  endShape(CLOSE);
}
