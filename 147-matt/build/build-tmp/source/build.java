import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.opengl.*; 
import processing.pdf.*; 

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
int rotmax = 90;
boolean record;

public void setup() {
  if (record) {
    beginRaw(PDF, "output-###.pdf");
  }
  size(1000,1000, P3D);

  a = new Arcs(num);
}

public void draw() {

  background(255);

  translate(width / 2, height / 2);

  float rot = radians(frameCount * 0.5f);
  rotateY(rot);

  a.run();
  saveFrame();
  // if (record) {
  //   endRaw();
  //   record = false;
  // }
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
  int num=14;

  Arc() {

    rot = new PVector[num-2];
    siz = new float[num-2];
    r = new float[num];

    for (int i = 0; i<num; i++){
      if(i<10) {
        rot[i] = new PVector(random(10,width), random(500,height), random(width));
        siz[i] = random(500, 1000);
        r[i] = random(rotmax);
      } else {
        r[i] = random(rotmax);
      }
    }
    dir = random(rotmax);
    dirD = random(-10, 10);
    sw = random(1, 90);
    sm = 1.0f;
    eas = 1.05f;

    float prob = random(100);
    if (prob < 100)
    // col = random(0,128);
    col = color(0, random(255), 255);
    // col = color(0, random(255));
    if (prob > 50)
    // col = random(128,255);
    col = color(255, random(255), 0);
    // col = color(random(128, 255), 0, 0);
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

    rotateX(rot[0].x);
    rotateY(rot[0].y);
    rotateZ(rot[0].z);

    noFill();
    strokeWeight(sw);
    stroke(col);

    arc(0, 0, siz[0], siz[0], radians(r[0] + dir), radians(r[1] + dir));

    popMatrix();
  }

  public void plane() {
    pushMatrix();

    rotateX(rot[1].x);
    rotateY(rot[1].y);
    rotateZ(rot[1].z);

    noStroke();
    fill(col);

    arc(0, 0, siz[1], siz[1], radians(r[2] + dir), radians(r[3] + dir));

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
    
    //record = true;
    stop();
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
