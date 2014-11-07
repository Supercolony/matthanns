import processing.opengl.*;

float depth = 200;
float a = 0;


void setup(){
   size(1000, 1000, OPENGL);
}

void draw(){
  background(255);
  
  float cameraY = height/1;
  float cameraX = width/1;
  translate(width/2, height/2, -depth/2);
  
  rotateY(frameCount*PI/1000);
  float fov = cameraX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  perspective(fov, aspect, cameraZ/2000.0, cameraZ*2000.0);
  
  translate(width/10, height/10, depth/2);
 
  
  fill(0);
  noStroke();
 
  a = constrain(a,0,255);

  // setup for space machine craziness
  fill(255);
  stroke(0);
  
  for(int i=0; i<10; i++) {
  float r = random(10, 80);            
  rotateX(frameCount*PI/50);
  rotateY(frameCount*PI/1000);
  for (int y = -2; y < 2; y++) {
    for (int x = -2; x < 2; x++) {
      for (int z = -2; z < 2; z++) {
       
        pushMatrix();
        translate(100*x, r*y/20, 100*z/2);
        box(r, 50, 10);
        popMatrix();
  
        pushMatrix();
        translate(100*x, r*r/20, 4*z/2);
        box(50, r, r);
        popMatrix();
        
        
        pushMatrix();
        translate(100*x, 300*y, 4*z);
        box(r, r, 500);
        popMatrix();
      }
    }
  }
  }
  
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
    //stop();
  }
}

