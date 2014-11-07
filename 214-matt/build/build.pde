float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(84, 116, 146);
}

void draw() {

  pushMatrix();
  translate(0,300*yoff/20);
  noFill();
  stroke(235, 205, 157,50);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff), 0, 1, 20,100);
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
  stroke(194, 184, 198,50);
  beginShape();
  smooth();
  float xoff3 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff3, yoff), 0, 1, 10,150);
    vertex(x, y);
    xoff3 += 0.02;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,300*yoff/20);
  noFill();
  stroke(110, 139, 163,100);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 20,150);
    vertex(x, y);
    xoff += 0.01;
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
