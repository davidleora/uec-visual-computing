// Flag Specifications:
// Width: 30
// Height: 20
// Union: width 15 height 10
// 1 Big Star and 4 Small Stars
// big star: width 5 height 5

// Color Specifications:
// Red: 238, 28, 37
// Yellow: 255, 255, 0

// Ratio 40:1

void setup(){
  size(1200, 800); //30 x 40, 20 x 40
  background(238, 28, 37);
  translate(200, 200);
  drawBigStar();
  drawStar1();
  drawStar2();
  drawStar3();
  drawStar4();
  
}

// function to rotate the stars towards the center (the big star)
void rotateTowards(float centerX, float centerY, float starX, float starY){
  // Count the angle of each small star towards the big star by counting the arctan of both x and y coordinates
  float angle =  atan2(centerY - starY, centerX - starX) - HALF_PI;
  rotate(angle); // Rotate it by the angle that has been calculated
}

void drawStar1(){
  pushMatrix();
  translate(200, -120); // translate it from the big star (from 200, 200)
  rotateTowards(0, 0, -200, 120);
  scale(width / 15, width / 15);
  star();
  popMatrix();
}

void drawStar2(){
  pushMatrix();
  translate(280, -40); // translate it from the big star (from 200, 200)
  rotateTowards(0, 0, -280, 40);
  scale(width / 15, width / 15);
  star();
  popMatrix();

}

void drawStar3(){
  pushMatrix();
  translate(280, 80); // translate it from the big star (from 200, 200)
  rotateTowards(0, 0, -280, -80);
  scale(width / 15, width / 15);
  star();
  popMatrix();

}

void drawStar4(){
  pushMatrix();
  translate(200, 160); // translate it from the big star (from 200, 200)
  rotateTowards(0, 0, -200, -160);
  scale(width / 15, width / 15);
  star();
  popMatrix();

}

// function to draw the big star
void drawBigStar(){
  fill(255, 255, 0);
  smooth();
  noStroke();
  pushMatrix();
  scale(width / 5, width / 5); // 0.5 * 12 * 40
  star();
  popMatrix();
}



void star(){
  beginShape();
  for(int i = 0; i < 5; i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI;
    vertex(.5 * cos(theta), .5 * sin(theta));
  }
  endShape();
}
