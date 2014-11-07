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
  stroke(79, 90, 56);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(231, 218, 174);
  translate(mouseX,mouseY);
  quad(random(px*speed),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), cos(random(px*speed)), random(px*speed));

  stroke(54, 74, 65);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(30, 43, 33);
  ellipse(random(px*speed),sin(random(px*speed)), random(px*speed), random(px*speed));

  stroke(146, 161, 158);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(206, 212, 212);
  quad(random(px*speed),sin(random(py*speed)), random(py*speed), random(px*speed), random(py*speed), random(py*speed), tan(random(px*speed)), random(px*speed));
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
