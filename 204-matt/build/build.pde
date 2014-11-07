int yRand = 1000;
float sizeRand;
int patternRand = floor(random(50,400));
int count = 0;
int countRate = floor(random(0,50));

void setup() {
  size(1000,1000);
  background(255, 230, 228);
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
    stroke(252, floor(random(44,106)), 241,floor(random(15,91)));
    strokeWeight(floor(random(1,5)));
    sizeRand = floor(random(5,50));
  }
  pushMatrix();
  rotate(random(-360,360));
  curve(count, (height/2+40)+random(-yRand, yRand), (height/2+40)+random(-yRand, yRand), count, (height/2+40)+random(-yRand, yRand), (height/2+40)+random(-yRand, yRand), (height/2+40)+random(-yRand, yRand), (height/2+40*PI)+random(-yRand, yRand));
  popMatrix();
  pushMatrix();
  rotate(random(-360,360));
  noStroke();
  fill(floor(random(100,252)), floor(random(44,106)), 241,floor(random(15,91)));
  ellipse(count, (height/2+40) + random(-yRand, yRand), sizeRand, sizeRand);
  rect(count, (height/2+40) + random(-yRand, yRand), random(5,200), random(5,200));
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
