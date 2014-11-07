import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.opengl.*; 
import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {




float depth = 200;
float a = 0;
boolean record;


public void setup(){
   size(1000, 1000, P3D);
}

public void draw(){
  if (record) {
    beginRaw(PDF, "output.pdf");
  }
  background(18,85,244);
  
  float cameraY = height/1;
  float cameraX = width/1;
  translate(width/2, height/2, -depth/2);
  
  rotateY(frameCount*PI/1000);
  float fov = cameraX/PApplet.parseFloat(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0f);
  float aspect = PApplet.parseFloat(width)/PApplet.parseFloat(height);
  perspective(fov, aspect, cameraZ/2000.0f, cameraZ*2000.0f);
  
  translate(width/10, height/10, depth/2);
 
  
  fill(0);
  noStroke();
 
  a = constrain(a,0,255);

  // setup for space machine craziness
  
  
  for(int i=0; i<10; i++) {
  float r = random(10, 80);            
  rotateX(frameCount*PI/500);
  rotateY(frameCount*PI/1000);
  for (int y = -2; y < 2; y++) {
    for (int x = -2; x < 2; x++) {
      for (int z = -2; z < 2; z++) {
       
        fill(253,79,42);
        stroke(18,85,244);
        pushMatrix();
        translate(200*x, 300*y, 100*z);
        box(r, 50, r);
        popMatrix();
        
        fill(53,165,248);
        stroke(18,85,244);
        pushMatrix();
        translate(100*x, r*r/20, 100*z);
        box(50, r, r);
        popMatrix();
        
        fill(74,192,154);
        stroke(18,85,244);
        pushMatrix();
        translate(100*x, 300*y, 100*z);
        box(r, r, 500);
        popMatrix();
      }
    }
  }
  }
  if (record) {
    endRaw();
    record = false;
  }
  
}

public void keyPressed() {
  if (key == 's') {
    //saveFrame();
    record = true;
    //stop();
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
