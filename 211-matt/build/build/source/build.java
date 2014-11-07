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
  background(78, 97, 176);
}

public void draw() {

  pushMatrix();
  rotate(random(180,360));
  translate(-2000,-500*yoff/20);
  scale(2);
  fill(78, 97, 176,random(1,5));
  stroke(165, 186, 255,random(20,100));
  beginShape();
  smooth();
  float xoff = 0;
  for (float x = 0; x <= width; x += 5) {
    float y = map(noise(xoff, yoff), 0, 1, 200,500);
    vertex(x, y);
    xoff += 0.05f;
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
