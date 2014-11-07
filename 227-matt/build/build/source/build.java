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
  background(255);
}

public void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  noCursor();
}

public void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(255,20*speed);
  fill(random(0,63*speed), random(0,176*speed), random(0,275),50);
  translate(mouseX,mouseY);
  triangle(x*random(5,25*speed), x*random(5,100*speed), y*random(5,100*speed), y*random(5,100), speed, speed);
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
