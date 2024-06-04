size(600, 600);
background(255);
colorMode(HSB, 100);

int numLines = 100;
float radius = 100;
float lineLength = 175;
float lineWeight = 3;

for (int i = 0; i < numLines; i++) {
  // Re-Map from '0' to 'numLines-1' into '0' to 'TWO_PI' radian.
  // This is used to evenly distribute the lines around the circle.
  float angle = map(i, 0, numLines, 0, TWO_PI);
  float x1 = width/2 + cos(angle) * radius;
  float y1 = height/2 + sin(angle) * radius;
  float x2 = width/2 + cos(angle) * (radius + lineLength);
  float y2 = height/2 + sin(angle) * (radius + lineLength);
  
  // HSB: Saturation is set to 100 means the color is at its most vibrant
  // Brightness is set to 100 also indicates the brightness of the color
  stroke(i, 100, 100);
  strokeWeight(lineWeight);
  line(x1, y1, x2, y2); // Draw a line between the calculating starting and ending points
}
