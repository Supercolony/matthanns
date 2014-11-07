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

float depth = -1000;

public void setup(){
    size(1000,1000,OPENGL);
    background(0);
     float[][] values=new float[1024][1024];
  for (int j = 0; j < 1024; j++) {
    for (int i = 0; i < 1024; i++) {
      values[i][j]=20*noise(100.5f,1000.5f*(j));
    }
  }
 
   
    //Create the grid
    HEC_Grid creator=new HEC_Grid();
    creator.setU(100);// number of cells in U direction
    creator.setV(100);// number of cells in V direction
    creator.setUSize(1000);// size of grid in U direction
    creator.setVSize(1000);// size of grid in V direction
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
     vertices[i][0]*=2.2f+.2f*cos(HALF_PI/100*i+HALF_PI); 
     vertices[i][1]*=12.2f+.2f*sin(HALF_PI/100*i+QUARTER_PI);
     vertices[i][2]*=random(10,100)+1.2f*cos(HALF_PI/500*i+noise(200.5f,200.5f));
    }
     
    //Use the exported faces and vertices as source for a HEC_FaceList
    HEC_FromFacelist faceList=new HEC_FromFacelist().setFaces(faces).setVertices(vertices);
    modifiedMesh=new HE_Mesh(faceList);
    
    render=new WB_Render(this);


}

  public void draw(){
  
    lights();
    translate(300,300,depth);
    rotateY(mouseX*1.0f/width*TWO_PI);
    rotateX(mouseY*1.0f/height*TWO_PI);
    fill(22,134,102,random(40,255));
    noStroke();
    //render.drawFaces(mesh);
    stroke(11,67,51);
    //render.drawEdges(mesh);
    render.drawFaces(modifiedMesh);
    //render.drawEdges(modifiedMesh);
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
