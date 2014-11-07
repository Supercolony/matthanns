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
  background(74, 6, 28);
}

public void draw() {
  pushMatrix();
  noFill();
  stroke(222, 18, 85,20);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 200,900);
    vertex(x, y);
    xoff += 0.03f;
  }
  yoff += 0.01f;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  noFill();
  stroke(250, 216, 227,10);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff), 0, 1, 200,700);
    vertex(x, y);
    xoff2 += 0.01f;
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
