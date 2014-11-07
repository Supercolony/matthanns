float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(49, 61, 85);
}

void draw() {

  pushMatrix();
  translate(0,300*yoff/20);
  noFill();
  stroke(77, 157, 143,50);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff), 0, 1, 20,50);
    vertex(x, y);
    xoff2 += 0.01;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,300*yoff/20);
  noFill();
  stroke(255, 185, 99,50);
  beginShape();
  smooth();
  float xoff3 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff3, yoff), 0, 1, 10,50);
    vertex(x, y);
    xoff3 += 0.01;
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
