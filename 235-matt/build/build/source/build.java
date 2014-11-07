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
  background(15, 96, 207);
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
