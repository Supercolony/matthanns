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

public void setup() {
  size(1280, 720);
  background(253, 202, 59);
}

public void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  noCursor();
}

public void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(107, 199, 197,50*speed);
  rotate(random(0,360));
  fill(random(242,255*speed), random(97,255*speed), random(53,255),50);
  translate(mouseX,mouseY);
  triangle(x*random(5,105*speed), x*random(5,100*speed), y*random(5,100*speed), y*random(5,100), speed, speed);
  triangle(x*random(50,205*speed), x*random(50,500*speed), y*random(500,100*speed), y*random(500,100), speed, random(speed));
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
