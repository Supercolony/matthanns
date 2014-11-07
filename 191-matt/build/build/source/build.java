import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import wblut.math.*; 
import wblut.processing.*; 
import wblut.core.*; 
import wblut.hemesh.*; 
import wblut.geom.*; 
import processing.opengl.*; 

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
HE_Mesh modifiedMesh;
HE_Mesh modifiedMesh2;
WB_Render render;

float depth = -2000;

public void setup(){
    size(1000,1000,OPENGL);
    background(198,99,100);
     float[][] values=new float[1024][1024];
  for (int j = 0; j < 1024; j++) {
    for (int i = 0; i < 1024; i++) {
      values[i][j]=10*noise(100.5f,1000.5f*(j));
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

    //Export the faces and vertices
    float[][] vertices = mesh.getVerticesAsFloat(); // first index = vertex index, second index = 0..2, x,y,z coordinate
    int [][] faces = mesh.getFacesAsInt();// first index = face index, second index = index of vertex belonging to face

    //Do something with the vertices, x, y, z
    for(int i=0;i<mesh.numberOfVertices();i++){
     vertices[i][0]*=random(12.2f,20)+2.2f*cos(HALF_PI/100*i+HALF_PI+noise(200.5f,200.5f));
     vertices[i][1]*=random(12.2f,20)+2.2f*sin(HALF_PI/100*i+QUARTER_PI+noise(200.5f,200.5f));
     vertices[i][2]*=random(100,300)+10.2f*cos(HALF_PI/500*i+QUARTER_PI+noise(20.5f,1000.5f));
    }

    //Use the exported faces and vertices as source for a HEC_FaceList
    HEC_FromFacelist faceList=new HEC_FromFacelist().setFaces(faces).setVertices(vertices);
    modifiedMesh=new HE_Mesh(faceList);

    //Create the grid
    HEC_Grid creator2=new HEC_Grid();
    creator2.setU(100);// number of cells in U direction
    creator2.setV(100);// number of cells in V direction
    creator2.setUSize(10);// size of grid in U direction
    creator2.setVSize(5);// size of grid in V direction
    creator2.setWValues(values);// displacement of grid points (W value)
    mesh=new HE_Mesh(creator2);

    //Export the faces and vertices
    float[][] vertices2 = mesh.getVerticesAsFloat(); // first index = vertex index, second index = 0..2, x,y,z coordinate
    int [][] faces2 = mesh.getFacesAsInt();// first index = face index, second index = index of vertex belonging to face

    //Do something with the vertices, x, y, z
    for(int i=0;i<mesh.numberOfVertices();i++){
     vertices2[i][0]*=random(12.2f,20)+2.2f*cos(HALF_PI/100*i+HALF_PI+noise(200.5f,200.5f));
     vertices2[i][1]*=random(12.2f,20)+2.2f*sin(HALF_PI/100*i+QUARTER_PI+noise(200.5f,200.5f));
     vertices2[i][2]*=random(100,1000)+10.2f*cos(HALF_PI/500*i+QUARTER_PI+noise(20.5f,1000.5f));
    }

    //Use the exported faces and vertices as source for a HEC_FaceList
    HEC_FromFacelist faceList2=new HEC_FromFacelist().setFaces(faces2).setVertices(vertices2);
    modifiedMesh2=new HE_Mesh(faceList);

    render=new WB_Render(this);


}

  public void draw(){

    pushMatrix();
    translate(500,500,depth);
    fill(255,50);
    scale(sin(frameCount*PI/100));
    rotateZ(frameCount*PI/10);
    rotateX(frameCount*PI/10);
    stroke(198,99,100);
    render.drawFaces(modifiedMesh);
    popMatrix();

    pushMatrix();
    translate(500,500,depth);
    fill(255,50);
    scale(sin(frameCount*PI/100));
    rotateY(frameCount*PI/10);
    rotateX(frameCount*PI/10);
    stroke(198,99,100);
    render.drawFaces(modifiedMesh2);
    popMatrix();

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
