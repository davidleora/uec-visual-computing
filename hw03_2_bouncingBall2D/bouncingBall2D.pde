int d = 20;
int x, y; // diameter and position of the ball
float vx = 3, vy = 0; // velocity in x and y directions
float gravity = 0.2; // gravity 
float damping = 0.75;
float timeStep = 1;

void setup(){
  size(400, 400); 
  smooth(); 
  noStroke();
  fill(0, 255, 200);
  
  x = width / 2;
  y = height - 350;
  
  ellipseMode(CORNER);
  frameRate(60);
}

void draw(){
  background(0);
  ellipse(x, y, d, d); // draw the ball's initial position
  x += vx * timeStep; // move along x direction
  y += vy * timeStep; // move along y direction
  vy += gravity * timeStep; // Add gravity towards the time
  
  // Check for collision with left or right walls
  if (x < 0) {
    vx *= -1; // Reverse the horizontal velocity
    x = -x; // Correct position if it goes beyond the left wall
  } else if (x + d > width) {
    vx *= -1; // Reverse the horizontal velocity
    x = 2 * (width - d) - x; // Reflect the position off the right wall
  }
  
  if (y < 0) {
    vy *= -1; // Reverse the vertical velocity
    y = -y; // correct the position if it goes beyond the top wall
  } else if (y + d > height) {
    vy *= -damping; // change the vertical velocity towards damping
    y = 2 * (height - d) - y; // reflect the position off the bottom wall
  }
}

// ball ga 2jigen heimen de haneru program wo sakusei simasita.
