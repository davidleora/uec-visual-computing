int x = 0;
float angle = PI;

void setup(){
  size(900, 300);
  background(255);
}

void draw(){
  background(255);
  stroke(0);
  line(0, height * 0.9, width, height * 0.9);
  
  angle += PI/180;
  if(angle > 3*PI/2) {
    angle = PI;
    x += 50;
  }
  else {
    x += 0.5;
  }
  if(x > width + 50)
    x = 0;
  
  translate(x-20, height * 0.9);
  rotate(angle);
  rect(0, 0, 50, 50);
}
