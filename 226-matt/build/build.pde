void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(255);
  fill(random(100,217), 47, 57,50);
  strokeWeight(speed);
  translate(mouseX,mouseY);
  triangle(x*random(5), x*random(5), y*random(5), y*random(5), speed, speed);
  rect(x*random(25), x*random(25), speed, speed);
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
