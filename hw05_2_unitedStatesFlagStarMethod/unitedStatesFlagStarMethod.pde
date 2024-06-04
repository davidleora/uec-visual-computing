
// American Flag RGB Color Code
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
  fill(152, 251, 152);
  smooth();
  noStroke();
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

// Create all the stars
void drawStars(){
  fill(255);
  noStroke();
  // Prepare the union sizes for the star placement
  float heightUnion = height * 7 / 13;
  float widthUnion = width * 2 / 5;
  
  // logic for placement for each star
  for (int row = 0; row < 9; row++){
    for(int col = 0; col < 11; col++){
      // In even rows, stars are placed in even columns
      // In odd rows, stars are placed in odd columns
      if((row % 2 == 0 && col % 2 == 0) || (row % 2 != 0 && col % 2 != 0)){
        float x = widthUnion / 12 * (1 + col);
        float y = heightUnion / 10 * (1 + row);
        // push and pop Matrix functions are used to handle transformations for drawing each star
        pushMatrix();
        translate(x, y); // translate by x and y position on each star
        scale(30, 30); // The scale of the star is 30 on this homework
        star();
        popMatrix();
      }
    }
  }
}

void star(){
  beginShape();
  for(int i = 0; i < 5; i++){
    float theta = 2 * TWO_PI / 5 * i - HALF_PI; // calculate the angle
    vertex(.5 * cos(theta), .5 * sin(theta)); // sets the position of each vertex based on the calculated angle
  }
  endShape();
}
