size(600, 300);
background(0, 42, 143);

noStroke();
fill(255);
rect(0, 60, 600, 60);

fill(255);
rect(0, 180, 600, 60);

noStroke();
fill(207, 20, 43);
beginShape();
vertex(0, 0);
vertex(260, 150);
vertex(0, 300);
endShape(CLOSE);

smooth();
noStroke();
fill(255);

int r = 50;
beginShape();
  for(int i = 0; i < 5; i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI;
    int x, y;
    x = int(r * cos(theta) + 50);
    y = int(r * sin(theta) + 50);
    vertex(x+37, y+100);
  }
endShape();
