PVector[]  tabPoint;
int circlePoints = 15;
int circleSize = 300;
int value = 0;

void setup() {
  size(1000,1000);
  background(255);
  tabPoint = new PVector[circlePoints];
  float angle = TWO_PI/(circlePoints);
  for(int division=0;division<circlePoints;division++)
  {
    tabPoint[division] = new PVector(circleSize*cos(angle*division),
                                     circleSize*sin(angle*division));
  }
  smooth();
}
void draw()
{
  PVector move = new PVector();
  //background(255);
  noFill();
  stroke(0,20);
  strokeWeight(1);
  translate(width/2,height/2);
  beginShape();
  curveVertex(tabPoint[0].x,tabPoint[0].y);
  for(int division=0;division<circlePoints;division++)
  {
    curveVertex(tabPoint[division].x,tabPoint[division].y);
  } 
 
  curveVertex(tabPoint[0].x,tabPoint[0].y);
  curveVertex(tabPoint[1].x,tabPoint[1].y);
  //curveVertex(tabPoint[2].x,tabPoint[2].y);
  endShape(); 
  //--- Animation
  for(int division=0;division<circlePoints;division++)
  {
    move.x = tabPoint[division].x;
    move.y = tabPoint[division].y;
    move.normalize();
    move.mult(random(-3.5,3.5));
    tabPoint[division].x += move.x;
    tabPoint[division].y += move.y;
  } 
}

void keyPressed() {
  if (value == 0) {
    saveFrame("circle-###.png"); 
  }
}

