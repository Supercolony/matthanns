void setup() {
  size(1280, 720);
  background(13,10,110);
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  noCursor();
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(211, 64, 115,20*speed);
  rotate(random(0,360));
  fill(random(0,13*speed), random(0,10*speed), random(0,110),50);
  translate(mouseX,mouseY);
  triangle(x*random(5,105*speed), x*random(5,100*speed), y*random(5,100*speed), y*random(5,100), speed, speed);
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
