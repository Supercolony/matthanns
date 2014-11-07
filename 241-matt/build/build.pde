PShader flipHalf;
PShader flipHalfY;

void setup() {
  size(1000,1000, OPENGL);
  background(0);
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
  stroke(255);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(0,50);
  translate(mouseX,mouseY);
  quad(sin(random(px*speed)),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), cos(random(px*speed)), random(px*speed));

  stroke(255);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(0,50);
  ellipse(sin(random(px*speed)),sin(random(px*speed)), random(px*speed), random(px*speed));

  stroke(255);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(0,50);
  quad(tan(random(px*speed)),sin(random(py*speed)), cos(random(py*speed))*40, random(px*speed), random(py*speed), random(py*speed), tan(random(px*speed)), random(px*speed));
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
