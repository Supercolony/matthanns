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

float yoff = 0.0f;

public void setup() {
  size(1000, 1000);
  background(23, 67, 88);
}

public void draw() {

  pushMatrix();
  translate(0,100);
  noFill();
  stroke(233, 131, 45,random(5,20));
  strokeWeight(2*noise(20,200));
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff*20), 0, 1, 20,1000);
    vertex(x, y);
    xoff2 += random(0.01f,0.05f);
  }
  yoff += 0.01f;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,400);
  noFill();
  stroke(94, 153, 161,random(5,20));
  strokeWeight(2*noise(20,200));
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff*20), 0, 1, 20,1000);
    vertex(x, y);
    xoff += random(0.01f,0.05f);
  }
  yoff += 0.01f;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();
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
