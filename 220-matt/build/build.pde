float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {

  pushMatrix();
  translate(500,random(110,800));
  noFill();
  rotate(random(20,60));
  stroke(255,40);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff*20), 0, 1, 20,200*sin(1000));
    vertex(x, y);
    xoff2 += random(0.01,sin(0.05));
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(500,random(110,800));
  fill(0,5);
  rotate(random(20,60));
  stroke(0,40);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff*20), 0, 1, 20,700*sin(1000));
    vertex(x, y);
    xoff += random(0.01,sin(0.05));
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
