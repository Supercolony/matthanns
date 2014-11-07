import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import wblut.math.*; 
import wblut.processing.*; 
import wblut.core.*; 
import wblut.hemesh.*; 
import wblut.geom.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {







HE_Mesh mesh;
WB_Render render;

public void setup() {
  size(1000, 1000, OPENGL);
  background(147, 177, 209);
  smooth();
  createMesh();
  HEM_SphereInversion modifier=new HEM_SphereInversion();
  modifier.setRadius(200);
  modifier.setCenter(150, 50, 0);
  //also accepts a WB_Point
  modifier.setCutoff(1000);// maximum distance outside the inversion sphere
  modifier.setLinear(false);// if true, mirrors a point across the sphere surface instead of a true spherical inversion
  mesh.modify(modifier);
  render=new WB_Render(this);
}

public void draw() {
  lights();
  pushMatrix();
  translate(500, 1000*cos(frameCount*PI/2000), 0);
  rotateY(5*cos(frameCount*PI/1000));
  rotateX(5*cos(frameCount*PI/1000));
  rotateZ(5*cos(frameCount*PI/1000));
  rotateZ(5*cos(frameCount*PI/1000));
  fill(254, 68, 62, 10);
  noStroke();
  render.drawFaces(mesh);
  popMatrix();

  pushMatrix();
  translate(500, 1000*cos(frameCount*PI/2000), 0);
  rotateY(8*cos(frameCount*PI/2000));
  rotateX(8*cos(frameCount*PI/2000));
  rotateZ(8*cos(frameCount*PI/2000));
  rotateZ(8*cos(frameCount*PI/2000));
  fill(59, 94, 169,10);
  noStroke();
  render.drawFaces(mesh);
  popMatrix();
}


public void createMesh() {
  HEC_Cube creator=new HEC_Cube(100*noise(100.5f,1000.5f), 1,1, 1);
  mesh=new HE_Mesh(creator);
  mesh.modify(new HEM_Extrude().setDistance(300));
  mesh=new HE_Mesh(new HEC_FromFrame().setFrame(mesh).setMaximumStrutLength(100*noise(100.5f,1000.5f)));
}

public void keyPressed() {
  if (key == 's') {
    //stop();
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
