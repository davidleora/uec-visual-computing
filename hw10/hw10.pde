float angle = 0;

void setup(){
  size(1280, 720, P3D);
  noStroke();
}

void drawCar(float x, float y, float z) {
  pushMatrix();
  translate(x, y, z);
  rotateY(angle); // Rotate to show movement

  // Car body
  fill(255, 0, 0);
  box(100, 30, 50); // 3D box for car body

  // Car roof
  translate(0, -20, 0);
  fill(0, 0, 255);
  box(60, 20, 40); // 3D box for car roof

  // Car wheels
  fill(0);
  for (int i = -1; i <= 1; i += 2) {
    for (int j = -1; j <= 1; j += 2) {
      pushMatrix();
      translate(i * 30, 25, j * 25);
      rotateX(HALF_PI); // Rotate wheel to face the right direction
      drawCylinder(10, 20); // Draw wheel
      popMatrix();
    }
  }
  
  popMatrix();
}

// Function to draw a cylinder
void drawCylinder(float r, float h) {
  int sides = 20; // Number of sides for the cylinder
  float angle = TWO_PI / sides;

  // Draw the top and bottom circles
  beginShape(TRIANGLE_FAN);
  vertex(0, -h/2, 0); // Center vertex for the top circle
  for (int i = 0; i <= sides; i++) {
    float x = cos(angle * i) * r;
    float z = sin(angle * i) * r;
    vertex(x, -h/2, z);
  }
  endShape();

  beginShape(TRIANGLE_FAN);
  vertex(0, h/2, 0); // Center vertex for the bottom circle
  for (int i = 0; i <= sides; i++) {
    float x = cos(angle * i) * r;
    float z = sin(angle * i) * r;
    vertex(x, h/2, z);
  }
  endShape();

  // Draw the side of the cylinder
  beginShape(QUAD_STRIP);
  for (int i = 0; i <= sides; i++) {
    float x = cos(angle * i) * r;
    float z = sin(angle * i) * r;
    vertex(x, -h/2, z);
    vertex(x, h/2, z);
  }
  endShape();
}

void draw(){
  background(200);
  lights();
  
  // Set perspective
  float fov = PI / 3.0;
  float cameraZ = (height / 2.0) / tan(fov / 2.0);
  perspective(fov, float(width) / float(height), cameraZ / 10.0, cameraZ * 10.0);
  
  // Adjusted rotating camera
  float camX = cos(angle) * 500;
  float camY = -300;
  float camZ = sin(angle) * 500;
  
  camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0); // Set camera
  
  angle += 0.01;
  
  // Car position on circular path
  float carAngle = radians(frameCount % 360);
  float radius = 300;
  float carX = radius * cos(carAngle);
  float carZ = radius * sin(carAngle);
  
  drawCar(carX, 0, carZ); // Draw car on path
  
  // Draw circular path
  noFill();
  stroke(100);
  pushMatrix();
  translate(0, 0, 0);
  ellipse(0, 0, radius * 2, radius * 2);
  popMatrix();
}
