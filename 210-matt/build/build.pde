float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {
  pushMatrix();
  rotate(120);
  translate(0,-100*yoff/20);
  noFill();
  stroke(255,20);
  scale(2);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 20,300);
    vertex(x, y);
    xoff += 0.03;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  rotate(120);
  translate(0,-500*yoff/20);
  scale(2);
  noFill();
  stroke(255,20);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff), 0, 1, 20,400);
    vertex(x, y);
    xoff2 += 0.01;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  rotate(120);
  translate(1000,-200*yoff/20);
  scale(2);
  noFill();
  stroke(255,20);
  beginShape();
  smooth();
  float xoff3 = 0;
  for (float x = 0; x <= 1500; x += 5) {
    float y = map(noise(xoff3, yoff), 0, 1, 10,1000);
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
