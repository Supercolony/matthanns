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
  stroke(94, 187, 154);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(222, 103, 76);
  translate(mouseX,mouseY);
  quad(random(px*speed*2),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), random(px*speed*20), random(px*speed));

  stroke(104, 75, 96);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(19, 133, 156);
  quad(random(px*speed*2),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), random(px*speed), random(px*speed*20));

  stroke(244, 104, 75);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(245, 190, 86);
  quad(random(px*speed*10),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), random(px*speed*20), random(px*speed));
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
