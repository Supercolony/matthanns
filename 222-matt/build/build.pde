float yoff = 0.0;

void setup() {
  size(1000, 1000);
  background(250, 240, 240);
}

void draw() {

  pushMatrix();
  translate(400,random(50,800));
  fill(random(0,218), 172, 156,50);
  stroke(255,200);
  rotate(175);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff*20), 0, 1, 20,random(500,2000*sin(100)));
    vertex(x, y);
    xoff += random(0.01,sin(0.1));
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(600,random(50,800));
  fill(218, random(0,172), 156,5);
  stroke(255,200);
  rotate(40);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff*20), 0, 1, 20,random(500,2000*sin(100)));
    vertex(x, y);
    xoff2 += random(0.01,sin(0.1));
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
