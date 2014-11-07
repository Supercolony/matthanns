float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(248, 245, 223);
}

void draw() {
  pushMatrix();
  translate(0,100+yoff);
  fill(148, 218, 151,10);
  stroke(148, 218, 151,255);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 20,100);
    vertex(x, y);
    xoff += 0.05;
  }
  yoff += 1.05;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,10+yoff);
  fill(239, 151, 181,10);
  stroke(239, 151, 181,255);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff), 0, 1, 20,100);
    vertex(x, y);
    xoff2 += 0.03;
  }
  yoff += 20.05;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,500+yoff);
  fill(155, 204, 201,10);
  stroke(155, 204, 201,255);
  beginShape();
  smooth();
  float xoff3 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff3, yoff), 0, 1, 10,100);
    vertex(x, y);
    xoff3 += 0.01;
  }
  yoff += 0.05;
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
