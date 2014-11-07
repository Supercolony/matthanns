PShader flipHalf;
PShader flipHalfY;

void setup() {
  size(800,800, OPENGL);
  background(255);
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
  fill(0);
  translate(mouseX,mouseY);
  ellipse(px, py, 5*speed, 5*speed);

}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
