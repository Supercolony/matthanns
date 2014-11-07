float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {

  pushMatrix();

  translate(random(width),5*random(height));
  scale(2);
  rotate(45);
  fill(0,10);
  stroke(207, 32, 36,random(10,100));
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= 5000; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 50,200);
    vertex(x, y);
    xoff += 0.04;
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
