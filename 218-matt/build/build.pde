float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(229, 71, 80);
}

void draw() {

  pushMatrix();
  translate(10+mouseX,mouseY-100*yoff);
  noFill();
  stroke(147, 200, 208,200);
  strokeWeight(2*noise(20,200));
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff*20), 0, 1, 20,50*tan(1000));
    vertex(x, y);
    xoff2 += random(0.01,sin(0.05));
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
