import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;


import processing.opengl.*;


HE_Mesh mesh;
HE_Mesh modifiedMesh;
HE_Mesh modifiedMesh2;
WB_Render render;

float depth = -2000;

void setup(){
    size(1000,1000,OPENGL);
    background(42,49,59);
     float[][] values=new float[1024][1024];
  for (int j = 0; j < 1024; j++) {
    for (int i = 0; i < 1024; i++) {
      values[i][j]=10*noise(100.5,1000.5*(j));
    }
  }


    //Create the grid
    HEC_Grid creator=new HEC_Grid();
    creator.setU(100);// number of cells in U direction
    creator.setV(100);// number of cells in V direction
    creator.setUSize(100);// size of grid in U direction
    creator.setVSize(25);// size of grid in V direction
    creator.setWValues(values);// displacement of grid points (W value)
    mesh=new HE_Mesh(creator);

    //The easiest way to create a simple modifier is by exporting all vertex coordinates, change them and
    //recreate the mesh with the new coordinates. Writing a full-blown implementation of a HEM_Modifier
    //is best done in Eclipse with full access to the code repository.

    //Export the faces and vertices
    float[][] vertices = mesh.getVerticesAsFloat(); // first index = vertex index, second index = 0..2, x,y,z coordinate
    int [][] faces = mesh.getFacesAsInt();// first index = face index, second index = index of vertex belonging to face

    //Do something with the vertices, x, y, z
    for(int i=0;i<mesh.numberOfVertices();i++){
     vertices[i][0]*=random(12.2,20)+2.2*cos(HALF_PI/100*i+HALF_PI+noise(200.5,200.5));
     vertices[i][1]*=random(12.2,20)+2.2*sin(HALF_PI/100*i+QUARTER_PI+noise(200.5,200.5));
     vertices[i][2]*=random(100,300)+10.2*cos(HALF_PI/500*i+QUARTER_PI+noise(20.5,1000.5));
    }

    //Use the exported faces and vertices as source for a HEC_FaceList
    HEC_FromFacelist faceList=new HEC_FromFacelist().setFaces(faces).setVertices(vertices);
    modifiedMesh=new HE_Mesh(faceList);

    render=new WB_Render(this);


}

  void draw(){
    //horizontal line
    pushMatrix();
    translate(500,600,depth);
    fill(184,188,187);
    stroke(42,49,59);
    render.drawFaces(modifiedMesh);
    popMatrix();
    //left angled line
    pushMatrix();
    translate(20,400,depth);
    fill(184,188,187);
    rotateZ(-45);
    stroke(42,49,59);
    render.drawFaces(modifiedMesh);
    popMatrix();
    //right angled line
    pushMatrix();
    translate(980,400,depth);
    fill(184,188,187);
    rotateZ(45);
    stroke(42,49,59);
    render.drawFaces(modifiedMesh);
    popMatrix();

  }

void keyPressed() {
  if (key == 's') {
    //stop();
    saveFrame();
  }
}
