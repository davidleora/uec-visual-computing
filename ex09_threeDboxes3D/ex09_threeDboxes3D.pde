float time = 0;
boolean waveMode = false;

void setup(){
  size(800, 800, P3D);
  noStroke();
}

void draw(){
  background(0);
  pushMatrix();
  scale(2);
  text("Press W to enable Animation", 20, 30);
  popMatrix();
  
  translate(width/2, height/2, -100);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  scale(25, 25, 25);
  
  time += 0.05;
  
  for (int i = -5; i < 6; i++){
    for (int j = -5; j < 6; j++){
      for (int k = -5; k < 6; k++){
        float r, g, b;
        if (waveMode) {
          r = 127.5 + 127.5 * sin(i * 0.5 + time);
          g = 127.5 + 127.5 * sin(j * 0.5 + time);
          b = 127.5 + 127.5 * sin(k * 0.5 + time);
        } else {
          r = map(i, -5, 5, 0, 255);
          g = map(j, -5, 5, 0, 255);
          b = map(k, -5, 5, 0, 255);
        }
        pushMatrix();
        translate(1.6 * i, 1.6 * j, 1.6 * k);
        coloredCube(255, r, g, b);
        popMatrix();
      }
    }
  }
}
void coloredCube(float alpha, float r, float g, float b){
  pushMatrix();
    scale(.5, .5, .5);
    beginShape(QUADS);
    fill(r, g, b, alpha);
    vertex(1, -1, -1); vertex(1, -1, 1); vertex(1, 1, 1); vertex(1, 1, -1);
    vertex(1, 1, 1); vertex(-1, 1, 1); vertex(-1, 1, -1); vertex(1, 1, -1);
    vertex(-1, 1, 1); vertex(1, 1, 1); vertex(1, -1, 1); vertex(-1, -1, 1);
    vertex(-1, -1, -1); vertex(-1, -1, 1); vertex( 1, -1, 1); vertex( 1, -1, -1);
    vertex(-1, 1, -1); vertex(-1, 1, 1); vertex(-1, -1, 1); vertex(-1, -1, -1);
    vertex(1, 1, -1); vertex(-1, 1, -1); vertex(-1, -1, -1); vertex(1, -1, -1);
    endShape();
  popMatrix();
}

void keyPressed() {
  if (key == 'w'){
    waveMode = !waveMode;
  }
}
