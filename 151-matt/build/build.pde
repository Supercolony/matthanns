import processing.opengl.*;

Arcs a;

int num = 550;
int rotmax = 360;
boolean record;

void setup() {
  size(1000,1000, OPENGL);

  a = new Arcs(num);
}

void draw() {

  background(255);

  translate(width / 2, height / 2);

  float rot = radians(frameCount * 0.5f);
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
  int num=14;

  Arc() {

    rot = new PVector[num-2];
    siz = new float[num-2];
    r = new float[num];

    for (int i = 0; i<num; i++){
      if(i<10) {
        rot[i] = new PVector(20, random(500,height), 500);
        siz[i] = random(50,500);
        r[i] = random(rotmax);
      } else {
        r[i] = random(rotmax);
      }
    }
    dir = random(rotmax);
    dirD = random(-10, 1);
    sw = random(1, 5);
    sm = 1.0f;
    eas = 1.05f;

    float prob = random(100);
    if (prob < 100)
    // col = random(0,128);
    col = color(0,128,237,100);
    // col = color(0, random(255));
    if (prob > 50)
    // col = random(128,255);
    col = color(54,199,102,100);
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

    arc(500, 10, siz[0], siz[0], radians(r[0] + dir), radians(r[1] + dir));
    hint(DISABLE_DEPTH_TEST);
    scale(-1, 1);
    popMatrix();
  }

  void plane() {
    pushMatrix();

    rotateX(rot[1].x);
    rotateY(rot[1].y);
    rotateZ(rot[1].z);

    stroke(col);
    noFill();

    arc(500, 500, siz[1], siz[1], radians(r[0] + dir), radians(r[1] + dir));
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