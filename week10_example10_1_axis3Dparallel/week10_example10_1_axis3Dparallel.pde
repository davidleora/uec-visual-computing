void setup() {
  size(400, 300, P3D);
  noStroke();
  smooth();
}

void draw() {
  background(255);
  ortho(); //orthogonal projection
  translate(width/2, height/2, 0);
  rotateX(-PI / 8.);
  rotateY(-PI / 4.);
  drawAxis('X', color(255, 0, 0));
  drawAxis('Y', color(0, 255, 0));
  drawAxis('Z', color(0, 0, 255));
}

void drawAxis(char s, color c){
    fill(c);
  pushMatrix(); // draw axis
    switch(s){
      case 'X': box(200, 1, 1); break;
      case 'Y': box(1, 200, 1); break;
      case 'Z': box(1, 1, 200); break;
    }
  popMatrix();
  pushMatrix();
    switch(s){
      case 'X': translate(100, 0, 0); break;
      case 'Y': translate(0, 100, 0); break;
      case 'Z': translate(0, 0, 100); break;
    }
    sphere(3); // draw positive axis
    text(s, 5, 0, 0);
  popMatrix();
}
