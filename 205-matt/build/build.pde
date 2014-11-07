int yRand = 100;
float sizeRand;
int patternRand = floor(random(50,400));
int count = 0;
int countRate = floor(random(0,50));

void setup() {
  size(1000,1000);
  background(40,55,63);
  smooth();
}

void draw() {

  if (count % patternRand == 0) {
    noStroke();
    noFill();
    sizeRand = random(1,10);
  }
  else {
    noFill();
    stroke(230, floor(random(75,139)), 241,random(5,100));
    strokeWeight(2);
    sizeRand = floor(random(5,50));
  }
  pushMatrix();
  translate(random(width),random(height));
  rotate(random(-360,360));
  curve(count, count*400*sin(40*frameCount*PI)+random(-yRand, sin(yRand)), cos(height/2+sin(40*frameCount*PI))+random(-yRand, yRand), count, (height/2+40)+random(-yRand, yRand), (height/2+sin(40*frameCount*PI))+random(-yRand, yRand), (height/20*sin(40*frameCount*PI))+random(-yRand, yRand*sin(40*frameCount*PI)), (height/2+sin(40*frameCount*PI))+random(-yRand, yRand*sin(40*frameCount*PI)));
  popMatrix();

  pushMatrix();
  translate(random(width),random(height));
  rotate(frameCount*random(-360,360));
  noStroke();
  fill(floor(random(10,43)), floor(random(80,177)), 182,floor(random(10,100)));
  ellipse(count, (height/2+40) + random(-yRand, yRand), sizeRand*2, sizeRand*2);
  popMatrix();

  pushMatrix();
  translate(random(width),random(height));
  rotate(frameCount*random(-360,360));
  noStroke();
  fill(floor(random(100,255)), floor(random(100,186)), 241,floor(random(50,86)));
  rect(count, (height/2+40) + random(-yRand, yRand), random(5,50), random(5,1000));
  popMatrix();

  count += countRate;
  if (count > width) {
    count = 0;
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
  if (key == 'r') {
    count = 0;
    setup();
  }
}
