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
  size(800,800, OPENGL);
  background(12, 22, 178);
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
