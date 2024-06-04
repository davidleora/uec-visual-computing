
void setup() {
  size(400, 400);
}

float angle = 0;
int r1 = 50, r2 = 30, r;
int xCenter = -50;

void draw() {
  background(0);
  angle = angle + PI / 180;
  
  translate(xCenter, height / 2);
  xCenter += 1;
  rotate(angle);  // Rotate by 1 degree
  
  fill(255);
  noStroke();
  // Draw a rectangle
  beginShape();
  for(int i = 0; i < 11; i++){
    if((i % 2) == 0) r = r1;
    else r = r2;
    float theta = i * TWO_PI / 10 - HALF_PI;
    float x = r * cos(theta);
    float y = r * sin(theta);
    vertex(x, y);
  }
  endShape();
  
  if (xCenter > width + r1) xCenter = -50;
}
