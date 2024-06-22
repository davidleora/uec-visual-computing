boolean isGrid = true, isAxis = true;

void setup(){
  size(1280, 720, P3D);
  noStroke();
}

void axis(char s, color c){
  int len = 1500;
  fill(c); stroke(c);
  pushMatrix();
    if(isAxis){
      box(len, 1, 1);
      pushMatrix();
        translate(len / 2, 0, 0);
        sphere(3);
        text(s, 5, -5, 0);
      popMatrix();
    }
    if(isGrid){
      pushMatrix();
        translate(0, -len / 2, -len / 2);
        int ngrids = 75, xs = len / ngrids, ys = len / ngrids;
        for(int i = 1; i < ngrids; i++){
          line(0, 0, ys * i, 0, len, ys * i); 
          line(0, xs * i, 0, 0, xs * i, len); 
        }
      popMatrix();
    }
  popMatrix();
}

void drawAxis(char s, color c){
  switch(s){
    case 'X':
      axis(s, c);
      break;
    case 'Y':
      pushMatrix();
        rotateZ(PI / 2);
        axis(s, c);
      popMatrix();
      break;
    case 'Z':
      pushMatrix();
        rotateY(-PI / 2);
        axis(s, c);
      popMatrix();
      break;
  }
}

void keyPressed(){
  switch(key){
    case 'g':
      if(isGrid) isGrid = false;
      else isGrid = true;
      break;
    case 'a':
      if(isAxis) isAxis = false;
      else isAxis = true;
      break;
  }
}

void drawSun(float s){
  noStroke();
  pushMatrix();
    scale(s);
    fill(255, 204, 0);
    sphere(1);
  popMatrix();
}

void drawMoon(float distance, float size, float speed, color c){
  float angle = millis() / 1000.0 * speed;
  float x = cos(angle) * distance;
  float z = sin(angle) * distance;
  pushMatrix();
    translate(x, 0, z);
    fill(c);
    sphere(size);
  popMatrix();
}

void drawPlanet( float distance, float size, float speed, color c, boolean hasMoon) {
  noStroke();
  float angle = millis() / 1000.0 * speed;
  float x = cos(angle) * distance;
  float z = sin(angle) * distance;
  pushMatrix();
    translate(x, 0, z);
    fill(c);
    sphere(size);
    if (hasMoon) {
      drawMoon(30, 4, 1.5, color(200));
    }
  popMatrix();
}

void drawOrbit(float distance){
  noFill();
  stroke(200);
  pushMatrix();
  rotateX(HALF_PI);
    ellipse(0, 0, distance * 2, distance * 2);
  popMatrix();
}

void draw(){
  background(0);
  
  float cameraY = map(mouseY, 0, height, 400, -200);
  float theta = map(mouseX, 0, width, 0, TWO_PI);
  
  float camX = 1000 * cos(theta);
  float camZ = 1000 * sin(theta);
  
  camera(camX, cameraY, camZ, 0, 0, 0, 0, -1, 0);
  
  pointLight(255, 204, 0, camX, cameraY, camZ);
  
  pushMatrix();
    drawAxis('X', color(255, 0, 0, 60));
    drawAxis('Y', color(0, 255, 0, 60)); 
    drawAxis('Z', color(0, 0, 255, 60));
    drawSun(100); // Sun
    
    // Draw planets
    drawOrbit(150);
    drawPlanet(150, 8, 0.5, color(169, 169, 169), false); // Mercury: Dark Gray
    drawOrbit(200);
    drawPlanet(200, 15, 0.3, color(255, 223, 186), false); // Venus: Pale Yellow
    drawOrbit(250);
    drawPlanet(250, 16, 0.2, color(0, 102, 204), true); // Earth: Blue
    drawOrbit(300);
    drawPlanet(300, 10, 0.15, color(255, 69, 0), false); // Mars: Red
    drawOrbit(400);
    drawPlanet(400, 35, 0.1, color(255, 140, 0), false); // Jupiter: Orange
    drawOrbit(500);
    drawPlanet(500, 30, 0.08, color(210, 180, 140), false); // Saturn: Light Brown
    drawOrbit(600);
    drawPlanet(600, 25, 0.06, color(173, 216, 230), false); // Uranus: Light Blue
    drawOrbit(700);
    drawPlanet(700, 24, 0.05, color(0, 0, 139), false); // Neptune: Dark Blue
  popMatrix();
}
