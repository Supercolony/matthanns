import processing.opengl.*;
import processing.pdf.*;

Arcs a;

int num = 250;
int rotmax = 90;
boolean record;

void setup() {
  if (record) {
    beginRaw(PDF, "output-###.pdf");
  }
  size(1000,1000, OPENGL);

  a = new Arcs(num);
}

void draw() {

  background(138,90,171);

  translate(width / 2, height / 2);

  float rot = radians(frameCount * 0.5f);
  rotateY(rot);
  rotateX(rot);
  rotateZ(rot);

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
        rot[i] = new PVector(20, random(500,height), 500);
        siz[i] = random(500, 1500);
        r[i] = random(rotmax);
      } else {
        r[i] = random(rotmax);
      }
    }
    dir = random(rotmax);
    dirD = random(-10, 1);
    sw = random(1, 90);
    sm = 1.0f;
    eas = 1.05f;

    float prob = random(100);
    if (prob < 100)
    // col = random(0,128);
    col = color(242,89,48);
    // col = color(0, random(255));
    if (prob > 50)
    // col = random(128,255);
    col = color(74,19,83);
    // col = color(random(128, 255), 0, 0);
  }

  void render() {
    update();
    lines();
    plane();
  }

  void update() {
    dir += dirD;
  }

  void lines() {
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

  void plane() {
    pushMatrix();

    rotateX(rot[1].x);
    rotateY(rot[1].y);
    rotateZ(rot[1].z);

    noStroke();
    fill(col);

    arc(random(0,width/frameCount*3), random(0,height/frameCount*3), siz[1], siz[2], radians(r[0] + dir), radians(r[2] + dir));

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

  void run() {
    for (int i = 0; i < arcol.size(); i++) {
      Arc af = (Arc) arcol.get(i);
      af.render();
    }
  }

}

void keyPressed() {
  if (key == 's') {
    
    //record = true;
    stop();
  }
}