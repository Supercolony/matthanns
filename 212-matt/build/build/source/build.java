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

  translate(random(width),5*random(height));
  scale(2);
  rotate(45);
  fill(0,10);
  stroke(207, 32, 36,random(10,100));
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= 5000; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 50,200);
    vertex(x, y);
    xoff += 0.04f;
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
