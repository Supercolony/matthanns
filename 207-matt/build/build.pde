float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(74, 6, 28);
}

void draw() {
  pushMatrix();
  noFill();
  stroke(222, 18, 85,20);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 200,900);
    vertex(x, y);
    xoff += 0.03;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  noFill();
  stroke(250, 216, 227,10);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff), 0, 1, 200,700);
    vertex(x, y);
    xoff2 += 0.01;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
