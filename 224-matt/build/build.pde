void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(58,118,random(0,255),8);
  strokeWeight(speed);
  noFill();
  ellipse(x*random(5), y, speed, speed);
  triangle(x*random(5), x*random(5), x*random(5), y*random(5), speed, speed);
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
