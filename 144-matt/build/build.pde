import processing.opengl.*;
import processing.pdf.*;

float depth = 200;
float a = 0;
boolean record;


void setup(){
   size(1000, 1000, P3D);
}

void draw(){
  if (record) {
    beginRaw(PDF, "output.pdf");
  }
  background(240,80,56);
  
  float cameraY = height/1;
  float cameraX = width/1;
  translate(width/2, height/2, -depth/2);
  
  rotateY(frameCount*PI/1000);
  float fov = cameraX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  perspective(fov, aspect, cameraZ/2000.0, cameraZ*2000.0);
  
  translate(width/10, height/10, depth/2);
 
  
  fill(255);
  stroke(240,80,56);
 
  a = constrain(a,0,255);

  // setup for space machine craziness
  
  
  for(int i=0; i<10; i++) {
  float r = random(10, 80);            
  rotateX(frameCount*PI/500);
  rotateY(frameCount*PI/1000);
  for (int y = -2; y < 2; y++) {
    for (int x = -2; x < 2; x++) {
      for (int z = -2; z < 2; z++) {
       
        pushMatrix();
        translate(200*x, 300*y, 100*z);
        box(500, 10, 10);
        popMatrix();
        
        pushMatrix();
        translate(100*x, r*r/20, 100*z);
        box(10, 500, 10);
        popMatrix();
        
        pushMatrix();
        translate(100*x, 300*y, 100*z);
        box(10, 10, 500);
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

void keyPressed() {
  if (key == 's') {
    //saveFrame();
    record = true;
    //stop();
  }
}

