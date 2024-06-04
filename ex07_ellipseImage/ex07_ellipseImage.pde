PImage img; // declare an image object to hold the image
void setup() {
  size(120, 150); // size of the canvas = size of the image
  background(255); // white background
  img = loadImage("rocky.jpg"); // load the image
}

void draw() {
  int numEllipses = 20; // set the number of ellipses to be drawn per frame (to make it faster)
  for (int i = 0; i < numEllipses; i++) { // use loop to draw multiple ellipses
    int randomX = int(random(img.width)); // generate random x-coordinate
    int randomY = int(random(img.height)); // generate random y-coordinate
    int c = img.get(randomX, randomY); // get the color of the pixel at random x and y position
    float angle = - HALF_PI / 2; // set the angle for rotation (-PI/2 or -45 degrees)
    float alpha = 150; // set the alpha (transparency) value for the ellipse color
    pushMatrix(); // save the current transformation matrix
    translate(randomX, randomY); // move the origin to random x, y position
    rotate(angle); // rotate the ellipse
    fill(red(c), green(c), blue(c), alpha); // set the fill color 
    noStroke(); 
    ellipse(0, 0, 7, 2); // draw the ellipse
    popMatrix(); // restore the previous transformation matrix
  }
}
