void setup() {
  size(1000,1000);
  background(202, 38, 135);
  smooth();
}

int yRand = 1000;
float sizeRand;
int patternRand = floor(random(50,400));
int count = 0;
int countRate = floor(random(0,500));

void draw() {
  if (count % patternRand == 0) {
    noStroke();
    fill(202, 38, 135);
    sizeRand = random(1,10);
  }
  else {
    noStroke();
    fill(random(29,209), random(143,200), 255,random(10,200));
    sizeRand = random(1,100*count/500);
  }
  ellipse(count, (height/2+40) + random(-yRand, yRand), 5 + sizeRand, 5 + sizeRand);
  ellipse(width-count, (height/2-100) + random(-yRand, yRand), 5 + sizeRand, 5 + sizeRand);
  count += countRate;
  if (count > width) {
    count = 0;
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
