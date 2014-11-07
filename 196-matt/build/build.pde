import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh;
WB_Render render;

void setup() {
  size(1000, 1000, OPENGL);
  background(42, 110, 150);
  smooth();
  createMesh();
  HEM_SphereInversion modifier=new HEM_SphereInversion();
  modifier.setRadius(120);
  modifier.setCenter(50, random(10*frameCount*PI/10,200), 0);
  //also accepts a WB_Point
  modifier.setCutoff(1000);// maximum distance outside the inversion sphere
  modifier.setLinear(false);// if true, mirrors a point across the sphere surface instead of a true spherical inversion
  mesh.modify(modifier);
  render=new WB_Render(this);
}

void draw() {
  lights();
  pushMatrix();
  translate(500, 800*cos(frameCount*PI/2000), 0);
  rotateY(5*frameCount*PI/1000);
  rotateX(5*frameCount*PI/1000);
  rotateZ(5*frameCount*PI/1000);
  rotateZ(5*frameCount*PI/1000);
  fill(116, 199, 219);
  stroke(42, 110, 150);
  render.drawFaces(mesh);
  fill(42, 110, 150);
  render.drawEdges(mesh);
  popMatrix();
}


void createMesh() {
  HEC_Cube creator=new HEC_Cube(100*noise(100.5,1000.5), 1,1, 1);
  mesh=new HE_Mesh(creator);
  mesh.modify(new HEM_Extrude().setDistance(300));
  mesh=new HE_Mesh(new HEC_FromFrame().setFrame(mesh).setMaximumStrutLength(500*noise(100.5,1000.5)));
}

void keyPressed() {
  if (key == 's') {
    //stop();
    saveFrame();
  }
}
