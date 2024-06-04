PImage img, flippedImg, animatedImg;
int currentLine = 0;

void setup() {
  // Size of choco.jpg is 517 x 900. So, the canvas size should be three times the width and height plus extra for labels
  size(3 * 517, 1000); // 3 times width for images, height for images plus space for labels
  background(0);
  
  // Loading the choco.jpg
  img = loadImage("choco.jpg"); 
  
  // Create the flipped image and animated image
  flippedImg = createImage(img.width, img.height, RGB);
  animatedImg = createImage(img.width, img.height, RGB);
  
  // Load the pixel data of the images
  img.loadPixels();
  flippedImg.loadPixels();
  animatedImg.loadPixels();

  // Flip the image
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pixelColor = img.get(x, y);
      flippedImg.set(img.width - 1 - x, y, pixelColor);
    }
  }
  flippedImg.updatePixels();

  // Show the original image on the left window
  image(img, 0, 0); 
  
  // Show the flipped image in the middle window
  image(flippedImg, img.width, 0);
  
  // Add the labels below the images
  textAlign(CENTER);
  fill(255); // Set text color to white
  textSize(32);
  // Add "ORIGINAL" label below the original image
  text("ORIGINAL", img.width / 2, img.height + 50);
  // Add "FLIPPED" label below the flipped image
  text("FLIPPED", img.width + img.width / 2, img.height + 50);
  // Add "ANIMATED" label below the animated image
  text("ANIMATED", 2 * img.width + img.width / 2, img.height + 50);
}

void draw() {
  // If currentLine has not reached the bottom of the image
  if (currentLine < img.height) {
    // For the current line, copy pixels from the original image and draw them in the animated image from left to right
    for (int x = 0; x < flippedImg.width; x++) {
      // Get the pixel color from the original image
      int pixelColor = flippedImg.get(x, currentLine);
      // Set the pixel color at the corresponding position in the animated image
      animatedImg.set(x, currentLine, pixelColor);
    }
    currentLine++; // Update to the next line
    animatedImg.updatePixels();
    // Display the animated image in the right window
    image(animatedImg, 2 * img.width, 0);
  }
}
