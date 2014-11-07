float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(23, 67, 88);
}

void draw() {

  pushMatrix();
  translate(0,100);
  noFill();
  stroke(233, 131, 45,random(5,20));
  strokeWeight(2*noise(20,200));
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff*20), 0, 1, 20,1000);
    vertex(x, y);
    xoff2 += random(0.01,0.05);
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,400);
  noFill();
  stroke(94, 153, 161,random(5,20));
  strokeWeight(2*noise(20,200));
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff*20), 0, 1, 20,1000);
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
