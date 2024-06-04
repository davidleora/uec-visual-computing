void setup() {
  size(400, 400);
}

int xCenter = -50; // initial x-position of Pac Man
int x = 0, y = 0; // Relative position for drawing the arc
int dx = 100, dy = 100;

float sr = 0; // Start angle of the arc
float er = 2 * PI; // End angle of the arc
float angleStep = 2*PI/180; // Angle step per frame for animation
boolean increasing = true; // Mouth open & close controller

void draw() {
  background(0);
  
  xCenter += 1; // Move Pac Man horizontally
  translate(xCenter, height / 2); // Translate the Pac-Man
  
  fill(255,255,0); // Yellow color
  noStroke();
  arc(x, y, dx, dy, sr, er);

  if (increasing) { // Mouth opening
    sr += angleStep; // Increase start angle
    er -= angleStep; // Decrease end angle
    
    if (sr >= PI/4) { // If mouth is full open
      increasing = false; // Change to close the mouth
    } 
  } 
  else {
    sr -= angleStep; // Decrease start angle to close the mouth
    er += angleStep; // Increase end angle to close the mouth
    
    if (sr <= 0) { // If mouth is fully closed
      increasing = true; // Change to open the mouth
    }
  }
  
  if (xCenter > width + dx)  // Reset the position of Pac-Man if it moves off-screen
    xCenter = -50; // Start from left
}
