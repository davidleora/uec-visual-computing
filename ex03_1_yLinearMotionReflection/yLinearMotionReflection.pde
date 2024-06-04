void setup(){
  size(40, 400); 
  smooth(); 
  noStroke();
  fill(0, 255, 200);
  ellipseMode(CORNER);
  frameRate(30);
}

int d = 20, y = 0, vy = 3;
void draw(){
  background(0);
  ellipse(10, y, d, d);
  
  y += vy;
  if ( y < 0 || y + d > height ){
    vy *= -1;
    if (y < 0) y *= -1; // Top edge
    else if ( y+d > height ) y = 2 * (height - d) - y; // Bottom edge
  }
}
