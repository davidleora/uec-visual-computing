
// American Flag RGB
// Old Glory Blue : 10, 49, 97
// Old Glory Red : 179, 25, 66

// SPECIFICATIONS
// height: 500
// width: 494
// height of the union: height * 7 / 13
// width of the union: width * 2 / 5
// little stars vertical range: height of the union / 10 
// little stars horizontal range: width of the union / 12
// width of stripe: height / 13
// diameter of star: width of stripe * 4 / 5

void setup(){
  size(985, 494);
  background(255);
  drawStripes();
  drawUnion();
  drawStars();
}

// Create red stripes
void drawStripes(){
  noStroke();
  fill(179, 25, 66);
  float stripeWidth = height / 13;
  for(int i = 0; i < 13; i++){
    if(i % 2 == 0)
      rect(0, i*stripeWidth, width, stripeWidth);
  }
}

// Create blue Union
void drawUnion(){
  float heightUnion = height * 7 / 13;
  float widthUnion = width * 2 / 5;
  noStroke();
  fill(10, 49, 97);
  rect(0, 0, widthUnion, heightUnion);
}

// Create a lot of stars
void drawStars(){
  fill(255);
  noStroke();
  float stripeWidth = height / 13;
  float r1 = stripeWidth * 4 / 10, r2 = stripeWidth * 4 / 25;
  float heightUnion = height * 7 / 13;
  float widthUnion = width * 2 / 5;
  
  // logic for placement for each star
  for (int row = 0; row < 9; row++){
    for(int col = 0; col < 11; col++){
      if((row % 2 == 0 && col % 2 == 0) || (row % 2 != 0 && col % 2 != 0)){
        float x = widthUnion / 12 * (1 + col);
        float y = heightUnion / 10 * (1 + row);
        drawStar(x, y, r1, r2);
      }
    }
  }
}

// Create one star
void drawStar(float xx, float yy, float r1, float r2){
  beginShape();
  for (int i = 0; i < 10; i++){
    float r = (i % 2 == 0) ? r1 : r2;
    float theta = i * TWO_PI / 10 - HALF_PI;
    float x = r * cos(theta) + xx; // set the x-position for each star
    float y = r * sin(theta) + yy; // set the y-position for each star
    vertex(x, y);
  }
  endShape();
}
