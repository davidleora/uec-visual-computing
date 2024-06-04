int n = 0;

void setup() {
  size(1000, 900);
  background(255); // set the background to white
  textSize(20); // set the text size for displaying the number of triangles
  displayNumberOfTriangles(); // display the number of triangles in words and numbers
  drawSierpinskiTriangle(); // draw the initial sierpinski triangle and use the recursion to draw white triangles
}

void draw() {
  // draw is kept empty to make sure the loop is going
}

void mousePressed() {
  println("Mouse pressed"); // debugging process
  if (mouseButton == LEFT) { 
    println("Left button pressed");
    if (n < 8) {
      n++; // increment n if it's less than 8
    }
  } else if (mouseButton == RIGHT) {
    println("Right button pressed"); // debugging process
    if (n > 0) {
      n--; // decrement n if it's greater than 0
    }
  }
  background(255); // clear the background
  displayNumberOfTriangles(); // update the display of the number of triangles
  drawSierpinskiTriangle(); // redraw the sierpinski triangle with the new n value
}

void displayNumberOfTriangles() {
  int numberOfTriangles = (int)pow(3, n); // calculate the number of triangles
  fill(0); // set text color to black
  text("n = " + n + ": " + numberOfTriangles + " triangles", 50, 50); // display the number of triangles
}

void drawSierpinskiTriangle() {
  float side = width - 40; // length of the side of the triangle
  float height = (sqrt(3) / 2) * side; // height of the equilateral triangle
  
  float x1 = width / 2;
  float y1 = 20;
  float x2 = x1 - (side / 2);
  float y2 = y1 + height;
  float x3 = x1 + (side / 2);
  float y3 = y2;
  
  fill(0); // set the fill color to black
  triangle(x1, y1, x2, y2, x3, y3); // draw the large black triangle
  drawSierpinski(x1, y1, x2, y2, x3, y3, n); // start the recursive drawing of the sierpinski triangle
}

void drawSierpinski(float x1, float y1, float x2, float y2, float x3, float y3, int n) {
  if (n > 0) {
    // calculate the midpoints of the sides of the triangle
    float mx1 = (x1 + x2) / 2;
    float my1 = (y1 + y2) / 2;
    float mx2 = (x2 + x3) / 2;
    float my2 = (y2 + y3) / 2;
    float mx3 = (x3 + x1) / 2;
    float my3 = (y3 + y1) / 2;
    
    fill(255); // set fill color to white
    triangle(mx1, my1, mx2, my2, mx3, my3); // draw the white triangle to create the hole
    
    // recursively draw the smaller sierpinski triangles
    drawSierpinski(x1, y1, mx1, my1, mx3, my3, n-1);
    drawSierpinski(mx1, my1, x2, y2, mx2, my2, n-1);
    drawSierpinski(mx3, my3, mx2, my2, x3, y3, n-1);
  }
}
