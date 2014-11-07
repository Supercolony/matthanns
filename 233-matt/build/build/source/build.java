import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {

PShader flipHalf;
PShader flipHalfY;

public void setup() {
  size(1000,1000, OPENGL);
  background(0);
  smooth();
  flipHalf = loadShader("flipHalf.glsl");
  flipHalfY = loadShader("flipHalfY.glsl");
}

public void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  filter(flipHalfY); //flip half composition with glsl shader
  filter(flipHalf); //flip half composition with glsl shader
}

public void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(243, 196, 86);
  strokeWeight(10);
  fill(0);
  translate(mouseX,mouseY);
  ellipse(px, py, 20*speed, 20*speed);
  triangle(random(px*speed), random(py*speed), random(px*speed), random(px*speed), random(py*speed),random(px*speed));

  stroke(73, 128, 211);
  strokeWeight(10);
  fill(0);
  ellipse(px, py, 18*speed, 18*speed);
  triangle(random(px*speed), random(py*speed), random(px*speed), random(px*speed), random(py*speed),random(px*speed));

  stroke(61, 199, 173);
  strokeWeight(10);
  fill(0);
  ellipse(px, py, 15*speed, 15*speed);
  triangle(random(px*speed), random(py*speed), random(px*speed), random(px*speed), random(py*speed),random(px*speed));
}

public void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
