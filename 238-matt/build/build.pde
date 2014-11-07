PShader flipHalf;
PShader flipHalfY;

void setup() {
  size(1000,1000, OPENGL);
  background(32, 63, 117);
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
  stroke(157, 68, 41);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(235, 102, 61);
  translate(mouseX,mouseY);
  quad(random(px*speed),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), random(px*speed), random(px*speed));

  stroke(255, 138, 46);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(250, 215, 53);
  ellipse(random(px*speed),random(px*speed), random(px*speed), random(px*speed));

  stroke(187, 51, 43);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(255, 19, 46);
  quad(random(px*speed),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), random(px*speed), random(px*speed));
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
