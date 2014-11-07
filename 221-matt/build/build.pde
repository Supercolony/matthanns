float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(32, 25, 119);
}

void draw() {

  pushMatrix();
  translate(0,random(50,800));
  fill(random(0,32), random(0,25), random(50,119),50);
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
