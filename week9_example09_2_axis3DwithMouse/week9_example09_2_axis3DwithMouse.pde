/* @pjs font="TEMPSITC.TTF"; 
 */

void setup(){
  size(400, 300, P3D);
  noStroke();
  smooth();
  textFont(createFont("Tempus Sans ITC", 24));
}

void draw(){
  background(255);
  translate(width / 2, height / 2, 0);
  rotateX(map(mouseY, 0, height, PI, -PI)); // rotate around Y-axis by mouseY
  rotateY(map(mouseX, 0, width, -PI, PI));  //  rotate around X-axis by mouseX
  drawAxis('X', color(255, 0, 0)); // X-axis: red
  drawAxis('Y', color(0, 255, 0)); // Y-axis: green
  drawAxis('Z', color(0, 0, 255)); // Z-axis: blue
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
    text(s, 5, -5, 0);
  popMatrix();
}
