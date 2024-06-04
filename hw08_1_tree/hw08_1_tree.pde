int n = 0; // current depth level of the tree
float initialLength = 175; // initial length of the trunk
float angle = PI/6; // angle between the branches
color startColor = color(139, 0, 139); // Light pink (start color of the gradient)
color endColor = color(173, 216, 230); // Light blue (end color of the gradient)
color[] colors; // Array to store the colors for each depth level

void setup() {
  size(1280, 720); // set the size of the window
  background(0); // set the background color to black
  colors = new color[15]; // initialize the colors array with 15 elements
  computeColors(); // compute the colors for each depth level
  drawTree(); // draw the initial tree
  displayN(); // display the current value of n
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (n < 15) {
      n++; // increase n by 1 if the left mouse button is pressed
    }
  } else if (mouseButton == RIGHT) {
    if (n > 0) {
      n--; // decrease n by 1 if the right mouse button is pressed
    }
  }
  background(0); // clear the background
  drawTree(); // redraw the tree with the new value of n
  displayN(); // update the displayed value of n
}

void computeColors() {
  float totalParts = 0;
  for (int i = 0; i < 15; i++) {
    totalParts += (15 - i) * (15 - i); // increase the weight for initial branches
  }
  
  float cumulativeRatio = 0;
  
  for (int i = 0; i < 15; i++) {
    cumulativeRatio += (15 - i) * (15 - i) / totalParts; // calculate the cumulative ratio for the color interpolation
    float r = lerp(red(startColor), red(endColor), cumulativeRatio); // interpolate the red component
    float g = lerp(green(startColor), green(endColor), cumulativeRatio); // interpolate the green component
    float b = lerp(blue(startColor), blue(endColor), cumulativeRatio); // interpolate the blue component
    colors[i] = color(r, g, b); // store the interpolate color in the colors array
  }
}

void drawTree() {
  background(0); // clear the screen
  pushMatrix();
  translate(width/2, height);
  drawBranch(initialLength, angle, n, 0); // start drawing the tree
  popMatrix();
}

void drawBranch(float length, float angle, int n, int depth){
  if (n == 0){
    return; // stop recursion if n is 0
  }
  
  stroke(colors[depth]); // set the stroke color based on the current depth

  // draw the current branch
  line(0, 0, 0, -length);
  translate(0, -length); // move the origin to the end of the current branch
  float newLength = length * 0.75; // reduce the length for the next branches
  
  pushMatrix();
  rotate(-angle); // rotate left
  drawBranch(newLength, angle, n-1, depth + 1); // draw the left branch
  popMatrix();
  
  pushMatrix();
  rotate(angle); // rotate right
  drawBranch(newLength, angle, n-1, depth + 1); // draw the right branch
  popMatrix();
  
  translate(0, length); // move back to the base of the current branch
}

void displayN() {
  fill(255); // text color to white
  textSize(40); // set the text size
  text("n = " + n, 50, 75); // display the current value of n
}

void draw() {

}
