import processing.opengl.*;

Arcs a;

int num = 550;
int rotmax = 15;
boolean record;

void setup() {
  size(1000,1000, OPENGL);
  background(152,174,187);
  a = new Arcs(num);
}

void draw() {

  
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
    col = color(62,154,179,random(10,50));
    if (prob > 20)
    col = color(3,50,70,random(10,80));
    if (prob >40)
    col = color(24,80,103,random(10,20));
    if (prob >80)
    col = color(46,134,156,random(10,80));
    if (prob >90)
    col = color(152,174,187,random(10,50));
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
    strokeWeight(sw);
    stroke(col);

    arc(pos*PI, pos*PI, siz[0], siz[0], radians(r[0]*PI + dir), radians(r[1]*PI + dir));
    //quad(10.0,10.0,siz[0],siz[0],siz[0],radians(r[0] + dir),radians(r[1] + dir),radians(r[0] + dir));
    hint(DISABLE_DEPTH_TEST);
    popMatrix();
  }

  void plane() {

    pushMatrix();

    rotateX(rot[1].x);
    rotateY(rot[1].y);
    rotateZ(rot[1].z);

    //stroke(col);
    noStroke();
    fill(col);

    arc(pos*PI,pos*PI, siz[1], siz[1], radians(r[0]*PI + dir), radians(r[1]*PI + dir));
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

  void run() {
    for (int i = 0; i < arcol.size(); i++) {
      Arc af = (Arc) arcol.get(i);
      af.render();
    }
  }

}

void keyPressed() {
  if (key == 's') {
    //stop();
    saveFrame();
  }
}