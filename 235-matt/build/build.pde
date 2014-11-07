PShader flipHalf;
PShader flipHalfY;

void setup() {
  size(1000,1000, OPENGL);
  background(15, 96, 207);
  smooth();
  flipHalf = loadShader("flipHalf.glsl");
  flipHalfY = loadShader("flipHalfY.glsl");
}

void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  filter(flipHalfY); //flip half composition with glsl shader
  filter(flipHalf); //flip half composition with glsl shader
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(237, 46, 123);
  strokeWeight(10);
  fill(255);
  translate(mouseX,mouseY);
  triangle(random(px*speed*2), random(py*speed), random(px*speed), random(px*speed), random(py*speed),random(px*speed*2));

  stroke(255);
  strokeWeight(10);
  fill(46, 175, 237);
  triangle(random(px*speed), random(py*speed), random(px*speed), random(px*speed), random(py*speed*2),random(px*speed*2));

  stroke(255);
  strokeWeight(10);
  fill(104, 42, 241);
  triangle(random(px*speed), random(py*speed), random(px*speed), random(px*speed), random(py*speed),random(px*speed*5));
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
