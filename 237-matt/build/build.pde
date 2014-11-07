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
  stroke(166, 203, 253);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(32, 63, 117);
  translate(mouseX,mouseY);
  quad(random(px*frameCount*2),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*frameCount*speed), random(px*speed*20*frameCount), random(px*speed));

  stroke(133, 173, 214);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(166, 203, 253);
  quad(random(px*frameCount*speed*2),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), random(px*speed), random(px*speed*20));

  stroke(255);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(5);
  fill(245, 189, 43);
  quad(random(frameCount*px*speed*10),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*frameCount*speed), random(px*speed*20), random(px*speed));
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
