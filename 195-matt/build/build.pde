import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh;
WB_Render render;

void setup() {
  size(1000, 1000, OPENGL);
  background(255);
  smooth();
  createMesh();
  HEM_SphereInversion modifier=new HEM_SphereInversion();
  modifier.setRadius(200);
  modifier.setCenter(50, random(1,200), 0);
  //also accepts a WB_Point
  modifier.setCutoff(1000);// maximum distance outside the inversion sphere
  modifier.setLinear(false);// if true, mirrors a point across the sphere surface instead of a true spherical inversion
  mesh.modify(modifier);
  render=new WB_Render(this);
}

void draw() {

  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(0,0,0, -1, -1, 1);
  pushMatrix();
  translate(500, 500*frameCount*PI/1000, 0);
  rotateY(20*frameCount*PI/1000);
  rotateX(5*frameCount*PI/1000);
  rotateZ(5*frameCount*PI/1000);
  fill(255);
  noStroke();
  render.drawFaces(mesh);
  render.drawEdges(mesh);
  popMatrix();
}


void createMesh() {
  HEC_Cube creator=new HEC_Cube(500*noise(100.5,1000.5), 1,1, 1);
  mesh=new HE_Mesh(creator);
  mesh.modify(new HEM_Extrude().setDistance(300));
  mesh=new HE_Mesh(new HEC_FromFrame().setFrame(mesh).setMaximumStrutLength(5*noise(100.5,1000.5)));
}

void keyPressed() {
  if (key == 's') {
    //stop();
    saveFrame();
  }
}
