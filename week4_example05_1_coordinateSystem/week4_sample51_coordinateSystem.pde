void setup(){
   size(600, 600); // height must be equal to width
   background(255);
   drawGrid();
}

void drawGrid(){ // draw grids
  int maxVal = 10; // -10 <= x, y <= 10
  int unitPixels = width / maxVal / 2; // grid interval(pixels/unit) = 600 / 10 / 2 = 30
  int xc = width / 2, yc = height / 2; // xc = 300, yc = 300

  stroke(144, 238, 144); // set the grid color other than x-axis and y-axis
  
  // line syntax : line(x1, y1, x2, y2);
  // x1, y1 : starting point of the line
  // x2, y2 : ending point of the line
  
  for(int i = 1 - maxVal; i < maxVal; i++){
    line(0, unitPixels * i + xc, width, unitPixels * i + yc);  // horizontal grid : 0, 30, 600, 30
    line(unitPixels * i + xc, 0, unitPixels * i + yc, height); // vertical grid : 30, 0, 30, 600
  }
  stroke(0);
  line(0, yc, width, yc); // x-axis
  line(xc, 0, xc, height);  // y-axis
}
