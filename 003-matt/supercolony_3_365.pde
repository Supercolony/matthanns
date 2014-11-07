import processing.pdf.*;

int rStart, rStop;
float[][] radii;
float nX, nY, yY;
float masterX, masterY;
int models;
float nRadius, outRadius;
int degs;
float inBetween, totalTweens;
int circleNumber;
int value = 0;
 
void setup() {
  colorMode(RGB);
  smooth();
  size(1000, 1000);
  //beginRecord(PDF, "supercolony_3_####.pdf");
  degs=360;
  nRadius=1.300;
  outRadius=random(420);
  totalTweens=40.0;
  inBetween=0.0;
  circleNumber=2;
  background(#FFFFFF);
  models=109;
  radii = new float[models][degs];
  doSetupModels();
  masterX=-300;
  masterY=height/2;
  colorMode(RGB);
  strokeWeight(0.2);
  fill(255, 4);
}
 
void doSetupModels() {
  for (int i=0;i<models;i++) {
    float[] ptTemp = new float[degs];
    float zz=random(3);
    radii[i]=doNewCircle(zz, zz-1);
  }
}
 
void draw() {
  if (masterX>2100) {
    masterX=-225;
    circleNumber=5;
    inBetween=0;
    noLoop();
  }
  if (inBetween<totalTweens && circleNumber+1<models) {
    float[] hybridCircle = new float[degs];
    hybridCircle=doInterpolate(radii[circleNumber], radii[circleNumber+1], inBetween/totalTweens);
    doSimpleOutline(hybridCircle);
    inBetween++;
  }
  else {
    if (circleNumber+1<models) {
      circleNumber++;
      inBetween=0;
    }
  }
}
 
float[] doInterpolate(float[] cOne, float[] cTwo, float beTwixt) {
  float[] ptTemp = new float[degs];
  for (int j=0; j<degs;j++) {
    ptTemp[j]=coslerp(cOne[j], cTwo[j], beTwixt);
  }
  return ptTemp;
}
 
void doSimpleOutline(float[] myCircle) {
  masterX=masterX+3.0;
  doDrawCircle(int(masterX), int(masterY), myCircle);
}
 
float coslerp(float val1, float val2, float amt) {
  amt = map (cos(amt*PI), 1.0, -1.0, 0, 1.0);
  return lerp(val1, val2, amt);
}
 
 
 
 
 
void doStripes(int xPos, int yPos, float[] ptRad) { 
  pushMatrix();
  translate(xPos, yPos);
  for (int j=0;j<degs;j=j+1) {
    float rj=radians(j);
    float xA=sin(rj)*ptRad[j];
    float yA=cos(rj)*ptRad[j];
  }
  popMatrix();
}
 
 
void doDrawCircle(int xPos, int yPos, float[] ptRad) { 
  pushMatrix();
  translate(xPos, yPos);
  rotate(radians(frameCount*0.95125));
 
  color col=color(108, 202, 204);
  //color col=color(205, 73, 146);
  //color col=color(243, 142, 48);
  stroke(col);
  beginShape(); 
  for (int j=0;j<degs;j=j+1) {
    float rj=radians(j);
    float xA=sin(rj)*ptRad[(j)]*2;
    float yA=cos(rj)*ptRad[(j)];
    vertex(xA, yA);
  }
  endShape();
  popMatrix();
}
 
float[] doNewCircle(float nXstart, float nYstart) {
  float[] theCircle = new float[degs];
  for (int i=0+int(frameCount/2.0);i<degs+int(frameCount/2.0);i++) {
    nX=sin(radians(i))*nRadius+nXstart;
    nY=cos(radians(i))*nRadius+nYstart;
    theCircle[i]=map(noise(nX, nY), 0, 1, 0, outRadius);
  }
  return theCircle;
}

//void keyPressed() {
//  if (key == 'q') {
//    endRecord();
//  }
//}

void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_3_365-###.png"); 
  }
}

