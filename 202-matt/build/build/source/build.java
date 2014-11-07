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

int yRand = 1000;
float sizeRand;
int patternRand = floor(random(50,400));
int count = 0;
int countRate = floor(random(0,50));

public void setup() {
  size(1000,1000);
  background(231, 244, 247);
  smooth();
}

public void draw() {

  if (count % patternRand == 0) {
    noStroke();
    noFill();
    sizeRand = random(1,10);
  }
  else {
    noFill();
    stroke(floor(random(80,175)), floor(random(176,255)), 241,floor(random(10,255)));
    strokeWeight(floor(random(5,50)));
    sizeRand = floor(random(5,1000));
  }
  pushMatrix();
  scale(-1,1);
  arc(count, (height/2+40)+random(-yRand, yRand), 50 + sizeRand, 50 + sizeRand, 0,HALF_PI);
  arc(count, (height/2+40)+random(-yRand, yRand), 100 + sizeRand, 100 + sizeRand, PI,PI+HALF_PI);
  arc(count, (height/2+40)+random(-yRand, yRand), 100 + sizeRand, 100 + sizeRand, PI,PI+QUARTER_PI);
  popMatrix();
  pushMatrix();
  rotate(-180);
  scale(-1,1);
  arc(count, (height/2+40)+random(-yRand, yRand), 50 + sizeRand, 50 + sizeRand, 0,HALF_PI);
  arc(count, (height/2+40)+random(-yRand, yRand), 100 + sizeRand, 100 + sizeRand, PI,PI+HALF_PI);
  arc(count, (height/2+40)+random(-yRand, yRand), 100 + sizeRand, 100 + sizeRand, PI,PI+QUARTER_PI);
  popMatrix();

  count += countRate;
  if (count > width) {
    count = 0;
  }
}

public void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
  if (key == 'r') {
    count = 0;
    setup();
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
