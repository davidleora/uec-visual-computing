PImage img; // declare an image object to hold the image
void setup() {
  size(120, 150); // size of the canvas = size of the image
  background(255); // white background
  img = loadImage("rocky.jpg"); // load the image
}

void draw() {
  int numEllipses = 30; // set the number of ellipses to be drawn per frame (to make it faster)
  for (int i = 0; i < numEllipses; i++) { // use loop to draw multiple ellipses
    int randomX = int(random(img.width)); // generate random x-coordinate
    int randomY = int(random(img.height)); // generate random y-coordinate
    int c = img.get(randomX, randomY); // get the color of the pixel at random x and y position
    float[] result = calculateSobel(randomX, randomY);
    float angle = result[0] + HALF_PI; // set the angle for rotation (-PI/2 or -45 degrees)
    float magnitude = result[1]; // get the magnitude of the gradient
    float ellipseWidth = constrain(magnitude / 50, 3, 10); // set the width of the ellipse proportional to the magnitude while being constrained to a range
    float ellipseHeight = ellipseWidth / 3; // set the height of the ellipse as a proportion of the width
    float alpha = 150; // set the alpha (transparency) value for the ellipse color
    pushMatrix(); // save the current transformation matrix
    translate(randomX, randomY); // move the origin to random x, y position
    rotate(angle); // rotate the ellipse to allign with the edge direction
    fill(red(c), green(c), blue(c), alpha); // set the fill color of the ellipse
    noStroke(); // disable the stroke
    ellipse(0, 0, ellipseWidth, ellipseHeight); // draw the ellipse
    popMatrix(); // restore the previous transformation matrix
  }
}

float[] calculateSobel(int x, int y) {
  // sobel kernels for x and y gradients
  int[][] sobelX = {
    {-1, 0, 1},
    {-2, 0, 2},
    {-1, 0, 1}
  };
  
  int[][] sobelY = {
    {-1, -2, -1},
    { 0,  0,  0},
    { 1,  2,  1}
  };
  
  // boundary check to prevent accessing the out-of-bounds pixels
  if (x <= 0 || x >= img.width - 1 || y <= 0 || y >= img.height - 1) {
    return new float[] {0, 0}; // or any default value
  }

  float gx = 0; // gradient for x direction
  float gy = 0; // gradient for y direction
  
  // convolution with the sobel kernels (3x3)
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int pixel = img.get(x + i, y + j); // get the neighboring pixel color
      float gray = brightness(pixel); // convert to grayscale by using brightness
      gx += gray * sobelX[i + 1][j + 1]; // apply the x gradient kernel
      gy += gray * sobelY[i + 1][j + 1]; // apply the y gradient kernel
    }
  }
  
  // calculate gradient magnitude and direction
  float magnitude = sqrt(gx * gx + gy * gy); // calculate the magnitude of the gradient
  float angle = atan2(gy, gx); // apply the angle of the gradient
  
  return new float[] {angle, magnitude}; // return the angle and magnitude as an array
}
