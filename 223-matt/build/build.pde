void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(random(255),random(255),random(255),20);
  strokeWeight(speed);
  noFill();
  ellipse(x*random(5), y, speed, speed);
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
