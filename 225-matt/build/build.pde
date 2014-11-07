void setup() {
  size(800, 800);
  background(244, 89, 48);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(85, random(0,207), 222,50);
  strokeWeight(speed);
  noFill();
  translate(random(width),random(height));
  triangle(x*random(5), x*random(5), y*random(5), y*random(5), speed, speed);
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
