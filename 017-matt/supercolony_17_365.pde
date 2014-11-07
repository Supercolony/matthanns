int value = 0;

HShape  r1, r2, r3;
HTween t1a, t1b;
HTween t2a, t2b;
HTween t3a, t3b;

void setup() {
  size(1280,1280);
  H.init(this).background(#ffffff).autoClear(false);
  smooth();

  // Rect 1 and tween

  r1 = new HShape("geometrics.svg");
  r1
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#ff3399)
    .anchorAt(H.CENTER)
    .loc(125,125)
    .rotation(45)
  ;
  H.add(r1);

  t1a = new HTween()
    .target(r1).property(H.LOCATION)
    .start( r1.x(), r1.y() )
    .end( width - 500, height + 200)
    .ease(0.005)
    .spring(0.96)
  ;
  
  t1b = new HTween()
    .target(r1).property(H.ROTATION)
    .start(-45)
    .end(405)
    .ease(1.005)
    .spring(0.95)
  ;
  
  r2 = new HShape("geometrics.svg");
  r2
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#4b4b4b)
    .anchorAt(H.CENTER)
    .loc(125,125)
    .rotation(45)
  ;
  H.add(r2);

  t2a = new HTween()
    .target(r2).property(H.LOCATION)
    .start( r2.x(), r2.y() )
    .end( width - 400, height + 200)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t2b = new HTween()
    .target(r2).property(H.ROTATION)
    .start(-45)
    .end(405)
    .ease(0.005)
    .spring(0.95)
  ;
  
  r3 = new HShape("geometrics.svg");
  r3
    .enableStyle(false)
    .stroke(#ffffff, 100)
    .strokeWeight(2)
    .fill(#ff9900)
    .anchorAt(H.CENTER)
    .loc(125,125)
    .rotation(45)
  ;
  H.add(r3);

  t3a = new HTween()
    .target(r3).property(H.LOCATION)
    .start( r3.x(), r3.y() )
    .end( width - 300, height + 200)
    .ease(0.005)
    .spring(0.95)
  ;
  
  t3b = new HTween()
    .target(r3).property(H.ROTATION)
    .start(-45)
    .end(725)
    .ease(0.005)
    .spring(0.95)
  ;


}

void draw() {
  H.drawStage();
}

void keyPressed() {
  if (value == 0) {
    saveFrame("supercolony_17_365-###.png"); 
  }
}
