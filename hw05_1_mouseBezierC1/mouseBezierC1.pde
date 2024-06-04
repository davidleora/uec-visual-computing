int npoints = 100, n = 0;
int[] x = new int[npoints], y = new int[npoints];

void setup(){
  size(600, 600);
  background(0);
  smooth();
  noStroke();
  fill(255, 0, 0);
  drawGrid();
}

void draw(){ }

void mouseClicked(){
  update(mouseX, mouseY);
}

void drawGrid(){
  int maxVal = 30; // -10 <= x, y <= 10
  int unitPixels = width / maxVal / 2; // grid interval(pixels/unit) = 600 / 10 / 2 = 30
  int xc = width / 2, yc = height / 2; // xc = 300, yc = 300

  stroke(255, 255, 255, 150);
  strokeWeight(0.5);
  for(int i = 1 - maxVal; i < maxVal; i++){
    line(0, unitPixels * i + xc, width, unitPixels * i + yc);  // horizontal grid : 0, 30, 600, 30
    line(unitPixels * i + xc, 0, unitPixels * i + yc, height); // vertical grid : 30, 0, 30, 600
  }
}

void update(int p, int q){
  if(mouseButton == LEFT){
    if(n < npoints){
      x[n] = p; y[n] = q;
      if (n > 3 && n % 3 == 1){
          x[n] = 2*x[n-1] - x[n-2];
          y[n] = 2*y[n-1] - y[n-2];
        } 
      noStroke();
      fill(255, 0, 0);
      ellipse(x[n], y[n], 5, 5);
      if (n != 0){
        stroke(0, 255, 0);
        strokeWeight(1);
        line(x[n-1], y[n-1], x[n], y[n]);
        if (n % 3 == 0){
          stroke(0, 0, 255);
          noFill();
          strokeWeight(3);
          bezier(x[n], y[n], x[n-1], y[n-1], x[n-2], y[n-2], x[n-3], y[n-3]);
        }
      }
      n++;
    }
  }
  else if(mouseButton == RIGHT){
    n = 0;
    background(0);
    drawGrid();
  }
}
