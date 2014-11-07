import processing.pdf.*; 

PShape geo1;
PShape geo2;
PShape geo3;

void setup() {
  size(1000,1000);
  beginRecord(PDF, "supercolony-####.pdf");
  background(255);
 
   
  geo1 = loadShape("geometrics_11.svg");
  geo1.disableStyle();
  
 
  geo2 = loadShape("geometrics_10.svg");
  geo2.disableStyle();

  
  
  geo3 = loadShape("geometrics_8.svg");
  geo3.disableStyle();
  
  smooth();
  
}

void draw() {
 
  pushMatrix();
 
  shape(geo1, random(2000), random(2000), 500, 500);
  geo1.rotate(random(5,45));
  stroke(4,127,204,50);
  fill(102,204,204,random(20,100));
  //noFill();
  popMatrix();
  
  pushMatrix();
  shape(geo2, random(2000) , random(2000), 700,700);
  geo2.rotate(random(5,45));
  stroke(#ffcc33, 80);
  fill(#ffff00,random(20,100));
  //noFill();
  popMatrix();
  
  pushMatrix();
  shape(geo3, random(4000), random(4000),1000, 1000);
  geo3.rotate(random(5,45));
  stroke(#992f58,50);
  fill(#ea4c88,random(20,100));
  //noFill();
  popMatrix();
 
}

//void mousePressed() {
//  shape(geo1, random(550), random(250), 500, 500);
//  shape(geo2, random(100) , random(200), 400, 400);
//  shape(geo3, random(800), random(800), 1000, 1000);
//  geo1.rotate(random(90));
//  geo2.rotate(random(90));
//  geo3.rotate(random(90));
// 
//}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
