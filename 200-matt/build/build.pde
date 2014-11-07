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
  modifier.setCenter(1, 0, 0);
  //also accepts a WB_Point
  modifier.setCutoff(1000);// maximum distance outside the inversion sphere
  modifier.setLinear(false);// if true, mirrors a point across the sphere surface instead of a true spherical inversion
  mesh.modify(modifier);
  render=new WB_Render(this);
}

void draw() {
  lights();
  pushMatrix();
  translate(500, 1000*cos(frameCount*PI/2000), 0);
  rotateY(5*cos(frameCount*PI/1000));
  rotateX(5*cos(frameCount*PI/1000));
  rotateZ(5*cos(frameCount*PI/1000));
  rotateZ(5*cos(frameCount*PI/1000));
  fill(230, 65, 61, 30);
  noStroke();
  render.drawFaces(mesh);
  popMatrix();

  pushMatrix();
  translate(500, 1000*cos(frameCount*PI/2000), 0);
  rotateY(20*cos(frameCount*PI/2000));
  rotateX(20*cos(frameCount*PI/2000));
  rotateZ(20*cos(frameCount*PI/2000));
  rotateZ(20*cos(frameCount*PI/2000));
  fill(245, 234, 52,30);
  noStroke();
  render.drawFaces(mesh);
  popMatrix();
}


void createMesh() {
  HEC_Cube creator=new HEC_Cube(100*noise(100.5,1000.5), 1,1, 1);
  mesh=new HE_Mesh(creator);
  mesh.modify(new HEM_Extrude().setDistance(300));
  mesh=new HE_Mesh(new HEC_FromFrame().setFrame(mesh).setMaximumStrutLength(10*noise(100.5,1000.5)));
}

void keyPressed() {
  if (key == 's') {
    //stop();
    saveFrame();
  }
}
