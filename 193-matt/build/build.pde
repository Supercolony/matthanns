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
    background(255);
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
    creator.setVSize(random(300,500));// size of grid in V direction
    creator.setWValues(values);// displacement of grid points (W value)
    mesh=new HE_Mesh(creator);

    //Export the faces and vertices
    float[][] vertices = mesh.getVerticesAsFloat(); // first index = vertex index, second index = 0..2, x,y,z coordinate
    int [][] faces = mesh.getFacesAsInt();// first index = face index, second index = index of vertex belonging to face

    //Do something with the vertices, x, y, z
    for(int i=0;i<mesh.numberOfVertices();i++){
     vertices[i][0]*=random(12.2,cos(frameCount*PI/100))+2.2*cos(HALF_PI/100*i+HALF_PI+noise(200.5,200.5));
     vertices[i][1]*=random(12.2,20)+2.2*sin(HALF_PI/100*i+QUARTER_PI+noise(200.5,200.5));
     vertices[i][2]*=random(100,300)+10.2*cos(HALF_PI/500*i+QUARTER_PI+noise(20.5,1000.5));
    }

    //Use the exported faces and vertices as source for a HEC_FaceList
    HEC_FromFacelist faceList=new HEC_FromFacelist().setFaces(faces).setVertices(vertices);
    modifiedMesh=new HE_Mesh(faceList);

    //Create the grid
    HEC_Grid creator2=new HEC_Grid();
    creator2.setU(100);// number of cells in U direction
    creator2.setV(100);// number of cells in V direction
    creator2.setUSize(400);// size of grid in U direction
    creator2.setVSize(500);// size of grid in V direction
    creator2.setWValues(values);// displacement of grid points (W value)
    mesh=new HE_Mesh(creator2);

    //Export the faces and vertices
    float[][] vertices2 = mesh.getVerticesAsFloat(); // first index = vertex index, second index = 0..2, x,y,z coordinate
    int [][] faces2 = mesh.getFacesAsInt();// first index = face index, second index = index of vertex belonging to face

    //Do something with the vertices, x, y, z
    for(int i=0;i<mesh.numberOfVertices();i++){
     vertices2[i][0]*=random(12.2,20)+20.2*cos(HALF_PI/100*i+HALF_PI+noise(200.5,200.5));
     vertices2[i][1]*=random(12.2,20)+2.2*sin(HALF_PI/100*i+QUARTER_PI+noise(200.5,200.5));
     vertices2[i][2]*=random(10*cos(frameCount*PI/100),1000)+10.2*cos(HALF_PI/500*i+QUARTER_PI+noise(20.5,1000.5));
    }

    //Use the exported faces and vertices as source for a HEC_FaceList
    HEC_FromFacelist faceList2=new HEC_FromFacelist().setFaces(faces2).setVertices(vertices2);
    modifiedMesh2=new HE_Mesh(faceList);

    render=new WB_Render(this);


}

  void draw(){
    pushMatrix();
    translate(10.5*cos(frameCount*PI/90),500,depth);
    fill(180, 38, 15);
    scale(1.2*cos(frameCount*PI/90));
    rotateZ(frameCount*PI/30);
    rotateX(frameCount*PI/30);
    stroke(54, 32, 5);
    render.drawFaces(modifiedMesh);
    popMatrix();

    pushMatrix();
    translate(500,10.5*cos(frameCount*PI/90),depth);
    fill(230, 150, 50);
    scale(1.2*cos(frameCount*PI/100));
    rotateZ(frameCount*PI/50);
    rotateX(frameCount*PI/50);
    stroke(54, 32, 5);
    render.drawFaces(modifiedMesh2);
    popMatrix();

    pushMatrix();
    translate(500,10.5*cos(frameCount*PI/90),depth);
    fill(255);
    scale(1.2*cos(frameCount*PI/120));
    rotateZ(frameCount*PI/50);
    rotateX(frameCount*PI/50);
    stroke(54, 32, 5);
    render.drawFaces(modifiedMesh);
    popMatrix();


  }

void keyPressed() {
  if (key == 's') {
    //stop();
    saveFrame();
  }
}
