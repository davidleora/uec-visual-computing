PFont font;
float rotationAngle = 0; // Control the rotation angle of the text

void setup() {
  size(800, 800, P3D); // Set canvas size & use P3D renderer
  noStroke(); // Disable drawing the stroke
  smooth(); // Enable smoothing
  font = createFont("Comic Sans MS", 32, true); // Load Comic Sans font
  textFont(font); // Set the font for text rendering
  textMode(SHAPE); // Set the text mode to SHAPE (to disable the text background)
}

void draw() {
  background(0); // Clear the screen with black background
  translate(width/2, height/2, 0); // Move the origin to the center of the screen
  rotateX(map(mouseY, 0, height, PI, -PI)); // Rotate around Y-axis by mouseY
  rotateY(map(mouseX, 0, width, -PI, PI)); // Rotate around X-axis by mouseX
  drawAxis('X', color(255, 0, 0, 120)); // X-axis + YZ-plane
  drawAxis('Y', color(0, 255, 0, 120)); // Y-axis + XZ-plane
  drawAxis('Z', color(0, 0, 255, 120)); // Z-axis + XY-plane
  rotateY(rotationAngle); // Rotate the text around Y-axis
  drawTextOnTube("gnitupmoC lausiV ⭐️ gnitupmoC lausiV ⭐️", 200, 200); // Draw text on Y-axis tube
  rotationAngle -= 0.01; // Increment the rotation angle
}

void axis(char s, color c) {
  int len = 400; // Length of the axis
  fill(c); // Set the fill color
  stroke(c); // Set the stroke color
  box(len, 1, 1); // Draw the axis as a long thin box
  
  // Draw the sphere and text label at the end of the axis
  pushMatrix();
    translate(len/2, 0, 0);
    sphere(3);
    text(s, 20, -5, 0);
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
          rotateZ(PI/2); 
          axis(s, c); // Draw the Y-axis
        popMatrix();
        break;
      case 'Z': 
        pushMatrix();
          rotateY(-PI/2);
          axis(s, c); // Draw the Z-axis
        popMatrix();
        break;
    }
}

void drawTextOnTube(String txt, float radius, float height) {
  int sides = txt.length(); // Number of sides based on the length of the text
  float angleStep = TWO_PI / sides; // Angle step for placing eeach character
  float y = - (height / 2 + 50); // Position the text above the tube
  
  textAlign(CENTER, CENTER); // Align text to the center
  
  for (int i = 0; i < sides; i++) {
    float angle = i * angleStep; // Calculate the angle for each character
    float x = cos(angle) * radius; // Calculate the x position
    float z = sin(angle) * radius; // Calculate the z position
    
    // Calculate gradient color
    float inter = map(i, 0, sides, 0, 1); // Interpolation factor
    color c = lerpColor(color(255, 0, 0), color(0, 0, 255), inter); // Interpolate between red and blue
    fill(c); // Set the fill color
    
    pushMatrix();
      translate(x, y, z); // Position the character
      rotateY(PI/2 - angle); // Rotate the character to face outward
      text(txt.charAt(i), 0, 0); // Draw the character
    popMatrix();
  }
}
