float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(78, 97, 176);
}

void draw() {

  pushMatrix();
  rotate(random(180,360));
  translate(-2000,-500*yoff/20);
  scale(2);
  fill(78, 97, 176,random(1,5));
  stroke(165, 186, 255,random(20,100));
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 200,500);
    vertex(x, y);
    xoff += 0.05;
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
