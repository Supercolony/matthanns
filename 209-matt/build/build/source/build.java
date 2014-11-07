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
  background(248, 245, 223);
}

public void draw() {
  pushMatrix();
  translate(0,100+yoff);
  fill(148, 218, 151,10);
  stroke(148, 218, 151,255);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 20,100);
    vertex(x, y);
    xoff += 0.05f;
  }
  yoff += 1.05f;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,10+yoff);
  fill(239, 151, 181,10);
  stroke(239, 151, 181,255);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff), 0, 1, 20,100);
    vertex(x, y);
    xoff2 += 0.03f;
  }
  yoff += 20.05f;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(0,500+yoff);
  fill(155, 204, 201,10);
  stroke(155, 204, 201,255);
  beginShape();
  smooth();
  float xoff3 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff3, yoff), 0, 1, 10,100);
    vertex(x, y);
    xoff3 += 0.01f;
  }
  yoff += 0.05f;
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
