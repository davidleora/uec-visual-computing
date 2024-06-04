PImage src;
int w = 5; // filter width
int hw = int(w / 2); // half size of filter width

void setup() {
  size(720, 180); // adjust size to fit six images side by side and add space in the bottom for captions
  background(255); // set background to white
  src = loadImage("rocky.jpg"); // load the image
  image(src, 0, 0); // display original image on the far left
  textSize(12); // set text size for captions
  fill(0); // set text color to black
  textAlign(CENTER); // center align the text
  text("Original", src.width / 2, src.height + 20); // caption for the original image

  float sigmaSpatial = 5.0; // Gaussian filter's standard deviation
  float sigmaRange = 20.0; // Range weight's standard deviation

  PImage previousImage = src; // initialize with the original image
  for (int i = 0; i < 5; i++) { // apply the filter 5 times
    PImage filteredImg = bilateralFilter(previousImage, sigmaSpatial, sigmaRange); // apply the filter
    image(filteredImg, (i + 1) * src.width, 0); // display bilateral filter results
    text("Filter x" + (i + 1), (i + 1) * src.width + src.width / 2, src.height + 20); // caption for the filtered images
    previousImage = filteredImg; // use the filtered image for the next iteration
  }
}

// function to calculate the gaussian filter weights
float[][] gaussian(float s) {
  float[][] filter = new float[w][w];
  for (int j = -hw; j <= hw; j++) {
    for (int i = -hw; i <= hw; i++) { // 1/(2πσ²) is omitted
      filter[j + hw][i + hw] = exp(-(i * i + j * j) / (2.0 * s * s));
    }
  }
  return filter;
}

// function to apply bilateral filter
PImage bilateralFilter(PImage img, float sigmaSpatial, float sigmaRange) {
  PImage filteredImg = createImage(img.width, img.height, RGB); // create the output image
  float[][] spatialFilter = gaussian(sigmaSpatial); // calculate the gaussian filter

  img.loadPixels(); // load pixels of the input image
  filteredImg.loadPixels(); // prepare to load pixels of the output image

  // process each pixel in the image
  for (int y = hw; y < img.height - hw; y++) {
    for (int x = hw; x < img.width - hw; x++) {
      float sumWeights = 0;
      float sum_r = 0, sum_g = 0, sum_b = 0;

      int centerColor = img.pixels[y * img.width + x]; // get the color of the center pixel
      float centerR = red(centerColor); // red component of the center pixel
      float centerG = green(centerColor); // green component of the center pixel
      float centerB = blue(centerColor); // blue component of the center pixel

      // process each pixel in the filter window
      for (int j = -hw; j <= hw; j++) {
        for (int i = -hw; i <= hw; i++) {
          int neighborX = constrain(x + i, 0, img.width - 1); // x coordinate of the neighboring pixel
          int neighborY = constrain(y + j, 0, img.height - 1); // y coordinate of the neighboring pixel

          int neighborColor = img.pixels[neighborY * img.width + neighborX]; // get the color of the neighboring pixel
          float neighborR = red(neighborColor); // red component of the neighboring pixel
          float neighborG = green(neighborColor); // green component of the neighboring pixel
          float neighborB = blue(neighborColor);// blue component of the neighboring pixel

          // calculate range weight based on color difference
          float rangeWeight = exp(-(sq(centerR - neighborR) + sq(centerG - neighborG) + sq(centerB - neighborB)) / (2.0 * sigmaRange * sigmaRange));

          // combine spatial and range weights
          float weight = spatialFilter[j + hw][i + hw] * rangeWeight;

          // accumulate weighted color values
          sum_r += neighborR * weight;
          sum_g += neighborG * weight;
          sum_b += neighborB * weight;
          sumWeights += weight;
        }
      }

      // normalize the result
      sum_r /= sumWeights;
      sum_g /= sumWeights;
      sum_b /= sumWeights;

      // set the result color
      filteredImg.pixels[y * img.width + x] = color(sum_r, sum_g, sum_b);
    }
  }

  filteredImg.updatePixels(); // update pixels of the output image
  return filteredImg; // return the filtered image
}
