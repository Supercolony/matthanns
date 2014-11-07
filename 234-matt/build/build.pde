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
  stroke(15, 96, 207);
  strokeWeight(10);
  fill(88, 150, 229);
  translate(mouseX,mouseY);
  triangle(random(px*speed), random(py*speed), random(px*speed), random(px*speed), random(py*speed),random(px*speed));
  ellipse(px, py, 20*speed, 20*speed);

  stroke(221, 86, 194);
  strokeWeight(10);
  fill(184, 114, 242);
  triangle(random(px*speed), random(py*speed), random(px*speed), random(px*speed), random(py*speed),random(px*speed));
  ellipse(px, py, 18*speed, 18*speed);

  stroke(70, 92, 143);
  strokeWeight(10);
  fill(223, 231, 245);
  triangle(random(px*speed), random(py*speed), random(px*speed), random(px*speed), random(py*speed),random(px*speed));
  ellipse(px, py, 15*speed, 15*speed);
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
