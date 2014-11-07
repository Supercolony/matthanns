PShader flipHalf;
PShader flipHalfY;

void setup() {
  size(800,800, OPENGL);
  background(12, 22, 178);
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
  stroke(241, 90, 41);
  strokeWeight(10);
  fill(195, 16, 116);
  translate(mouseX,mouseY);
  ellipse(px, py, 20*speed, 20*speed);

  stroke(223, 10, 23);
  strokeWeight(10);
  fill(12, 22, 178);
  ellipse(px, py, 18*speed, 18*speed);

  stroke(12, 4, 29);
  strokeWeight(10);
  fill(11, 7, 97);
  ellipse(px, py, 15*speed, 15*speed);
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
