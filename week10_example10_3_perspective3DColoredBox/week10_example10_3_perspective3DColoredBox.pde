float angle = 0;

void setup(){
  size(400, 300, P3D);
  noStroke();
}

void draw(){
   background(255);
   lights();
   
   float fov = PI / 3.;
   float cameraZ = (height / 2) / tan(fov / 2);
   perspective(fov, float(width) / float(height), cameraZ / 10, cameraZ * 10);
   
   float camX = cos(angle) * 500;
   float camY = -300;
   float camZ = sin(angle) * 500;
   
   camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0);
   
   angle += 0.01;
   
   pushMatrix();
   scale(100, 100, 100);
   coloredCube(255);
   popMatrix();
}
void coloredCube(float alpha){
  beginShape(QUADS);
    fill(255, 0, 0, alpha); vertex(1, -1, -1); vertex(1, -1, 1); vertex(1, 1, 1); vertex(1, 1, -1); // Red
    fill(0, 255, 0, alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1); // Green
    fill(0, 0, 255, alpha); vertex(-1, 1, 1); vertex(1, 1, 1); vertex(1, -1, 1); vertex(-1, -1, 1); // Blue
    fill(255, 255, 0, alpha); vertex(-1, -1, -1); vertex(-1, -1, 1); vertex( 1, -1, 1); vertex( 1, -1, -1); // Yellow
    fill(255, 0, 255, alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1); // Magenta
    fill(0, 255, 255, alpha); vertex(1, 1, -1); vertex(-1, 1, -1); vertex(-1, -1, -1); vertex(1, -1, -1); // Cyan
  endShape();
}
