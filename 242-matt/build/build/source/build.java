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
  //filter(flipHalfY); //flip half composition with glsl shader
  //filter(flipHalf); //flip half composition with glsl shader
}

public void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(255);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(0,100);
  rotate(random(360));
  translate(mouseX,mouseY);
  quad(sin(random(px*speed)),random(py*speed), random(py*speed), random(px*speed), random(py*speed), random(py*speed), cos(random(px*speed)), random(px*speed));

  stroke(255);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(0,100);
  ellipse(sin(random(px*speed)),sin(random(px*speed)), random(px*speed), random(px*speed));

  stroke(255);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(0,100);
  rotate(random(360));
  quad(tan(random(px*speed)),sin(random(py*speed)), cos(random(cos(py*speed)))*40, random(px*speed), random(py*speed), random(py*speed), tan(random(px*speed)), random(px*speed));
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
