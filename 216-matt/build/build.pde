float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(255);
}

void draw() {

  pushMatrix();
  translate(0,50*yoff/20);
  noFill();
  stroke(27, 171, 204,10);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff), 0, 1, 20,150);
    vertex(x, y);
    xoff2 += random(0.01,0.05);
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,50*yoff/20);
  noFill();
  stroke(252, 97, 97,10);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 20,100);
    vertex(x, y);
    xoff += random(0.01,0.05);
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
