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
  background(0);
}

public void draw() {

  pushMatrix();
  translate(500,random(110,800));
  noFill();
  rotate(random(20,60));
  stroke(255,40);
  beginShape();
  smooth();
  float xoff2 = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff2, yoff*20), 0, 1, 20,200*sin(1000));
    vertex(x, y);
    xoff2 += random(0.01f,sin(0.05f));
  }
  yoff += 0.01f;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(500,random(110,800));
  fill(0,5);
  rotate(random(20,60));
  stroke(0,40);
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff*20), 0, 1, 20,700*sin(1000));
    vertex(x, y);
    xoff += random(0.01f,sin(0.05f));
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
