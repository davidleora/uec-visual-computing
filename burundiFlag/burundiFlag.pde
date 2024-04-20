// Burundi Flag
// White : 255, 255, 255
// Red : 200, 16, 46
// Green : 67, 176, 42


size(750, 450);

background(200, 16, 46);
fill(67, 176, 42);

triangle(0, 0, 375, 225, 0, 450);
triangle(750, 0, 375, 225, 750, 450);
stroke(255);
strokeWeight(60);
line(750, 0, 0, 450);
line(0, 0, 750, 450);

fill(255);
noStroke();
ellipse(375, 225, 265, 265);

// Outer stars
smooth();
fill(67, 176, 42);

noStroke();
float r;
int rOuter = 30;
int rInner = 17;

beginShape();
for(int i = 0; i < 12; i++){
  r = (i % 2 == 0) ? rOuter : rInner;
  float theta = PI / 6 * i - HALF_PI;
  
  int x = int(r * cos(theta) + width / 2);
  int y = int(r * sin(theta) + height / 2 - 66);
  vertex(x, y);
}
endShape(CLOSE);

beginShape();
for(int i = 0; i < 12; i++){
  r = (i % 2 == 0) ? rOuter : rInner;
  float theta = PI / 6 * i - HALF_PI;
  
  int x = int(r * cos(theta) + width / 2 + 57);
  int y = int(r * sin(theta) + height / 2 + 33);
  vertex(x, y);
}
endShape(CLOSE);

beginShape();
for(int i = 0; i < 12; i++){
  r = (i % 2 == 0) ? rOuter : rInner;
  float theta = PI / 6 * i - HALF_PI;
  int x = int(r * cos(theta) + width / 2 - 57);
  int y = int(r * sin(theta) + height / 2 + 33);
  vertex(x, y);
}
endShape(CLOSE);

// Inner stars
smooth();
fill(200, 16, 46);
noStroke();
float r2;
int rOuter2 = 24;
int rInner2 = 13;

beginShape();
for(int i = 0; i < 12; i++){
  r2 = (i % 2 == 0) ? rOuter2 : rInner2;
  float theta = PI / 6 * i - HALF_PI;
  
  int x = int(r2 * cos(theta) + width / 2);
  int y = int(r2 * sin(theta) + height / 2 - 66);
  vertex(x, y);
}
endShape(CLOSE);

beginShape();
for(int i = 0; i < 12; i++){
  r2 = (i % 2 == 0) ? rOuter2 : rInner2;
  float theta = PI / 6 * i - HALF_PI;
  
  int x = int(r2 * cos(theta) + width / 2 + 57);
  int y = int(r2 * sin(theta) + height / 2 + 33);
  vertex(x, y);
}
endShape(CLOSE);

beginShape();
for(int i = 0; i < 12; i++){
  r2 = (i % 2 == 0) ? rOuter2 : rInner2;
  float theta = PI / 6 * i - HALF_PI;
  int x = int(r2 * cos(theta) + width / 2 - 57);
  int y = int(r2 * sin(theta) + height / 2 + 33);
  vertex(x, y);
}
endShape(CLOSE);
