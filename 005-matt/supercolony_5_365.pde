import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh;
WB_Render render;

int value = 0;

void setup() {
  size(1280, 1280, OPENGL);
  createMesh();
  background(255);
  HEM_SphereInversion modifier=new HEM_SphereInversion();
  modifier.setRadius(250);
  modifier.setCenter(50, 0, 0);
  //also accepts a WB_Point
  modifier.setCutoff(1000);// maximum distance outside the inversion sphere
  modifier.setLinear(false);// if true, mirrors a point across the sphere surface instead of a true spherical inversion
  mesh.modify(modifier);

  render=new WB_Render(this);
}

void draw() {
  
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  translate(640, 640, 0);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  fill(255);
  noStroke();
  render.drawFaces(mesh);
  stroke(255);
  render.drawEdges(mesh);
}


void createMesh() {
  HEC_Cube creator=new HEC_Cube(300, 1,1, 1);
  mesh=new HE_Mesh(creator);
  mesh.modify(new HEM_Extrude().setDistance(300));
  mesh=new HE_Mesh(new HEC_FromFrame().setFrame(mesh).setMaximumStrutLength(20));
}

void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_5_365-###.png"); 
  }
}
