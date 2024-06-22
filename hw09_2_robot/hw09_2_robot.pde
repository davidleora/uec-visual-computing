PFont font;

void setup() {
  size(800, 800, P3D); // Set the canvas size and use P3D renderer
  noStroke(); // Disable outline
  smooth(); // Enable smoothing
  font = createFont("Comic Sans MS", 32, true); // Load Comic Sans font with larger size
  textFont(font); // Set the font
  textMode(SHAPE); // Set the text mode to SHAPE (to disable the text background)
}

void draw() {
  background(0); // Clear the screen with a black background
  translate(width/2, height/2, 0); // Move the origin to the center of the screen
  rotateX(map(mouseY, 0, height, PI, -PI)); // Rotate around Y-axis by mouseY
  rotateY(map(mouseX, 0, width, -PI, PI)); // Rotate around X-axis by mouseX
  drawAxis('X', color(255, 0, 0, 120)); // X-axis + YZ-plane
  drawAxis('Y', color(0, 255, 0, 120)); // Y-axis + XZ-plane
  drawAxis('Z', color(0, 0, 255, 120)); // Z-axis + XY-plane
  drawRobot(); // Draw robot
}

void axis(char s, color c) {
  int len = 400; // Length of the axis
  fill(c); // Set the fill color for the axis
  stroke(c); // Set the stroke color for the axis
  box(len, 1, 1); // Draw the axis
  
  // Draw the sphere and text label
  pushMatrix();
    translate(len/2, 0, 0);
    sphere(3);
    text(s, 10, 10, 0);
  popMatrix();
  
  // Draw the grid lines
  pushMatrix();
    translate(0, -len/2, -len/2);
    int ngrids = 20;
    int xs = len/ngrids, ys = len/ngrids;
    for (int i = 1; i < ngrids; i++) {
      line(0, 0, ys * i, 0, len, ys * i );
      line(0, xs * i, 0, 0, xs * i, len);
    }
  popMatrix();
}

void drawAxis(char s, color c) {
    switch(s) {
      case 'X': 
        axis(s, c); // Draw the X-axis
        break;
      case 'Y': 
        pushMatrix();
          rotateZ(PI/2); // Rotate 90 degrees around the Z-axis
          axis(s, c); // Draw the Y-axis
        popMatrix();
        break;
      case 'Z': 
        pushMatrix();
          rotateY(-PI/2); // Rotate 90 degrees around the Y-axis
          axis(s, c); // Draw the Z-axis
        popMatrix();
        break;
    }
}

void drawRobot() {
  fill(200); // Set the fill color for the robot parts
  stroke(100); // Set the stroke color for the robot parts
  
  pushMatrix();
  translate(0, -50, 0); // Move the robot up slightly
  
    // Head
    pushMatrix();
      translate(0, -235, 0);
      box(65, 45, 35);
      drawEyes();
    popMatrix();
  
    // Body
    pushMatrix();
      translate(0, -145, 0);
      box(100, 125, 50);
    popMatrix();
  
    // Left Arm (Outer)
    pushMatrix();
      translate(-135, -190, 0);
      box(50, 30, 30);
    popMatrix();
    
    // Left Arm (Inner)
    pushMatrix();
      translate(-80, -190, 0);
      box(50, 30, 30);
    popMatrix();
  
    // Right Arm (Inner)
    pushMatrix();
      translate(80, -190, 0);
      box(50, 30, 30);
    popMatrix();
    
    // Right Arm (Outer)
    pushMatrix();
      translate(135, -190, 0);
      box(50, 30, 30);
    popMatrix();
  
    // Left Leg (Upper)
    pushMatrix();
      translate(-25, -50, 0);
      box(30, 60, 30);
    popMatrix();
    
    // Left Leg (Lower)
    pushMatrix();
      translate(-25, 15, 0);
      box(30, 60, 30);
    popMatrix();
  
    // Right Leg (Upper)
    pushMatrix();
      translate(25, -50, 0);
      box(30, 60, 30);
    popMatrix();
    
    // Right Leg (Lower)
    pushMatrix();
      translate(25, 15, 0);
      box(30, 60, 30);
    popMatrix();
  popMatrix();
}

void drawEyes() {
  // Draw left eye
  pushMatrix();
  translate(-15, -10, 20); // Left eye position
  sphere(5);
  popMatrix();
  
  // Draw right eye
  pushMatrix();
  translate(15, -10, 20); // Right eye position
  sphere(5);
  popMatrix();
}
