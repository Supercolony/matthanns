void setup() {
  size(1280, 720);
  background(255);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  noCursor();
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(255,20*speed);
  fill(random(0,63*speed), random(0,176*speed), random(0,275),50);
  translate(mouseX,mouseY);
  triangle(x*random(5,25*speed), x*random(5,100*speed), y*random(5,100*speed), y*random(5,100), speed, speed);
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
