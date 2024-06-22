void setup(){
  size(400, 300, P3D);
  noStroke();
  smooth();
}

void draw(){
   background(255);
   ortho();
   translate(width/2, height/2, 0);
   rotateX(map(mouseY, 0, height, PI, -PI));
   rotateY(map(mouseX, 0, width, -PI, PI));
   scale(100, 100, 100);
   coloredCube(255);
}

void coloredCube(float alpha){
  pushMatrix();
    scale(.5, .5, .5);
    beginShape(QUADS);
      fill(255, 0, 0, alpha); vertex(1, -1, -1); vertex(1, -1, 1); vertex(1, 1, 1); vertex(1, 1, -1); // Red
      fill(0, 255, 0, alpha); vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1); // Green
      fill(0, 0, 255, alpha); vertex(-1, 1, 1); vertex(1, 1, 1); vertex(1, -1, 1); vertex(-1, -1, 1); // Blue
      fill(255, 255, 0, alpha); vertex(-1, -1, -1); vertex(-1, -1, 1); vertex( 1, -1, 1); vertex( 1, -1, -1); // Yellow
      fill(255, 0, 255, alpha); vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1); // Magenta
      fill(0, 255, 255, alpha); vertex(1, 1, -1); vertex(-1, 1, -1); vertex(-1, -1, -1); vertex(1, -1, -1); // Cyan
    endShape();
  popMatrix();
}
