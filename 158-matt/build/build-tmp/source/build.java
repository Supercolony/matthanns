import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

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



Arcs a;

int num = 250;
int rotmax = 45;
boolean record;

public void setup() {
  size(1000,1000, OPENGL);
  background(219,229,230);
  a = new Arcs(num);
}

public void draw() {

  
  smooth();
  translate(width / 2, height / 2);
  float rot = radians(frameCount * sin(0.8f));
  rotateY(rot);
  rotateX(rot);
  rotateZ(rot);
  a.run();
  
}

class Arc {

  PVector[] rot;
  float[] r;
  float[] siz;
  float dir, dirD;
  float sw;
  float sm;
  float eas;
  int col;
  int pos;
  int num=14;

  Arc() {

    rot = new PVector[num-2];
    siz = new float[num-2];
    r = new float[num];

    for (int i = 0; i<num; i++){
      if(i<10) {
        rot[i] = new PVector(20, random(50,height), random(50,width));
        siz[i] = random(50,500);
        r[i] = random(rotmax);
      } else {
        r[i] = random(rotmax);
      }
    }
    dir = random(rotmax);
    dirD = random(-10, 10);
    sw = random(1, 5);
    sm = 1.0f;
    eas = 1.05f;

    float prob = random(100);
    if (prob < 100)
    col = color(219,229,230,random(10,50));
    if (prob > 20)
    col = color(92,109,135,random(10,80));
    if (prob >40)
    col = color(53,55,41,random(10,20));
    if (prob >80)
    col = color(101,113,67,random(10,80));
    if (prob >90)
    col = color(165,157,154,random(10,50));
  }

  public void render() {
    update();
    lines();
    plane();
  }

  public void update() {
    dir += dirD;
  }

  public void lines() {
    pushMatrix();
    float prob = random(100);
    if (prob < 100)
      pos = 500;
    if (prob > 50)
      pos = 100;
    rotateX(rot[0].x);
    rotateY(rot[0].y);
    rotateZ(rot[0].z);

    fill(col);
    noStroke();
    //strokeWeight(sw);
    //stroke(col);

    arc(pos, pos*PI, siz[0], siz[0], radians(r[0] + dir), radians(r[1] + dir));
    quad(50.0f,50.0f,siz[0],siz[0],siz[0],radians(r[0] + dir),radians(r[1] + dir),radians(r[0] + dir));
    hint(DISABLE_DEPTH_TEST);
    popMatrix();
  }

  public void plane() {

    pushMatrix();

    rotateX(rot[1].x);
    rotateY(rot[1].y);
    rotateZ(rot[1].z);

    //stroke(col);
    noStroke();
    fill(col);

    arc(pos*PI,pos*PI, siz[1], siz[1], radians(r[0] + dir), radians(r[1] + dir));
    hint(DISABLE_DEPTH_TEST);
    popMatrix();
  }
  
}

class Arcs {

  ArrayList<Arc> arcol;

  Arcs(int num) {
    arcol = new ArrayList<Arc>();
    for (int i = 0; i < num; i++) {
      arcol.add(new Arc());
    }
  }

  public void run() {
    for (int i = 0; i < arcol.size(); i++) {
      Arc af = (Arc) arcol.get(i);
      af.render();
    }
  }

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
