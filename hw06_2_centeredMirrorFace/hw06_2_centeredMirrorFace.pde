PImage imgFirst, imgSecond, imgThird;
void setup() {
  size(360, 190); // set the canvas size to (120*3) width and (150+40) tall
  background(0); // set the background to black
  
  imgFirst = loadImage("rocky.jpg"); // load the image
  
  // create two new images with the same dimensions
  imgSecond = createImage(imgFirst.width, imgFirst.height, RGB);
  imgThird = createImage(imgFirst.width, imgFirst.height, RGB);
  
  // load the pixel data for all three images
  imgFirst.loadPixels();
  imgSecond.loadPixels();
  imgThird.loadPixels();
  
  // loop algorithm for every pixels in the image
  for (int y = 0; y < imgFirst.height; y++) {
    for (int x = 0; x < imgFirst.width / 2; x++) {
      int secondX = y * imgFirst.width + x;
      int thirdX = y * imgFirst.width + (imgFirst.width - 1 - x);
      
      // set the pixels for second image (left mirrored)
      imgSecond.pixels[secondX] = imgFirst.pixels[secondX];
      imgSecond.pixels[thirdX] = imgFirst.pixels[secondX];
      
      // set the pixels for third image (right mirrored)
      imgThird.pixels[secondX] = imgFirst.pixels[thirdX];
      imgThird.pixels[thirdX] = imgFirst.pixels[thirdX];
    }
  }
  
  // update the pixel data for the modified images
  imgSecond.updatePixels();
  imgThird.updatePixels();
  
  image(imgFirst, 0, 0); // display on the left
  image(imgSecond, imgSecond.width, 0); // display on the middle
  image(imgThird, 2 * imgThird.width, 0); // display on the right
  
  // add the labels below the images
  textAlign(CENTER);
  fill(255); // set text color to white
  textSize(16);
  // add "Original" label below the original image
  text("Original", imgFirst.width / 2, imgFirst.height + 20);
  // add "Left Mirrored" label below the half mirrored image
  text("Left Mirrored", imgFirst.width + imgFirst.width / 2, imgFirst.height + 20);
  // add "Right Mirrored" label below the mirrored image
  text("Right Mirrored", 2 * imgFirst.width + imgFirst.width / 2, imgFirst.height + 20);
}
