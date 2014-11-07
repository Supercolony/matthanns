int yRand = 1000;
float sizeRand;
int patternRand = floor(random(50,400));
int count = 0;
int countRate = floor(random(0,50));

void setup() {
  size(1000,1000);
  background(231, 244, 247);
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
    stroke(floor(random(80,175)), floor(random(176,255)), 241,floor(random(10,205)));
    strokeWeight(floor(random(1,5)));
    sizeRand = floor(random(5,50));
  }
  pushMatrix();

  curve(count, (height/2+40)+random(-yRand, yRand), (height/2+40)+random(-yRand, yRand), count, (height/2+40)+random(-yRand, yRand), (height/2+40)+random(-yRand, yRand), (height/2+40)+random(-yRand, yRand), (height/2+40*PI)+random(-yRand, yRand));
  popMatrix();
  pushMatrix();
  noStroke();
  fill(floor(random(80,175)), floor(random(176,255)), 241,floor(random(50,500)));
  ellipse(count, (height/2+40) + random(-yRand, yRand), sizeRand, sizeRand);
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
