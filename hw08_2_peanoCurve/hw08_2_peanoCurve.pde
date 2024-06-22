int order = 1; // order of the peano curve
float length; // length of each segment
float cx, cy; // current position of the turtle
float turtleangle = 0; // current angle of the turtle

void setup() {
  size(1000, 1040); // set the canvas size
  background(0); // set the background color to black
  stroke(255); // set the stroke color to white
  noLoop();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (order < 8) {
      order++; // increase order by 1 if the left mouse button is pressed
    }
  } else if (mouseButton == RIGHT) {
    if (order > 1) {
      order--; // decrease order by 1 if the right mouse button is pressed
    }
  }
  length = (width - 40) / (float)(pow(2, order)); // recalculate the length of each segment
  cx = 0; // reset the initial x position of the turtle
  cy = 0; // reset the initial y position of the turtle
  turtleangle = 0; // reset the turtle angle
  redraw();
}

void draw() {
  background(0); // clear the background
  pushMatrix();
  translate(length / 2 + 20, height - length / 2 - 20); // move the origin to the starting point
  peano(order, 90); // redraw the peano curve with the new value of order
  popMatrix();
  displayN(); // display the current value of n
}

// recursive function to draw the peano curve
void peano(int level, float angle) {
  if (level == 0) {
    return;
  }

  rotation(-angle); // rotate left
  peano(level - 1, -angle); // recursive call with level-1 and inverted angle

  forward(length); // move forward by the length of one segment

  rotation(angle); // rotate right
  peano(level - 1, angle); // recursive call with level-1 and the given angle

  forward(length); // move forward by the length of one segment

  peano(level - 1, angle); // recursive call with level-1 and the given angle

  rotation(angle); // rotate right
  forward(length); // move forward by the length of one segment

  peano(level - 1, -angle); // recursive call with level-1 and inverted angle
  rotation(-angle); // rotate left
}

void forward(float amount) {
  float newX = cx + cos(radians(turtleangle)) * amount; // calculate the new x position
  float newY = cy + sin(radians(turtleangle)) * amount; // calculate the new y position
  line(cx, cy, newX, newY); // draw a line from the current position to the new position
  cx = newX; // update the current x position
  cy = newY; // update the current y position
}

void rotation(float degrees) {
  turtleangle = turtleangle + degrees; // update the turtle's angle by adding the given degrees
}

void displayN() {
  fill(255); // text color to white
  textSize(40); // set the text size
  text("N = " + order, width / 2 - 40, 45); // display the current value of n
}
